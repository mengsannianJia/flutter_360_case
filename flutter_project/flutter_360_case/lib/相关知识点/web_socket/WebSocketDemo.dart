import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_360_case/%E7%9B%B8%E5%85%B3%E7%9F%A5%E8%AF%86%E7%82%B9/web_socket/WebSocketManager.dart';

class WebSocketDemo extends StatefulWidget {
  @override
  _WebSocketDemoState createState() => _WebSocketDemoState();
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  // 创建 WebSocketManager 实例
  late WebSocketManager _webSocketManager;

  @override
  void initState() {
    super.initState();
    // 初始化 WebSocket 连接
    _webSocketManager = WebSocketManager('wss://your.websocket.url');
    _webSocketManager.connect();
  }

  @override
  void dispose() {
    // TODO 断开连接
    _webSocketManager.disconnect();
    super.dispose();
  }

  // 发送消息到 WebSocket 服务器
  void _sendMessage() {
    _webSocketManager.sendMessage(jsonEncode({'message': 'Hello, WebSocket!'}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendMessage,
          child: Text('Send Message'),
        ),
      ),
    );
  }
}
