import 'package:json_annotation/json_annotation.dart';

class ResponseHeader {
  num statuscode;
  String errormsg;
  ResponseHeader.error(num status, String errormsg) {
    statuscode = status;
    errormsg = errormsg;
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
