import 'package:hive_flutter/hive_flutter.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 1)
class UserHiveModel {
  UserHiveModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.token,
      required this.phoneNumber,
      required this.middleName,
      required this.userName,
      required this.countryCode,
      required this.gender,
      required this.hasBiometric,
      required this.isLoggedIn,
      required this.houseNumber,
      required this.streetName});
  @HiveField(0)
  dynamic userId;

  @HiveField(1)
  String? firstName;

  @HiveField(2)
  String? lastName;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? phoneNumber;

  @HiveField(5)
  String? token;

  @HiveField(6)
  String? middleName;

  @HiveField(8)
  String? countryCode;

  @HiveField(9)
  String? gender;

  @HiveField(10)
  String? userName;

  @HiveField(11)
  bool? hasBiometric;

  @HiveField(12)
  bool? isLoggedIn;

  @HiveField(14)
  String? streetName;

  @HiveField(13)
  String? houseNumber;
}
