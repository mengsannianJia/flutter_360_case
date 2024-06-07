import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isLoading = true;
  bool _hasError = false;
  bool _isVisible = true;
  Timer? _hideButtonTimer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          _controller.play(); // Default state is play
          _startHideButtonTimer();
        }
      }).catchError((error) {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _hasError = true;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideButtonTimer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isVisible = true;
        _hideButtonTimer?.cancel();
      } else {
        _controller.play();
        _startHideButtonTimer();
      }
    });
  }

  void _startHideButtonTimer() {
    _hideButtonTimer?.cancel();
    _hideButtonTimer = Timer(Duration(seconds: 3), () {
      setState(() {
        _isVisible = false;
      });
    });
  }

  void _onTap() {
    if (_isVisible) {
      _togglePlayPause();
    } else {
      setState(() {
        _isVisible = true;
        _startHideButtonTimer();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (_hasError) {
      return Center(child: Text('Failed to load video'));
    } else {
      return GestureDetector(
        onTap: _onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            Visibility(
              visible: _isVisible,
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 60.0,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  playedColor: Colors.blue,
                  bufferedColor: Colors.lightBlueAccent,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}