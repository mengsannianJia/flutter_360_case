import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CupertinoSwitchItem extends StatelessWidget {

  final String title;
  final String titleTips;
  final bool value;
  // final Widget? buttonType;
  final ValueChanged<bool> onChanged;

  const CupertinoSwitchItem({
    Key? key,
    required this.title,
    required this.titleTips,
    required this.value,
    // required this.buttonType,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            Column(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Text(
                  titleTips,
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ],
            ),
            CupertinoSwitch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
