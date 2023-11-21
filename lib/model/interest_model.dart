// To parse this JSON data, do
//
//     final interestModel = interestModelFromJson(jsonString);

import 'dart:convert';

InterestModel interestModelFromJson(String str) =>
    InterestModel.fromJson(json.decode(str));

String interestModelToJson(InterestModel data) => json.encode(data.toJson());

class InterestModel {
  dynamic status;
  dynamic message;
  List<InterestData> data;

  InterestModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory InterestModel.fromJson(Map<String, dynamic> json) => InterestModel(
        status: json["status"],
        message: json["message"],
        data: List<InterestData>.from(
            json["data"].map((x) => InterestData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class InterestData {
  dynamic id;
  dynamic name;
  dynamic parentId;
  dynamic slug;
  dynamic status;
  List<InterestData>? subInterests;

  InterestData({
    required this.id,
    required this.name,
    required this.parentId,
    required this.slug,
    required this.status,
    this.subInterests,
  });

  factory InterestData.fromJson(Map<String, dynamic> json) => InterestData(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        slug: json["slug"],
        status: json["status"],
        subInterests: json["sub_interests"] == null
            ? []
            : List<InterestData>.from(
                json["sub_interests"]!.map((x) => InterestData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "slug": slug,
        "status": status,
        "sub_interests": subInterests == null
            ? []
            : List<dynamic>.from(subInterests!.map((x) => x.toJson())),
      };
}
