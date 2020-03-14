import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';

class ResponseHeader {
  num statuscode;
  String errormsg;
  ResponseHeader.error(Response header) {
    statuscode = header.statusCode;
    errormsg = header.body;
  }
  ResponseHeader.success() {
    statuscode = 200;
    errormsg = "";
  }
}

class BaseDTO {
  @JsonKey(ignore: true)
  ResponseHeader response = ResponseHeader.success();

  BaseDTO setResponseHeader(ResponseHeader header) {
    response = header;
    return this;
  }
}

//flutter pub run build_runner build --delete-conflicting-outputs : 1회 빌드
//flutter pub run build_runner watch : 파일 변경이 발생하면 빌드
