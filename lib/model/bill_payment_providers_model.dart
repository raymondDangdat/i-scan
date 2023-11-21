// To parse this JSON data, do
//
//     final electricityProvidersModel = electricityProvidersModelFromJson(jsonString);

import 'dart:convert';

BillPaymentProvidersModel billPaymentProvidersModelFromJson(String str) =>
    BillPaymentProvidersModel.fromJson(json.decode(str));

String electricityProvidersModelToJson(BillPaymentProvidersModel data) =>
    json.encode(data.toJson());

class BillPaymentProvidersModel {
  bool success;
  List<BillPaymentProviderData> data;
  String message;

  BillPaymentProvidersModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory BillPaymentProvidersModel.fromJson(Map<String, dynamic> json) =>
      BillPaymentProvidersModel(
        success: json["success"],
        data: List<BillPaymentProviderData>.from(
            json["data"].map((x) => BillPaymentProviderData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class BillPaymentProviderData {
  dynamic desc;
  dynamic id;
  dynamic name;
  dynamic sector;

  BillPaymentProviderData({
    required this.desc,
    required this.id,
    required this.name,
    required this.sector,
  });

  factory BillPaymentProviderData.fromJson(Map<String, dynamic> json) =>
      BillPaymentProviderData(
        desc: json["desc"],
        id: json["id"],
        name: json["name"],
        sector: json["sector"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "id": id,
        "name": name,
        "sector": sector,
      };
}
