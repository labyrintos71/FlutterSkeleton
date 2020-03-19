import 'package:flutter/material.dart';

import 'const.dart';

/// Lightw300 = FontWeight._(2);

/// regular w400 = FontWeight._(3);

/// Medium w500 = FontWeight._(4);

/// Semi-bold w600 = FontWeight._(5);

/// Bold w700 = FontWeight._(6);
enum TextType { Light, Regular, Medium, SemiBold, Bold }

FontWeight getFontWeight(TextType type) {
  switch (type) {
    case TextType.Light:
      return FontWeight.w300;
      break;
    case TextType.Regular:
      return FontWeight.w400;
      break;
    case TextType.Medium:
      return FontWeight.w500;
      break;
    case TextType.SemiBold:
      return FontWeight.w600;
      break;
    case TextType.Bold:
      return FontWeight.w700;
      break;
  }
  return FontWeight.w500;
}

class TextMont extends StatelessWidget {
  final String text;
  final num size;
  final Color color;
  final TextType type;
  final double height;

  TextMont(this.text,
      {this.size = 16,
      this.color = text_gray,
      this.type = TextType.Medium,
      this.height = 1.0});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          height: height,
          color: color,
          fontSize: size.toDouble(),
          fontFamily: "Montserrat",
          fontWeight: getFontWeight(type)),
    );
  }
}

class TextNoto extends StatelessWidget {
  final String text;
  final num size;
  final Color color;
  final TextType type;
  final double height;

  TextNoto(this.text,
      {this.size = 16,
      this.color = text_gray,
      this.type = TextType.Medium,
      this.height = 1.0});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          height: height,
          color: color,
          fontSize: size.toDouble(),
          fontFamily: "NotoSans",
          fontWeight: getFontWeight(type)),
    );
  }
}

class TextNunito extends StatelessWidget {
  final String text;
  final num size;
  final Color color;
  final TextType type;
  final double height;

  TextNunito(this.text,
      {this.size = 16,
      this.color = text_gray,
      this.type = TextType.Medium,
      this.height = 1.0});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          height: height,
          color: color,
          fontSize: size.toDouble(),
          fontFamily: "NunitoSans",
          fontWeight: getFontWeight(type)),
    );
  }
}
