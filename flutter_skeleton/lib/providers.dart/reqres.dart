import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:npskeleton/models/auth.dart';
import 'package:npskeleton/models/base_object.dart';
import 'package:npskeleton/models/people.dart';
import 'package:npskeleton/models/user.dart';
import 'package:npskeleton/providers.dart/root.dart';

class ReqResProvider {
  final String baseurl = "https://reqres.in/api";
  RootProvider root;

  ReqResProvider(RootProvider context) : root = context;

  //GET
  Future<User> loadUser(num id) async {
    var response = await http.get(baseurl + "/users/$id");

    if (response.statusCode != 200)
      return User.empty(ResponseHeader.error(response));

    root.setUser(User.fromJson(jsonDecode(response.body)["data"]));

    return User.fromJson(jsonDecode(response.body)["data"]);
  }

  //GET
  Future<Users> loadUsers() async {
    var response = await http.get(
      baseurl + "/users?page=2",
    );

    if (response.statusCode != 200)
      return Users.empty(ResponseHeader.error(response));
    else
      return Users.fromJson(jsonDecode(response.body));
  }

  //POST - REGISTER
  Future<AuthResult> registerUser(AuthUser user) async {
    var response = await http.post(baseurl + "/register", body: user.toJson());

    if (response.statusCode != 200)
      return AuthResult.empty(ResponseHeader.error(response));
    else
      return AuthResult.fromJson(jsonDecode(response.body));
  }

  //POST - CREATE / 201
  Future<PeoPle> createUser(PeoPle people) async {
    var response = await http.post(baseurl + "/users", body: people.toJson());

    if (response.statusCode != 201)
      return PeoPle.empty(ResponseHeader.error(response));
    else
      return PeoPle.fromJson(jsonDecode(response.body));
  }

  //PUT - UPDATE
  Future<PeoPle> putUser(PeoPle people) async {
    var response = await http.put(baseurl + "/users/2", body: people.toJson());

    if (response.statusCode != 200)
      return PeoPle.empty(ResponseHeader.error(response));
    else
      return PeoPle.fromJson(jsonDecode(response.body));
  }

  //PATCH - UPDATE
  Future<PeoPle> patchUser(PeoPle people) async {
    var response =
        await http.patch(baseurl + "/users/2", body: people.toJson());

    if (response.statusCode != 200)
      return PeoPle.empty(ResponseHeader.error(response));
    else
      return PeoPle.fromJson(jsonDecode(response.body));
  }

  //DELETE
  Future<PeoPle> deleteUser(PeoPle people) async {
    var response =
        await http.patch(baseurl + "/users/2", body: people.toJson());

    if (response.statusCode != 204)
      return PeoPle.empty(ResponseHeader.error(response));
    else
      return PeoPle.empty(ResponseHeader.success());
  }
}
