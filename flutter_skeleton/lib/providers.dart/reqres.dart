import 'package:dio/dio.dart';
import 'package:npskeleton/models/users.dart';

class ReqResProvider {
  final String url = "https://reqres.in/api";
  Stream<User> loaduser() {
    return Stream.fromFuture(loadUser(0));
  }

  Future<User> loadUser(num id) async {
    Dio dio = new Dio();
    Response response = await dio.get("/users", queryParameters: {"page": id});
    print(response.data.toString());
    return User.fromJson(response.data["data"]);
  }

  Future<Users> loadUsers() async {
    Dio dio = new Dio();
    Response response = await dio.get("https://reqres.in/api/users?page=2");
    print(response.data.toString());
    return Users.fromJson(response.data);
  }
}
