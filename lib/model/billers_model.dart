// To parse this JSON data, do
//
//     final billersModel = billersModelFromJson(jsonString);

import 'dart:convert';

BillersModel billersModelFromJson(String str) =>
    BillersModel.fromJson(json.decode(str));

String billersModelToJson(BillersModel data) => json.encode(data.toJson());

class BillersModel {
  bool success;
  List<String> data;
  String message;

  BillersModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory BillersModel.fromJson(Map<String, dynamic> json) => BillersModel(
        success: json["success"],
        data: List<String>.from(json["data"].map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x)),
        "message": message,
      };
}
