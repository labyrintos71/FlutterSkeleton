import 'package:flutter/material.dart';
import 'package:npskeleton/models/user.dart';

class RootProvider with ChangeNotifier {
  User user;
  String strs;

  setUser(User data) {
    data = user;
    notifyListeners();
  }
}
