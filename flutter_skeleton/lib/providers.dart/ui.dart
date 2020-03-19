import 'package:flutter/material.dart';
import 'package:npskeleton/viewmodels/example.dart';

class UIProvider with ChangeNotifier {
  ExampleUI example;
  init() {
    example = ExampleUI(this.refresh());
  }

  refresh() {
    this.notifyListeners();
  }
}
