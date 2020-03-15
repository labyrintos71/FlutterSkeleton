import 'package:flutter/material.dart';

class UIProvider with ChangeNotifier {
  bool startedLoading = false;
  bool firstAnimationFinished = false;
  bool dataAvailable = false;
  
  initLoadButton() {
    startedLoading = false;
    firstAnimationFinished = false;
    dataAvailable = false;
  }

  setBool(String valname, bool value) {
    switch (valname) {
      case "startedLoading":
        startedLoading = value;
        break;
      case "dataAvailable":
        dataAvailable = value;
        break;
      case "firstAnimationFinished":
        firstAnimationFinished = value;
        break;
    }
    notifyListeners();
  }
}
