import 'package:flutter/material.dart';

class TextNotoB extends StatelessWidget {
  final String text;
  TextNotoB(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 40, fontFamily: "NotoSans", fontWeight: FontWeight.w500),
    );
  }
}
