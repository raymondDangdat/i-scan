// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

class CityModel {
  dynamic status;
  dynamic message;
  List<CityData> data;

  CityModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        status: json["status"],
        message: json["message"],
        data:
            List<CityData>.from(json["data"].map((x) => CityData.fromJson(x))),
      );
}

class CityData {
  dynamic id;
  dynamic stateId;
  dynamic name;

  CityData({
    required this.id,
    required this.stateId,
    required this.name,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        id: json["id"],
        stateId: json["state_id"],
        name: json["name"],
      );
}
