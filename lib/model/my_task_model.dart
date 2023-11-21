// To parse this JSON data, do
//
//     final myTaskModel = myTaskModelFromJson(jsonString);

import 'dart:convert';

MyTaskModel myTaskModelFromJson(String str) =>
    MyTaskModel.fromJson(json.decode(str));

class MyTaskModel {
  List<MyTaskData> data;
  Links links;
  Meta meta;
  String message;
  bool success;

  MyTaskModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.success,
  });

  factory MyTaskModel.fromJson(Map<String, dynamic> json) => MyTaskModel(
        data: List<MyTaskData>.from(
            json["data"].map((x) => MyTaskData.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        message: json["message"],
        success: json["success"],
      );
}

class MyTaskData {
  dynamic id;
  dynamic title;
  dynamic description;
  dynamic socialMedia;
  dynamic link;
  dynamic amount;
  dynamic action;
  dynamic numberOfLikes;
  dynamic location;
  dynamic coverImage;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  MyTaskData({
    required this.id,
    required this.title,
    required this.description,
    required this.socialMedia,
    required this.link,
    required this.amount,
    required this.action,
    required this.numberOfLikes,
    required this.location,
    required this.coverImage,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory MyTaskData.fromJson(Map<String, dynamic> json) => MyTaskData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        socialMedia: json["social_media"],
        link: json["link"],
        amount: json["amount"],
        action: json["action"],
        numberOfLikes: json["number_of_likes"],
        location: json["location"],
        coverImage: json["cover_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );
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
