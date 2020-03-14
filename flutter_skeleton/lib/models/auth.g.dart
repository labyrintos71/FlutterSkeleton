// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) {
  return AuthUser(
    json['email'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$AuthUserToJson(AuthUser instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

AuthResult _$AuthResultFromJson(Map<String, dynamic> json) {
  return AuthResult(
    json['id'] as num,
    json['token'] as String,
  );
}

Map<String, dynamic> _$AuthResultToJson(AuthResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
    };
