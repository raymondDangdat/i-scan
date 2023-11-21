// To parse this JSON data, do
//
//     final shippingModel = shippingModelFromJson(jsonString);

import 'dart:convert';

import 'package:i_scan/model/products_model.dart';

ShippingModel shippingModelFromJson(String str) =>
    ShippingModel.fromJson(json.decode(str));

class ShippingModel {
  List<ShippingData> data;
  String message;
  bool success;

  ShippingModel({
    required this.data,
    required this.message,
    required this.success,
  });

  factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
        data: List<ShippingData>.from(
            json["data"].map((x) => ShippingData.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );
}

class ShippingData {
  dynamic id;
  State state;
  dynamic amount;

  ShippingData({
    required this.id,
    required this.state,
    required this.amount,
  });

  factory ShippingData.fromJson(Map<String, dynamic> json) => ShippingData(
        id: json["id"],
        state: State.fromJson(json["state"]),
        amount: json["amount"],
      );
}
