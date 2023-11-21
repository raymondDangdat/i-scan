// import 'package:aria/resources/constants/image_constant.dart';
//
// class CountryModel{
//   final String name;
//   final String countryCode;
//   final String logo;
//
//   CountryModel({
//     required this.name,
//     required this.countryCode,
//     required this.logo
//   });
// }
//
//
// final List<CountryModel> countries = [
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
//   CountryModel(name: "United Kingdom", countryCode: "+44", logo: ukLogo),
// ];

// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  List<CountryData> data;
  dynamic message;
  bool success;

  CountryModel({
    required this.data,
    required this.message,
    required this.success,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        data: List<CountryData>.from(
            json["data"].map((x) => CountryData.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "success": success,
      };
}

class CountryData {
  int id;
  dynamic name;
  dynamic logo;
  dynamic phoneNumberCode;
  dynamic slug;

  CountryData({
    required this.id,
    required this.name,
    required this.logo,
    required this.phoneNumberCode,
    required this.slug,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        phoneNumberCode: json["phone_number_code"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "phone_number_code": phoneNumberCode,
        "slug": slug,
      };
}
