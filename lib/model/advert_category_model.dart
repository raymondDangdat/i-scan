// To parse this JSON data, do
//
//     final advertCategoryModel = advertCategoryModelFromJson(jsonString);

import 'dart:convert';

AdvertCategoryModel advertCategoryModelFromJson(String str) =>
    AdvertCategoryModel.fromJson(json.decode(str));

class AdvertCategoryModel {
  List<AdvertCategoryData> data;
  Links links;
  Meta meta;
  String message;
  bool success;

  AdvertCategoryModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.success,
  });

  factory AdvertCategoryModel.fromJson(Map<String, dynamic> json) =>
      AdvertCategoryModel(
        data: List<AdvertCategoryData>.from(
            json["data"].map((x) => AdvertCategoryData.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        message: json["message"],
        success: json["success"],
      );
}

class AdvertCategoryData {
  dynamic id;
  dynamic name;
  dynamic description;

  AdvertCategoryData({
    required this.id,
    required this.name,
    required this.description,
  });

  factory AdvertCategoryData.fromJson(Map<String, dynamic> json) =>
      AdvertCategoryData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );
}

class Links {
  String first;
  String last;
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
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

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
  String? url;
  String label;
  bool active;

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
