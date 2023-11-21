// To parse this JSON data, do
//
//     final banksModel = banksModelFromJson(jsonString);

import 'dart:convert';

BanksModel banksModelFromJson(String str) =>
    BanksModel.fromJson(json.decode(str));

String banksModelToJson(BanksModel data) => json.encode(data.toJson());

class BanksModel {
  bool status;
  List<BankData> data;

  BanksModel({
    required this.status,
    required this.data,
  });

  factory BanksModel.fromJson(Map<String, dynamic> json) => BanksModel(
        status: json["status"],
        data:
            List<BankData>.from(json["data"].map((x) => BankData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BankData {
  dynamic bankName;
  dynamic shortCode;
  dynamic bankCode;

  BankData({
    required this.bankName,
    required this.shortCode,
    required this.bankCode,
  });

  factory BankData.fromJson(Map<String, dynamic> json) => BankData(
        bankName: json["bank_name"],
        shortCode: json["short_code"],
        bankCode: json["bank_code"],
      );

  Map<String, dynamic> toJson() => {
        "bank_name": bankName,
        "short_code": shortCode,
        "bank_code": bankCode,
      };
}
