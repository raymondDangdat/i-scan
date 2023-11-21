// To parse this JSON data, do
//
//     final singleProductModel = singleProductModelFromJson(jsonString);

import 'dart:convert';

import 'package:i_scan/model/products_model.dart';

SingleProductModel singleProductModelFromJson(String str) =>
    SingleProductModel.fromJson(json.decode(str));

class SingleProductModel {
  String message;
  Product data;
  bool success;

  SingleProductModel({
    required this.message,
    required this.data,
    required this.success,
  });

  factory SingleProductModel.fromJson(Map<String, dynamic> json) =>
      SingleProductModel(
        message: json["message"],
        data: Product.fromJson(json["data"]),
        success: json["success"],
      );
}
