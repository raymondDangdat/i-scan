// // To parse this JSON data, do
// //
// //     final productsModel = productsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:hash_it/model/product_categories_model.dart';
//
// import 'store_model.dart';
//
// ProductsModel productsModelFromJson(String str) =>
//     ProductsModel.fromJson(json.decode(str));
//
// class ProductsModel {
//   List<Product> data;
//   Links links;
//   Meta meta;
//   String message;
//   bool success;
//
//   ProductsModel({
//     required this.data,
//     required this.links,
//     required this.meta,
//     required this.message,
//     required this.success,
//   });
//
//   factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
//         data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
//         links: Links.fromJson(json["links"]),
//         meta: Meta.fromJson(json["meta"]),
//         message: json["message"],
//         success: json["success"],
//       );
// }
//
// class Product {
//   dynamic id;
//   dynamic name;
//   dynamic description;
//   ProductCategoryData category;
//   dynamic salePrice;
//   dynamic discountPrice;
//   dynamic quantity;
//   dynamic slug;
//   dynamic reseller;
//   dynamic resellerValue;
//   dynamic resellerEarnType;
//   dynamic variation;
//   dynamic status;
//   // List<Shipping> shipping;
//   List<Gallery> gallery;
//   DateTime createdAt;
//   DateTime updatedAt;
//   StoreData store;
//
//   Product(
//       {required this.id,
//       required this.name,
//       required this.description,
//       required this.category,
//       required this.salePrice,
//       required this.discountPrice,
//       required this.quantity,
//       required this.slug,
//       required this.reseller,
//       required this.resellerValue,
//       required this.resellerEarnType,
//       required this.variation,
//       required this.status,
//       // required this.shipping,
//       required this.gallery,
//       required this.createdAt,
//       required this.updatedAt,
//       required this.store});
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         category: ProductCategoryData.fromJson(json["category"]),
//         salePrice: json["sale_price"],
//         discountPrice: json["discount_price"],
//         quantity: json["quantity"],
//         slug: json["slug"],
//         reseller: json["reseller"],
//         resellerValue: json["reseller_value"],
//         resellerEarnType: json["reseller_earntype"],
//         variation: json["variation"],
//         status: json["status"],
//         // shipping: List<Shipping>.from(json["shipping"].map((x) => Shipping.fromJson(x))),
//         gallery:
//             List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         store: StoreData.fromJson(json['store']),
//       );
// }
//
// class Gallery {
//   dynamic id;
//   dynamic productId;
//   dynamic url;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   Gallery({
//     required this.id,
//     required this.productId,
//     required this.url,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
//         id: json["id"],
//         productId: json["product_id"],
//         url: json["url"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
// }
//
// class Shipping {
//   String id;
//   State state;
//   String amount;
//
//   Shipping({
//     required this.id,
//     required this.state,
//     required this.amount,
//   });
//
//   factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
//         id: json["id"],
//         state: State.fromJson(json["state"]),
//         amount: json["amount"],
//       );
// }
//
// class State {
//   dynamic id;
//   dynamic name;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   State({
//     required this.id,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory State.fromJson(Map<String, dynamic> json) => State(
//         id: json["id"],
//         name: json["name"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
// }
//
// class Links {
//   String first;
//   String last;
//   dynamic prev;
//   dynamic next;
//
//   Links({
//     required this.first,
//     required this.last,
//     required this.prev,
//     required this.next,
//   });
//
//   factory Links.fromJson(Map<String, dynamic> json) => Links(
//         first: json["first"],
//         last: json["last"],
//         prev: json["prev"],
//         next: json["next"],
//       );
// }
//
// class Meta {
//   int currentPage;
//   int from;
//   int lastPage;
//   List<Link> links;
//   String path;
//   int perPage;
//   int to;
//   int total;
//
//   Meta({
//     required this.currentPage,
//     required this.from,
//     required this.lastPage,
//     required this.links,
//     required this.path,
//     required this.perPage,
//     required this.to,
//     required this.total,
//   });
//
//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         currentPage: json["current_page"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
//         path: json["path"],
//         perPage: json["per_page"],
//         to: json["to"],
//         total: json["total"],
//       );
// }
//
// class Link {
//   dynamic url;
//   dynamic label;
//   dynamic active;
//
//   Link({
//     required this.url,
//     required this.label,
//     required this.active,
//   });
//
//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"],
//         label: json["label"],
//         active: json["active"],
//       );
// }

// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

class ProductsModel {
  List<Product> data;
  Links links;
  Meta meta;
  String message;
  bool success;

  ProductsModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.success,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        message: json["message"],
        success: json["success"],
      );
}

class Product {
  dynamic id;
  dynamic name;
  dynamic description;
  Category category;
  dynamic salePrice;
  dynamic discountPrice;
  dynamic quantity;
  dynamic slug;
  dynamic reseller;
  dynamic resellerValue;
  dynamic resellerEarntype;
  Variation variation;
  dynamic status;
  List<Gallery> gallery;
  DateTime createdAt;
  DateTime updatedAt;
  Store store;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.salePrice,
    required this.discountPrice,
    required this.quantity,
    required this.slug,
    required this.reseller,
    required this.resellerValue,
    required this.resellerEarntype,
    required this.variation,
    required this.status,
    required this.gallery,
    required this.createdAt,
    required this.updatedAt,
    required this.store,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        salePrice: json["sale_price"],
        discountPrice: json["discount_price"],
        quantity: json["quantity"],
        slug: json["slug"],
        reseller: json["reseller"],
        resellerValue: json["reseller_value"],
        resellerEarntype: json["reseller_earntype"],
        variation: Variation.fromJson(json["variation"]),
        status: json["status"],
        gallery:
            List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        store: Store.fromJson(json["store"]),
      );
}

class Category {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
      );
}

class Gallery {
  dynamic id;
  dynamic productId;
  dynamic url;
  dynamic galleryDefault;

  Gallery({
    required this.id,
    required this.productId,
    required this.url,
    required this.galleryDefault,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        productId: json["product_id"],
        url: json["url"],
        galleryDefault: json["default"],
      );
}

class Store {
  dynamic name;
  dynamic address;
  dynamic description;
  dynamic logo;
  dynamic status;

  Store({
    required this.name,
    required this.address,
    required this.description,
    required this.logo,
    required this.status,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        name: json["name"],
        address: json["address"],
        description: json["description"],
        logo: json["logo"],
        status: json["status"],
      );
}

class Variation {
  List<VariationData> size;
  List<VariationData> colour;

  Variation({
    required this.size,
    required this.colour,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        size: List<VariationData>.from(
            json["size"].map((x) => VariationData.fromJson(x))),
        colour: List<VariationData>.from(
            json["colour"].map((x) => VariationData.fromJson(x))),
      );
}

class VariationData {
  dynamic id;
  dynamic productId;
  dynamic type;
  dynamic value;
  dynamic price;

  VariationData({
    required this.id,
    required this.productId,
    required this.type,
    required this.value,
    required this.price,
  });

  factory VariationData.fromJson(Map<String, dynamic> json) => VariationData(
        id: json["id"],
        productId: json["product_id"],
        type: json["type"],
        value: json["value"],
        price: json["price"],
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

class State {
  dynamic id;
  dynamic name;
  DateTime createdAt;
  DateTime updatedAt;

  State({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
