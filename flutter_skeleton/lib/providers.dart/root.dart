import 'package:flutter/material.dart';
import 'package:npskeleton/models/users.dart';

class RootProvider with ChangeNotifier {
  User user;
  String strs;

  setUser(User data) {
    data = user;
    notifyListeners();
  }
}
