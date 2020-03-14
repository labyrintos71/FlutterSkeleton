import 'package:json_annotation/json_annotation.dart';
import 'package:npskeleton/models/base_object.dart';

part 'user.g.dart';

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

@JsonSerializable()
class PeoPle extends BaseDTO {
  num name;

  num job;

  PeoPle(this.name, this.job);
  PeoPle.empty(ResponseHeader header) {
    response = header;
  }
  factory PeoPle.fromJson(Map<String, dynamic> json) => _$PeoPleFromJson(json);
  Map<String, dynamic> toJson() => _$PeoPleToJson(this);
}
