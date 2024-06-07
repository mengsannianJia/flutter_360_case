import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_360_case/http/NetworkService.dart';
import 'package:flutter_360_case/page/homePage.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String hintTextStr = "Enter your text here Enter your text here";

  late int maxLinesValue;
  late bool state = false;
  NetworkService  http = NetworkService();

  @override
  void initState() {
    super.initState();
    maxLinesValue = hintTextStr.contains('\n') ? 2 : 1;
  }
  Future<bool?> getPirSwitch() async {
    try {
      final response = await http.post('m1/4547034-4195117-default/buttonStatue');
      final responseData = jsonDecode(response.data);
      if (responseData.containsKey('buttonStatue') && responseData['buttonStatue'] is List) {
        setState(() {
          state = responseData['buttonStatue'];
        });
      } else {
        print('错误:没有找到图像url或格式无效');
      }
    } catch (error) {
      print("获取图像数据出错: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: TextField(
            decoration: InputDecoration(
              hintText: state.toString(),
              border: OutlineInputBorder(),
            ),
            maxLines: maxLinesValue,
            onChanged: (value) {
              setState(() {
                // 根据输入内容的长度动态调整 maxLines
                maxLinesValue = value.isEmpty ? 2 : 1;
              });
            },
          ),
        ),
      ),
    );
  }
}
