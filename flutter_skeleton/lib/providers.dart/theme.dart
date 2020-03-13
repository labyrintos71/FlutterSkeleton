import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeData dark = ThemeData(brightness: Brightness.dark);
  final ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      accentColor: Color(0xff1c1fff));

  ThemeData _theme;

  ThemeProvider() {
    _theme = light;
  }

  getTheme() => _theme;

  setTheme(ThemeData themeData) {
    _theme = themeData;
    notifyListeners();
  }

  switchTheme() {
    if (_theme == dark)
      _theme = light;
    else
      _theme = dark;
    notifyListeners();
  }
}
