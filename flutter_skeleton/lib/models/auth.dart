import 'package:json_annotation/json_annotation.dart';
import 'package:npskeleton/models/dto.dart';

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
