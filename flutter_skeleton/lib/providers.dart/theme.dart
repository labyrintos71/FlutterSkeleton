import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeData dark = ThemeData(brightness: Brightness.dark);
  final ThemeData light = ThemeData(
      brightness: Brightness.light,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS:
              CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
        },
      ),
      primaryColor: Colors.white,
      accentColor: Color(0xff1c1fff));
  // accentColor: Color(0xff40bf7a),
  //   textTheme: TextTheme(
  //       title: TextStyle(color: Colors.black54),
  //       subtitle: TextStyle(color: Colors.grey),
  //       subhead: TextStyle(color: Colors.white)),
  //   appBarTheme: AppBarTheme(
  //       color: Color(0xff1f655d),
  //       actionsIconTheme: IconThemeData(color: Colors.white)
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
