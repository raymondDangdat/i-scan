// To parse this JSON data, do
//
//     final beneficiaryModel = beneficiaryModelFromJson(jsonString);

import 'dart:convert';

BeneficiaryModel beneficiaryModelFromJson(String str) =>
    BeneficiaryModel.fromJson(json.decode(str));

class BeneficiaryModel {
  dynamic status;
  dynamic message;
  Data data;

  BeneficiaryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) =>
      BeneficiaryModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  dynamic currentPage;
  List<Beneficiary> data;
  dynamic firstPageUrl;
  dynamic from;
  dynamic lastPage;
  dynamic lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  dynamic path;
  dynamic perPage;
  dynamic prevPageUrl;
  dynamic to;
  dynamic total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Beneficiary>.from(
            json["data"].map((x) => Beneficiary.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );
}

class Beneficiary {
  dynamic id;
  dynamic customerId;
  dynamic name;
  dynamic category;
  dynamic accountNumber;
  dynamic bankCode;
  dynamic bankName;
  dynamic deviceNumber;
  dynamic status;
  dynamic nickname;

  Beneficiary({
    required this.id,
    required this.customerId,
    required this.name,
    required this.category,
    required this.accountNumber,
    required this.bankCode,
    required this.bankName,
    required this.deviceNumber,
    required this.status,
    required this.nickname,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) => Beneficiary(
        id: json["id"],
        customerId: json["customer_id"],
        name: json["name"],
        category: json["category"],
        accountNumber: json["account_number"],
        bankCode: json["bank_code"],
        bankName: json["bank_name"],
        deviceNumber: json["device_number"],
        status: json["status"],
        nickname: json["nickname"],
      );
}

class Link {
  dynamic url;
  dynamic label;
  dynamic active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );
}
