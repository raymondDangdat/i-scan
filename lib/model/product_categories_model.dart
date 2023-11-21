// To parse this JSON data, do
//
//     final productCategoriesModel = productCategoriesModelFromJson(jsonString);

import 'dart:convert';

ProductCategoriesModel productCategoriesModelFromJson(String str) =>
    ProductCategoriesModel.fromJson(json.decode(str));

class ProductCategoriesModel {
  List<ProductCategoryData> data;
  String message;
  bool success;

  ProductCategoriesModel({
    required this.data,
    required this.message,
    required this.success,
  });

  factory ProductCategoriesModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoriesModel(
        data: List<ProductCategoryData>.from(
            json["data"].map((x) => ProductCategoryData.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );
}

class ProductCategoryData {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic image;
  ProductCategoryData({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory ProductCategoryData.fromJson(Map<String, dynamic> json) =>
      ProductCategoryData(
          id: json["id"],
          name: json["name"],
          slug: json["slug"],
          image: json['image']);
}
