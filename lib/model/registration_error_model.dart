// To parse this JSON data, do
//
//     final registrationErrorModel = registrationErrorModelFromJson(jsonString);

import 'dart:convert';

RegistrationErrorModel registrationErrorModelFromJson(String str) =>
    RegistrationErrorModel.fromJson(json.decode(str));

class RegistrationErrorModel {
  dynamic message;
  Error? error;
  dynamic status;
  Body? body;
  dynamic success;

  RegistrationErrorModel({
    required this.message,
    required this.error,
    required this.status,
    required this.body,
    required this.success,
  });

  factory RegistrationErrorModel.fromJson(Map<String, dynamic> json) =>
      RegistrationErrorModel(
        message: json["message"],
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
        status: json["status"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        success: json["success"],
      );
}

class Body {
  dynamic message;
  dynamic errorCode;
  List<ErrorDetail>? errorDetails;

  Body({
    required this.message,
    required this.errorCode,
    required this.errorDetails,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        message: json["message"],
        errorCode: json["errorCode"],
        errorDetails: json["errorDetails"] == null
            ? null
            : List<ErrorDetail>.from(
                json["errorDetails"].map((x) => ErrorDetail.fromJson(x))),
      );
}

class ErrorDetail {
  Value? value;
  String msg;
  String param;
  String location;

  ErrorDetail({
    required this.value,
    required this.msg,
    required this.param,
    required this.location,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) => ErrorDetail(
        value: json["value"] == null ? null : Value.fromJson(json["value"]),
        msg: json["msg"],
        param: json["param"],
        location: json["location"],
      );
}

class Value {
  dynamic countryCode;
  dynamic number;

  Value({
    required this.countryCode,
    required this.number,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        countryCode: json["countryCode"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "number": number,
      };
}

class Error {
  Cookies? cookies;
  Cookies? transferStats;

  Error({
    required this.cookies,
    required this.transferStats,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        cookies:
            json["cookies"] == null ? null : Cookies.fromJson(json["cookies"]),
        transferStats: json["transferStats"] == null
            ? null
            : Cookies.fromJson(json["transferStats"]),
      );
}

class Cookies {
  Cookies();

  factory Cookies.fromJson(Map<String, dynamic> json) => Cookies();

  Map<String, dynamic> toJson() => {};
}
