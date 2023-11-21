// To parse this JSON data, do
//
//     final airtimeAndDataProductModel = airtimeAndDataProductModelFromJson(jsonString);

import 'dart:convert';

BillProductModel billProductModelFromJson(String str) =>
    BillProductModel.fromJson(json.decode(str));

class BillProductModel {
  bool success;
  List<BillProductData> data;
  String message;

  BillProductModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory BillProductModel.fromJson(Map<String, dynamic> json) =>
      BillProductModel(
        success: json["success"],
        data: List<BillProductData>.from(
            json["data"].map((x) => BillProductData.fromJson(x))),
        message: json["message"],
      );
}

class BillProductData {
  dynamic category;
  dynamic desc;
  dynamic feeType;
  String id;
  Meta meta;
  String name;
  dynamic datumOperator;

  BillProductData({
    required this.category,
    this.desc,
    required this.feeType,
    required this.id,
    required this.meta,
    required this.name,
    required this.datumOperator,
  });

  factory BillProductData.fromJson(Map<String, dynamic> json) =>
      BillProductData(
        category: json["category"],
        desc: json["desc"],
        feeType: json["fee_type"],
        id: json["id"],
        meta: Meta.fromJson(json["meta"]),
        name: json["name"],
        datumOperator: json["operator"],
      );
}

class Meta {
  dynamic currency;
  String? maximumFee;
  String? minimumFee;
  String? dataExpiry;
  String? dataValue;
  String? fee;

  Meta({
    required this.currency,
    this.maximumFee,
    this.minimumFee,
    this.dataExpiry,
    this.dataValue,
    this.fee,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currency: json["currency"],
        maximumFee: json["maximum_fee"],
        minimumFee: json["minimum_fee"],
        dataExpiry: json["data_expiry"],
        dataValue: json["data_value"],
        fee: json["fee"],
      );
}
