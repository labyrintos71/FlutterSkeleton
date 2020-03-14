// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as num,
    json['email'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['avatar'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users(
    json['page'] as num,
    json['per_page'] as num,
    json['total'] as num,
    json['total_pages'] as num,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.personCount,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.users,
    };
