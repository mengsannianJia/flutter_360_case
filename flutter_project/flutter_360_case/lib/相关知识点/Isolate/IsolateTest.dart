import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IsolateTesteState();
}

class IsolateTesteState extends State {
  @override
  void initState() async {
    super.initState();
    // 主Isolate的ReceivePort
    ReceivePort receivePort = ReceivePort();
    SendPort? otherSendPort;
    // 主Isolate接收到子Isolate中由主Isolate的SendPort发送过来的消息
    receivePort.listen((message) {
      if (message is SendPort) {
        otherSendPort = message;
      } else {
        // 处理消息
        print(
            "主Isolate接收到子Isolate中由主Isolate的SendPort发送过来的消息 ------ 消息处理:$message");
        // 子Isolate的SendPort在主Isolate中向子Isolate发送消息
        otherSendPort?.send('我是来自主Isolate的消息');
      }
    });

    // 创建子Isolate
    Isolate isolate = await Isolate.spawn((message) {
      // message 是主Isolate的SendPort

      // 在子Isolate中创建一个新的ReceivePort
      ReceivePort childReceivePort = ReceivePort();
      // 主Isolate的SendPort
      SendPort? mainSendPort;

      // 运用主Isolate的SendPort将子Isolate的SendPort发送给主Isolate
      message.send(childReceivePort.sendPort);
      // 子Isolate监听接收到主Isolate那边发送的消息 谁发送？子Isolate的SendPort
      childReceivePort.listen((msg) {
        if (msg is SendPort) {
          mainSendPort = msg;
        } else {
          // 主Isolate的SendPort向主Isolate发送消息
          mainSendPort?.send('我是来自子Isolate的消息');
        }
      });
    }, receivePort.sendPort); // 参数二 将主Isolate的SendPort传递给子Isolate
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("Isolate test");
  }

  // await for遍历stream流中的数据
  Stream<String> stream = new Stream<String>.fromIterable(['1', '2', '3', '4']);
  ergodicStream() async {
    await for (String s in stream) {
      print(s);
    }
  }
}
