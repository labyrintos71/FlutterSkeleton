import 'package:flutter/material.dart';

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
