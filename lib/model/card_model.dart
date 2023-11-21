// class CardModel {
//   final String userId;
//   final String nameOnCard;
//   final String accountLinked;

//   CardModel(
//       {required this.userId,
//       required this.accountLinked,
//       required this.nameOnCard});
// }

// final List<CardModel> cards = [
//   // CardModel(userId: , accountLinked: accountLinked, nameOnCard: nameOnCard)
// ];

// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  String id;
  String customerId;
  String accountId;
  String organizationId;
  String environment;
  String type;
  String name;
  String phone;
  String currency;
  int balance;
  String brand;
  String status;
  BillingAddress billingAddress;
  String pan;
  String? cvv;
  String expiryMonth;
  String expiryYear;
  DateTime createdAt;
  DateTime updatedAt;
  bool linked;
  String? pin;

  CardModel(
      {required this.id,
      required this.customerId,
      required this.accountId,
      required this.organizationId,
      required this.environment,
      required this.type,
      required this.name,
      required this.phone,
      required this.currency,
      required this.balance,
      required this.brand,
      required this.status,
      required this.billingAddress,
      required this.pan,
      required this.expiryMonth,
      required this.expiryYear,
      required this.createdAt,
      required this.updatedAt,
      required this.linked,
      this.cvv,
      this.pin});

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"],
        customerId: json["customer_id"],
        accountId: json["account_id"],
        organizationId: json["organization_id"],
        environment: json["environment"],
        type: json["type"],
        name: json["name"],
        phone: json["phone"],
        currency: json["currency"],
        balance: json["balance"],
        brand: json["brand"],
        status: json["status"],
        billingAddress: BillingAddress.fromJson(json["billing_address"]),
        pan: json["pan"],
        cvv: json["cvv"],
        expiryMonth: json["expiry_month"],
        expiryYear: json["expiry_year"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        linked: json["linked"],
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "account_id": accountId,
        "organization_id": organizationId,
        "environment": environment,
        "type": type,
        "name": name,
        "phone": phone,
        "currency": currency,
        "balance": balance,
        "brand": brand,
        "status": status,
        "billing_address": billingAddress.toJson(),
        "pan": pan,
        "cvv": cvv,
        "expiry_month": expiryMonth,
        "expiry_year": expiryYear,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "linked": linked,
        "pin": pin,
      };
}

class BillingAddress {
  String street;
  String city;
  String state;
  String country;
  String postalCode;

  BillingAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "country": country,
        "postal_code": postalCode,
      };
}
