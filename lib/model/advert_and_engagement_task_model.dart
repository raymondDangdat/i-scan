// To parse this JSON data, do
//
//     final advertAndEngagementTaskModel = advertAndEngagementTaskModelFromJson(jsonString);

import 'dart:convert';

AdvertAndEngagementTaskModel advertAndEngagementTaskModelFromJson(String str) =>
    AdvertAndEngagementTaskModel.fromJson(json.decode(str));

class AdvertAndEngagementTaskModel {
  List<AdvertAndEngagementTaskData> data;
  Links links;
  Meta meta;
  String message;
  bool success;

  AdvertAndEngagementTaskModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.success,
  });

  factory AdvertAndEngagementTaskModel.fromJson(Map<String, dynamic> json) =>
      AdvertAndEngagementTaskModel(
        data: List<AdvertAndEngagementTaskData>.from(
            json["data"].map((x) => AdvertAndEngagementTaskData.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        message: json["message"],
        success: json["success"],
      );
}

class AdvertAndEngagementTaskData {
  dynamic id;
  dynamic title;
  dynamic description;
  dynamic socialMedia;
  dynamic amount;
  dynamic action;
  Relationships relationships;

  AdvertAndEngagementTaskData({
    required this.id,
    required this.title,
    required this.description,
    required this.socialMedia,
    required this.amount,
    required this.action,
    required this.relationships,
  });

  factory AdvertAndEngagementTaskData.fromJson(Map<String, dynamic> json) =>
      AdvertAndEngagementTaskData(
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
  dynamic taskCount;

  Relationships({
    required this.taskCount,
  });

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        taskCount: json["taskCount"],
      );

  Map<String, dynamic> toJson() => {
        "taskCount": taskCount,
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
