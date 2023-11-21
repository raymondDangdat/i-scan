// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'dart:convert';

StoreModel storeModelFromJson(String str) =>
    StoreModel.fromJson(json.decode(str));

class StoreModel {
  dynamic message;
  StoreData data;
  bool success;

  StoreModel({
    required this.message,
    required this.data,
    required this.success,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        message: json["message"],
        data: StoreData.fromJson(json["data"]),
        success: json["success"],
      );
}

class StoreData {
  dynamic name;
  dynamic address;
  dynamic description;
  dynamic logo;
  dynamic status;

  StoreData({
    required this.name,
    required this.address,
    required this.description,
    required this.logo,
    required this.status,
  });

  factory StoreData.fromJson(Map<String, dynamic> json) => StoreData(
        name: json["name"],
        address: json["address"],
        description: json["description"],
        logo: json["logo"],
        status: json["status"],
      );
}
