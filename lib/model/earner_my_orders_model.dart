import 'dart:convert';

import 'products_model.dart';

EarnerOrdersModel earnerOrdersModelFromJson(String str) =>
    EarnerOrdersModel.fromJson(json.decode(str));

class EarnerOrdersModel {
  List<OrderData> data;
  Links links;
  Meta meta;
  String message;
  bool success;

  EarnerOrdersModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.success,
  });

  factory EarnerOrdersModel.fromJson(Map<String, dynamic> json) =>
      EarnerOrdersModel(
        data: List<OrderData>.from(
            json["data"].map((x) => OrderData.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        message: json["message"],
        success: json["success"],
      );
}

class OrderData {
  dynamic id;
  dynamic orderRef;
  dynamic name;
  dynamic address;
  dynamic phone;
  Lga state;
  Lga lga;
  dynamic status;
  dynamic totalPrice;
  dynamic cartPrice;
  dynamic deliveryPrice;
  dynamic discountValue;
  List<OrderedProduct> products;
  DateTime createdAt;
  DateTime updatedAt;

  OrderData({
    required this.id,
    required this.orderRef,
    required this.name,
    required this.address,
    required this.phone,
    required this.state,
    required this.lga,
    required this.status,
    required this.totalPrice,
    required this.cartPrice,
    required this.deliveryPrice,
    required this.discountValue,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"],
        orderRef: json["order_ref"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        state: Lga.fromJson(json["state"]),
        lga: Lga.fromJson(json["lga"]),
        status: json["status"],
        totalPrice: json["total_price"],
        cartPrice: json["cart_price"],
        deliveryPrice: json["delivery_price"],
        discountValue: json["discount_value"],
        products: List<OrderedProduct>.from(
            json["products"].map((x) => OrderedProduct.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class Lga {
  dynamic id;
  dynamic stateId;
  dynamic name;
  DateTime createdAt;
  DateTime updatedAt;

  Lga({
    required this.id,
    this.stateId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lga.fromJson(Map<String, dynamic> json) => Lga(
        id: json["id"],
        stateId: json["state_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_id": stateId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class OrderedProduct {
  dynamic id;
  dynamic sellerId;
  dynamic name;
  dynamic quantity;
  dynamic price;
  dynamic shippingPrice;
  dynamic resellerId;
  dynamic status;
  List<Gallery> gallery;
  DateTime createdAt;
  DateTime updatedAt;

  OrderedProduct({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.shippingPrice,
    required this.resellerId,
    required this.status,
    required this.gallery,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderedProduct.fromJson(Map<String, dynamic> json) => OrderedProduct(
        id: json["id"],
        sellerId: json["seller_id"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
        shippingPrice: json["shipping_price"],
        resellerId: json["reseller_id"],
        status: json["status"],
        gallery:
            List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
