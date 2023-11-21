// // To parse this JSON data, do
// //
// //     final cartItemModel = cartItemModelFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:hash_it/model/products_model.dart';
//
// CartItemModel cartItemModelFromJson(String str) =>
//     CartItemModel.fromJson(json.decode(str));
//
// class CartItemModel {
//   List<CartItem> data;
//   int totalPrice;
//   String message;
//   bool success;
//
//   CartItemModel({
//     required this.data,
//     required this.totalPrice,
//     required this.message,
//     required this.success,
//   });
//
//   factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
//         data:
//             List<CartItem>.from(json["data"].map((x) => CartItem.fromJson(x))),
//         totalPrice: json["totalPrice"],
//         message: json["message"],
//         success: json["success"],
//       );
// }
//
// class CartItem {
//   dynamic id;
//   Product product;
//   String quantity;
//   dynamic resellerId;
//
//   CartItem({
//     required this.id,
//     required this.product,
//     required this.quantity,
//     required this.resellerId,
//   });
//
//   factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
//         id: json["id"],
//         product: Product.fromJson(json["product"]),
//         quantity: json["quantity"],
//         resellerId: json["reseller_id"],
//       );
// }
//
// class Store {
//   String name;
//   String address;
//   String description;
//   dynamic logo;
//   String status;
//
//   Store({
//     required this.name,
//     required this.address,
//     required this.description,
//     required this.logo,
//     required this.status,
//   });
//
//   factory Store.fromJson(Map<String, dynamic> json) => Store(
//         name: json["name"],
//         address: json["address"],
//         description: json["description"],
//         logo: json["logo"],
//         status: json["status"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "address": address,
//         "description": description,
//         "logo": logo,
//         "status": status,
//       };
// }

// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromJson(jsonString);

import 'dart:convert';
import 'package:i_scan/model/products_model.dart';

CartItemModel cartItemModelFromJson(String str) =>
    CartItemModel.fromJson(json.decode(str));

class CartItemModel {
  List<CartItem> data;
  int totalPrice;
  String message;
  bool success;

  CartItemModel({
    required this.data,
    required this.totalPrice,
    required this.message,
    required this.success,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        data:
            List<CartItem>.from(json["data"].map((x) => CartItem.fromJson(x))),
        totalPrice: json["totalPrice"],
        message: json["message"],
        success: json["success"],
      );
}

class CartItem {
  dynamic id;
  Product product;
  dynamic quantity;
  dynamic resellerId;
  dynamic variationId;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.resellerId,
    required this.variationId,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
        resellerId: json["reseller_id"],
        variationId: json["variation_id"],
      );
}
