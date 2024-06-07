import 'package:flutter/material.dart';
import '../../components/VideoPlayerWidget.dart';

class PIPVideoWidget extends StatefulWidget {
  final String videoUrl;

  PIPVideoWidget({required this.videoUrl});

  @override
  _PIPVideoWidgetState createState() => _PIPVideoWidgetState();
}

class _PIPVideoWidgetState extends State<PIPVideoWidget> {
  double _top = 100.0;
  double _left = 100.0;
  bool _showCloseButton = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      left: _left,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _top += details.delta.dy;
            _left += details.delta.dx;
          });
        },
        onTap: () {
          setState(() {
            _showCloseButton = true;
          });
        },
        child: Stack(
          children: [
            Visibility(
              visible: _showCloseButton,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _showCloseButton = false;
                  });
                },
              ),
            ),
            Container(
              width: 200,
              height: 115,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9, // 设置视频宽高比
                  child: VideoPlayerWidget(videoUrl: widget.videoUrl),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}