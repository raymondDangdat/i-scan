// To parse this JSON data, do
//
//     final savedProductModel = savedProductModelFromJson(jsonString);

import 'dart:convert';

SavedProductModel savedProductModelFromJson(String str) =>
    SavedProductModel.fromJson(json.decode(str));

String savedProductModelToJson(SavedProductModel data) =>
    json.encode(data.toJson());

class SavedProductModel {
  List<SavedProduct> data;
  Links links;
  Meta meta;
  String message;
  bool success;

  SavedProductModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.success,
  });

  factory SavedProductModel.fromJson(Map<String, dynamic> json) =>
      SavedProductModel(
        data: List<SavedProduct>.from(
            json["data"].map((x) => SavedProduct.fromJson(x))),
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

class SavedProduct {
  String id;
  SavedProductData product;

  SavedProduct({
    required this.id,
    required this.product,
  });

  factory SavedProduct.fromJson(Map<String, dynamic> json) => SavedProduct(
        id: json["id"],
        product: SavedProductData.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product.toJson(),
      };
}

class SavedProductData {
  dynamic id;
  dynamic storeId;
  dynamic name;
  dynamic description;
  dynamic categoryId;
  dynamic slug;
  dynamic salePrice;
  dynamic discountPrice;
  dynamic quantity;
  dynamic variation;
  dynamic reseller;
  dynamic resellerEarntype;
  dynamic resellerValue;
  dynamic status;
  DateTime createdAt;
  DateTime updatedAt;

  SavedProductData({
    required this.id,
    required this.storeId,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.slug,
    required this.salePrice,
    required this.discountPrice,
    required this.quantity,
    required this.variation,
    required this.reseller,
    required this.resellerEarntype,
    required this.resellerValue,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SavedProductData.fromJson(Map<String, dynamic> json) =>
      SavedProductData(
        id: json["id"],
        storeId: json["store_id"],
        name: json["name"],
        description: json["description"],
        categoryId: json["category_id"],
        slug: json["slug"],
        salePrice: json["sale_price"],
        discountPrice: json["discount_price"],
        quantity: json["quantity"],
        variation: json["variation"],
        reseller: json["reseller"],
        resellerEarntype: json["reseller_earntype"],
        resellerValue: json["reseller_value"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "name": name,
        "description": description,
        "category_id": categoryId,
        "slug": slug,
        "sale_price": salePrice,
        "discount_price": discountPrice,
        "quantity": quantity,
        "variation": variation,
        "reseller": reseller,
        "reseller_earntype": resellerEarntype,
        "reseller_value": resellerValue,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
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
