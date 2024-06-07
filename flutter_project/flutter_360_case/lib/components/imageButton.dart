import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  ImageButton({required this.imagePath, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            imagePath,
            width: 30,
            height: 30,
          ),
          SizedBox(height: 2), // 添加间距
          Text(text,style: TextStyle(fontSize: 10),),
        ],
      ),
    );
  }
}