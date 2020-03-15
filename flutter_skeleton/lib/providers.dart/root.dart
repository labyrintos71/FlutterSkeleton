import 'package:flutter/material.dart';
import 'package:npskeleton/models/user.dart';

class RootProvider with ChangeNotifier {
  User user;
  
  setUser(User data) {
    user = data;
    notifyListeners();
  }
}
