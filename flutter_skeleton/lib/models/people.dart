import 'package:json_annotation/json_annotation.dart';
import 'package:npskeleton/models/base_object.dart';

part 'people.g.dart';

@JsonSerializable()
class PeoPle extends BaseDTO {
  String name;
  String job;
  //널일경우 json 안만듬, 넣을때 null 일수도 있음
  @JsonKey(disallowNullValue: true, nullable: true)
  String id;
  PeoPle(this.name, this.job);
  PeoPle.empty(ResponseHeader header) {
    response = header;
  }
  factory PeoPle.fromJson(Map<String, dynamic> json) => _$PeoPleFromJson(json);
  Map<String, dynamic> toJson() => _$PeoPleToJson(this);
}
