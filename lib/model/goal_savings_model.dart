// To parse this JSON data, do
//
//     final goalSavingsModel = goalSavingsModelFromJson(jsonString);

import 'dart:convert';

GoalSavingsModel goalSavingsModelFromJson(String str) =>
    GoalSavingsModel.fromJson(json.decode(str));

String goalSavingsModelToJson(GoalSavingsModel data) =>
    json.encode(data.toJson());

class GoalSavingsModel {
  List<SavingData> data;
  Links links;
  Meta meta;
  String message;
  bool success;

  GoalSavingsModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.success,
  });

  factory GoalSavingsModel.fromJson(Map<String, dynamic> json) =>
      GoalSavingsModel(
        data: List<SavingData>.from(
            json["data"].map((x) => SavingData.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
        "message": message,
        "success": success,
      };
}

class SavingData {
  dynamic id;
  dynamic title;
  dynamic amount;
  dynamic overallTargetAmount;
  dynamic primarySource;
  dynamic savingFrequency;
  dynamic balance;
  DateTime? startDate;
  DateTime? matureDate;
  dynamic savingsStatus;
  dynamic savingsType;
  dynamic savingMethod;
  dynamic lastDepositedDate;
  dynamic locked;
  DateTime createdAt;
  DateTime updatedAt;

  dynamic deletedAt;

  SavingData({
    required this.id,
    required this.title,
    required this.amount,
    required this.overallTargetAmount,
    required this.primarySource,
    required this.savingFrequency,
    required this.balance,
    required this.startDate,
    required this.matureDate,
    required this.savingsStatus,
    required this.savingsType,
    required this.savingMethod,
    required this.lastDepositedDate,
    required this.locked,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory SavingData.fromJson(Map<String, dynamic> json) => SavingData(
        id: json["id"],
        title: json["title"],
        amount: json["amount"],
        overallTargetAmount: json["overall_target_amount"],
        primarySource: json["primary_source"],
        savingFrequency: json["saving_frequency"],
        balance: json["balance"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        matureDate: json["mature_date"] == null
            ? null
            : DateTime.parse(json["mature_date"]),
        savingsStatus: json["savings_status"],
        savingsType: json["savings_type"],
        savingMethod: json["saving_method"],
        lastDepositedDate: json["last_deposited_date"],
        locked: json["locked"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "amount": amount,
        "overall_target_amount": overallTargetAmount,
        "primary_source": primarySource,
        "saving_frequency": savingFrequency,
        "balance": balance,
        "start_date":
            "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
        "mature_date":
            "${matureDate?.year.toString().padLeft(4, '0')}-${matureDate?.month.toString().padLeft(2, '0')}-${matureDate?.day.toString().padLeft(2, '0')}",
        "savings_status": savingsStatus,
        "savings_type": savingsType,
        "saving_method": savingMethod,
        "last_deposited_date": lastDepositedDate,
        "locked": locked,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class Links {
  dynamic first;
  dynamic last;
  dynamic prev;
  dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  dynamic currentPage;
  dynamic from;
  dynamic lastPage;
  List<Link> links;
  dynamic path;
  dynamic perPage;
  dynamic to;
  dynamic total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
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

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
