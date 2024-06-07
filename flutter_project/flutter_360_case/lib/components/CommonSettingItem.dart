import 'package:flutter/material.dart';


class CommonSettingItem extends StatelessWidget {

  final String title;
  final String hint;
  final VoidCallback onTap;

  const CommonSettingItem({
    Key? key,
    required this.title,
    required this.hint,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey[300]!),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Text(
              hint,
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
