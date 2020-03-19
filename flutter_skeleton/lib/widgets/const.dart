import 'package:flutter/material.dart';

const text_gray = Color(0xff333333);
const border_gray = Color(0xffcccccc);

class Space extends StatelessWidget {
  final num size;
  Space(this.size);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.toDouble(),
      height: size.toDouble(),
    );
  }
}
