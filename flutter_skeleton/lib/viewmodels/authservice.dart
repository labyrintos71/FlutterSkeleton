import 'dart:async';

import 'package:npskeleton/models/users.dart';
import 'package:npskeleton/providers.dart/reqres.dart';

class AuthenticationService {
  final ReqResProvider _api;

  AuthenticationService(ReqResProvider api) : _api = api;

  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> loadUser(int userId) async {
    var fetchedUser = await _api.loadUser(userId);
    print(fetchedUser.firstName);
    _userController.add(fetchedUser);
    return true;
  }
}
