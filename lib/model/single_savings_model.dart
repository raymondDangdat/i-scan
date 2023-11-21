// To parse this JSON data, do
//
//     final singleSavingModel = singleSavingModelFromJson(jsonString);

import 'dart:convert';

import 'goal_savings_model.dart';

SingleSavingModel singleSavingModelFromJson(String str) =>
    SingleSavingModel.fromJson(json.decode(str));

String singleSavingModelToJson(SingleSavingModel data) =>
    json.encode(data.toJson());

class SingleSavingModel {
  SavingData data;
  String message;
  bool success;

  SingleSavingModel({
    required this.data,
    required this.message,
    required this.success,
  });

  factory SingleSavingModel.fromJson(Map<String, dynamic> json) =>
      SingleSavingModel(
        data: SavingData.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "success": success,
      };
}
