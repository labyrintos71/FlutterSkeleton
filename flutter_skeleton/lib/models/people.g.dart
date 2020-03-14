// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeoPle _$PeoPleFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['id']);
  return PeoPle(
    json['name'] as String,
    json['job'] as String,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$PeoPleToJson(PeoPle instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'job': instance.job,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}
