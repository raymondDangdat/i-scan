// To parse this JSON data, do
//
//     final advertTemplateModel = advertTemplateModelFromJson(jsonString);

import 'dart:convert';

AdvertTemplateModel advertTemplateModelFromJson(String str) =>
    AdvertTemplateModel.fromJson(json.decode(str));

class AdvertTemplateModel {
  List<AdvertTemplateData> data;
  Links links;
  Meta meta;
  String message;
  bool success;

  AdvertTemplateModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.success,
  });

  factory AdvertTemplateModel.fromJson(Map<String, dynamic> json) =>
      AdvertTemplateModel(
        data: List<AdvertTemplateData>.from(
            json["data"].map((x) => AdvertTemplateData.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        message: json["message"],
        success: json["success"],
      );
}

class AdvertTemplateData {
  dynamic id;
  dynamic title;
  dynamic description;
  dynamic socialMedia;
  dynamic amount;
  dynamic action;
  Relationships relationships;

  AdvertTemplateData({
    required this.id,
    required this.title,
    required this.description,
    required this.socialMedia,
    required this.amount,
    required this.action,
    required this.relationships,
  });

  factory AdvertTemplateData.fromJson(Map<String, dynamic> json) =>
      AdvertTemplateData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        socialMedia: json["social_media"],
        amount: json["amount"],
        action: json["action"],
        relationships: Relationships.fromJson(json["relationships"]),
      );
}

class Relationships {
  int taskCount;
  int newTaskCount;
  Relationships({required this.taskCount, required this.newTaskCount});
  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
      taskCount: json["taskCount"], newTaskCount: json['newTaskCount']);
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
