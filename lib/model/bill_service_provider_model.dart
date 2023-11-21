// To parse this JSON data, do
//
//     final billServiceProvidersModel = billServiceProvidersModelFromJson(jsonString);

import 'dart:convert';

BillServiceProvidersModel billServiceProvidersModelFromJson(String str) =>
    BillServiceProvidersModel.fromJson(json.decode(str));

class BillServiceProvidersModel {
  bool success;
  List<BillServiceProvider> data;
  String message;

  BillServiceProvidersModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory BillServiceProvidersModel.fromJson(Map<String, dynamic> json) =>
      BillServiceProvidersModel(
        success: json["success"],
        data: List<BillServiceProvider>.from(
            json["data"].map((x) => BillServiceProvider.fromJson(x))),
        message: json["message"],
      );
}

class BillServiceProvider {
  dynamic desc;
  dynamic id;
  dynamic name;
  dynamic sector;

  BillServiceProvider({
    required this.desc,
    required this.id,
    required this.name,
    required this.sector,
  });

  factory BillServiceProvider.fromJson(Map<String, dynamic> json) =>
      BillServiceProvider(
        desc: json["desc"],
        id: json["id"],
        name: json["name"],
        sector: json["sector"],
      );
}
