import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:npskeleton/models/dto.dart';
import 'package:npskeleton/models/users.dart';
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

  Future<User> creatUser() async {
    var response = await http.get(baseurl + "/users");

    if (response.statusCode != 200) return User.empty(errorMessage(response));

    return User.fromJson(jsonDecode(response.body));
  }

  Future<Users> loadUsers() async {
    var response = await http.get(
      baseurl + "/users?page=2",
    );

    if (response.statusCode != 200) return Users.empty(errorMessage(response));

    return Users.fromJson(jsonDecode(response.body));
  }
}
