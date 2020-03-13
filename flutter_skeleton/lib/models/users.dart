import 'package:json_annotation/json_annotation.dart';
import 'package:npskeleton/models/dto.dart';

part 'users.g.dart';

@JsonSerializable()
class User extends BaseDTO {
  num id;

  String email;

  @JsonKey(name: 'first_name')
  String firstName;

  @JsonKey(name: 'last_name')
  String lastName;

  String avatar;

  User(this.id, this.email, this.firstName, this.lastName, this.avatar);

  User.empty(ResponseHeader header) {
    response = header;
  }
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Users extends BaseDTO {
  num page;

  @JsonKey(name: 'per_page')
  num personCount;

  num total;

  @JsonKey(name: 'total_pages')
  num totalPages;

  @JsonKey(name: 'data')
  List<User> users = [];
  
  Users(this.page, this.personCount, this.total, this.totalPages, this.users);
  Users.empty(ResponseHeader header) {
    response = header;
  }
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
//flutter pub run build_runner build--delete-conflicting-outputs : 1회 빌드
//flutter pub run build_runner watch : 파일 변경이 발생하면 빌드
