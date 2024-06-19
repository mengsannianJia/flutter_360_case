import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketManager {
  // WebSocket连接地址
  final String url;
  // WebSocketChannel连接通道
  WebSocketChannel? _channel;
  // 心跳包定时器
  Timer? _heartbeatTimer;
  // 断线重连定时器
  Timer? _reconnectTimer;

  WebSocketManager(this.url);

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(url));

    _channel!.stream.listen(
      (message) {
        // 处理接收到的消息
        print('处理接收到的消息 ---- Received: $message');
      },
      // 连接断开
      onDone: () {
        print('Disconnected');
        _reconnect();
      },
      // 连接错误
      onError: (error) {
        print('Error: $error');
        _reconnect();
      },
    );

    // 发送心跳包
    _startHeartbeat();
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_channel != null && _channel!.sink != null) {
        _channel!.sink.add(jsonEncode({'type': 'heartbeat'}));
      }
    });
  }

  // 断线重连
  void _reconnect() {
    _heartbeatTimer?.cancel();
    _reconnectTimer = Timer(Duration(seconds: 5), () {
      connect();
    });
  }

  // 消息重发
  void sendMessage(String message) {
    if (_channel != null && _channel!.sink != null) {
      _channel!.sink.add(message);
    }
  }

  // 断开连接
  void disconnect() {
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();
    _channel?.sink.close(status.goingAway);
  }
}
