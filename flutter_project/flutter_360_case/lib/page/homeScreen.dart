import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../components/imageButton.dart';
import 'PinP/PinPScress.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageButton(
                  imagePath: 'image/PinP_icon.svg',
                  text: '画中画',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PinPScress())
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
