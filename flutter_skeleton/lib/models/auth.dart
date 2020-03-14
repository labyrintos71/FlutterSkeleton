import 'package:json_annotation/json_annotation.dart';
import 'package:npskeleton/models/base_object.dart';

part 'auth.g.dart';

@JsonSerializable()
class AuthUser extends BaseDTO {
  String email;
  String password;

  AuthUser(this.email, this.password);

  AuthUser.empty(ResponseHeader header) {
    response = header;
  }
  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
  Map<String, dynamic> toJson() => _$AuthUserToJson(this);
}

@JsonSerializable()
class AuthResult extends BaseDTO {
  num id;
  String token;

  AuthResult(this.id, this.token);

  AuthResult.empty(ResponseHeader header) {
    response = header;
  }
  factory AuthResult.fromJson(Map<String, dynamic> json) =>
      _$AuthResultFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResultToJson(this);
}
