import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../components/VideoPlayerWidget.dart';
import 'PIPVideoWidget.dart';

class PinPScress extends StatefulWidget {
  @override
  _PinPScressState createState() => _PinPScressState();
}

class _PinPScressState extends State<PinPScress> {
  bool _showPIP = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter PiP Example'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(_showPIP ? Icons.close : Icons.picture_in_picture),
              onPressed: () {
                setState(() {
                  _showPIP = !_showPIP;
                });
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Center(
              child: VideoPlayerWidget(videoUrl: 'https://media.w3.org/2010/05/sintel/trailer.mp4'),
            ),
            if (_showPIP) PIPVideoWidget(videoUrl: 'https://media.w3.org/2010/05/sintel/trailer.mp4')
          ],
        ),
      ),
    );
  }
}
