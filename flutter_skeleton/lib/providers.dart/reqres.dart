import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:npskeleton/models/auth.dart';
import 'package:npskeleton/models/base_object.dart';
import 'package:npskeleton/models/user.dart';
import 'package:npskeleton/providers.dart/root.dart';

class ReqResProvider {
  final String baseurl = "https://reqres.in/api";
  RootProvider root;

  ReqResProvider(RootProvider context) : root = context;

  ResponseHeader errorMessage(Response response) {
    return ResponseHeader.error(response.statusCode, response.body);
  }

  Future<User> loadUser(num id) async {
    var response = await http.get(baseurl + "/users/$id");

    if (response.statusCode != 200) return User.empty(errorMessage(response));

    root.setUser(User.fromJson(jsonDecode(response.body)["data"]));

    return User.fromJson(jsonDecode(response.body)["data"]);
  }

  Future<Users> loadUsers() async {
    var response = await http.get(
      baseurl + "/users?page=2",
    );

    if (response.statusCode != 200) return Users.empty(errorMessage(response));

    return Users.fromJson(jsonDecode(response.body));
  }

  Future<AuthResult> registerUser(AuthUser user) async {
    var response = await http.post(baseurl + "/register", body: user.toJson());

    if (response.statusCode != 200)
      return AuthResult.empty(errorMessage(response));

    return AuthResult.fromJson(jsonDecode(response.body));
  }
}
