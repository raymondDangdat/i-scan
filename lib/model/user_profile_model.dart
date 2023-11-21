// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

// UserProfileModel userProfileModelFromJson(String str) =>
//     UserProfileModel.fromJson(json.decode(str));
//
// class UserProfileModel {
//   bool status;
//   String message;
//   Data data;
//
//   UserProfileModel({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//
//   factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
//       UserProfileModel(
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//       );
// }
//
// class Data {
//   dynamic id;
//   dynamic firstName;
//   dynamic lastName;
//   dynamic middleName;
//   dynamic username;
//   dynamic email;
//   dynamic phoneNumber;
//   dynamic gender;
//   DateTime? dob;
//   dynamic refererCode;
//   dynamic avatar;
//   dynamic hasProfilePhoto;
//   dynamic country;
//   dynamic state;
//   dynamic city;
//   dynamic streetName;
//   dynamic houseNumber;
//   dynamic address;
//   dynamic isEmailVerified;
//   DateTime? emailVerifiedAt;
//   dynamic isPhoneNumberVerified;
//   DateTime? phoneVerifiedAt;
//   dynamic isVerified;
//   dynamic status;
//   dynamic hasPin;
//   dynamic hasPasscode;
//   dynamic transactionPin;
//   dynamic bvn;
//   dynamic kycTier;
//   List<Kyc> kyc;
//   dynamic reference;
//   dynamic preferences;
//   dynamic placeOfBirth;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic createdAtFormatted;
//   dynamic updatedAtFormatted;
//   List<Account> accounts;
//
//   Data({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.middleName,
//     required this.username,
//     required this.email,
//     required this.phoneNumber,
//     required this.gender,
//     required this.dob,
//     this.refererCode,
//     required this.avatar,
//     required this.hasProfilePhoto,
//     this.country,
//     required this.state,
//     required this.city,
//     required this.streetName,
//     required this.houseNumber,
//     this.address,
//     required this.isEmailVerified,
//     required this.emailVerifiedAt,
//     required this.isPhoneNumberVerified,
//     required this.phoneVerifiedAt,
//     required this.isVerified,
//     required this.status,
//     required this.hasPin,
//     required this.hasPasscode,
//     required this.transactionPin,
//     required this.bvn,
//     this.kycTier,
//     required this.kyc,
//     this.reference,
//     required this.preferences,
//     required this.placeOfBirth,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdAtFormatted,
//     required this.updatedAtFormatted,
//     required this.accounts,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         middleName: json["middle_name"],
//         username: json["username"],
//         email: json["email"],
//         phoneNumber: json["phone_number"],
//         gender: json["gender"],
//         dob: DateTime.parse(json["dob"]),
//         refererCode: json["referer_code"],
//         avatar: json["avatar"],
//         hasProfilePhoto: json["has_profile_photo"],
//         country: json["country"],
//         state: json["state"],
//         city: json["city"],
//         streetName: json["street_name"],
//         houseNumber: json["house_number"],
//         address: json["address"],
//         isEmailVerified: json["is_email_verified"],
//         emailVerifiedAt: json["email_verified_at"] == null
//             ? DateTime.now()
//             : DateTime.parse(json["email_verified_at"]),
//         isPhoneNumberVerified: json["is_phone_number_verified"],
//         phoneVerifiedAt: json["phone_verified_at"] == null
//             ? DateTime.now()
//             : DateTime.parse(json["phone_verified_at"]),
//         isVerified: json["is_verified"],
//         status: json["status"],
//         hasPin: json["has_pin"],
//         hasPasscode: json['has_passcode'],
//         transactionPin: json["transaction_pin"],
//         bvn: json["bvn"],
//         kycTier: json["kyc_tier"],
//         kyc: List<Kyc>.from(json["kyc"].map((x) => Kyc.fromJson(x))),
//         reference: json["reference"],
//         preferences: json["preferences"],
//         placeOfBirth: json["place_of_birth"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         createdAtFormatted: json["created_at_formatted"],
//         updatedAtFormatted: json["updated_at_formatted"],
//         accounts: List<Account>.from(
//             json["accounts"].map((x) => Account.fromJson(x))),
//       );
// }
//
// class Kyc {
//   dynamic id;
//   dynamic customerId;
//   dynamic category;
//   dynamic tier;
//   dynamic documentType;
//   dynamic fileName;
//   dynamic filePath;
//   dynamic value;
//   dynamic verificationStatus;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   Kyc({
//     required this.id,
//     required this.customerId,
//     required this.category,
//     required this.tier,
//     required this.documentType,
//     required this.fileName,
//     this.filePath,
//     this.value,
//     required this.verificationStatus,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Kyc.fromJson(Map<String, dynamic> json) => Kyc(
//         id: json["id"],
//         customerId: json["customer_id"],
//         category: json["category"],
//         tier: json["tier"],
//         documentType: json["document_type"],
//         fileName: json["file_name"],
//         filePath: json["file_path"],
//         value: json["value"],
//         verificationStatus: json["verification_status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
// }
//
// class Account {
//   int id;
//   String reference;
//   String customerId;
//   String type;
//   String accountNumber;
//   dynamic bankCode;
//   String bankName;
//   String prevBalance;
//   String balance;
//   String currency;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic deletedAt;
//
//   Account({
//     required this.id,
//     required this.reference,
//     required this.customerId,
//     required this.type,
//     required this.accountNumber,
//     this.bankCode,
//     required this.bankName,
//     required this.prevBalance,
//     required this.balance,
//     required this.currency,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//   });
//
//   factory Account.fromJson(Map<String, dynamic> json) => Account(
//         id: json["id"],
//         reference: json["reference"],
//         customerId: json["customer_id"],
//         type: json["type"],
//         accountNumber: json["account_number"],
//         bankCode: json["bank_code"],
//         bankName: json["bank_name"],
//         prevBalance: json["prev_balance"],
//         balance: json["balance"],
//         currency: json["currency"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "reference": reference,
//         "customer_id": customerId,
//         "type": type,
//         "account_number": accountNumber,
//         "bank_code": bankCode,
//         "bank_name": bankName,
//         "prev_balance": prevBalance,
//         "balance": balance,
//         "currency": currency,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "deleted_at": deletedAt,
//       };
// }
//
//

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

class UserProfileModel {
  dynamic status;
  dynamic message;
  dynamic accessToken;
  dynamic tokenType;
  Data data;

  UserProfileModel({
    required this.status,
    required this.message,
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        status: json["status"],
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  dynamic id;
  dynamic name;
  dynamic firstName;
  dynamic lastName;
  dynamic middleName;
  dynamic username;
  dynamic email;
  dynamic phoneNumber;
  dynamic gender;
  DateTime? dob;
  dynamic customerType;
  dynamic claimedAiUnit;
  dynamic aiCredit;
  dynamic refererCode;
  dynamic avatar;
  dynamic hasProfilePhoto;
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic streetName;
  dynamic houseNumber;
  dynamic address;
  dynamic isEmailVerified;
  DateTime? emailVerifiedAt;
  dynamic isPhoneNumberVerified;
  DateTime? phoneVerifiedAt;
  dynamic isVerified;
  dynamic status;
  dynamic profileStatus;
  dynamic hasPin;
  dynamic hasPasscode;
  dynamic bvn;
  dynamic kycTier;
  List<Kyc> kyc;
  dynamic reference;
  dynamic metadata;
  dynamic preferences;
  dynamic placeOfBirth;
  dynamic referralLink;
  dynamic createdAtFormatted;
  dynamic updatedAtFormatted;
  AccountLimits? accountLimits;
  List<Account> accounts;

  Data(
      {required this.id,
      required this.name,
      required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.gender,
      required this.dob,
      required this.customerType,
      required this.claimedAiUnit,
      required this.aiCredit,
      required this.refererCode,
      required this.avatar,
      required this.hasProfilePhoto,
      required this.country,
      required this.state,
      required this.city,
      required this.streetName,
      required this.houseNumber,
      required this.address,
      required this.isEmailVerified,
      required this.emailVerifiedAt,
      required this.isPhoneNumberVerified,
      required this.phoneVerifiedAt,
      required this.isVerified,
      required this.status,
      required this.profileStatus,
      required this.hasPin,
      required this.hasPasscode,
      required this.bvn,
      required this.kycTier,
      required this.kyc,
      required this.reference,
      required this.metadata,
      required this.preferences,
      required this.placeOfBirth,
      required this.createdAtFormatted,
      required this.updatedAtFormatted,
      required this.accountLimits,
      required this.accounts,
      required this.referralLink});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        middleName: json["middle_name"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        customerType: json["customer_type"],
        claimedAiUnit: json["claimed_ai_unit"],
        aiCredit: json["ai_credit"],
        refererCode: json["referer_code"],
        avatar: json["avatar"],
        hasProfilePhoto: json["has_profile_photo"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        streetName: json["street_name"],
        houseNumber: json["house_number"],
        address: json["address"],
        isEmailVerified: json["is_email_verified"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        isPhoneNumberVerified: json["phone_verified_at"] == null
            ? null
            : DateTime.parse(json["phone_verified_at"]),
        phoneVerifiedAt: json["phone_verified_at"] == null
            ? null
            : DateTime.parse(json["phone_verified_at"]),
        isVerified: json["is_verified"],
        status: json["status"],
        profileStatus: json["profile_status"],
        hasPin: json["has_pin"],
        hasPasscode: json["has_passcode"],
        bvn: json["bvn"],
        kycTier: json["kyc_tier"],
        kyc: List<Kyc>.from(json["kyc"].map((x) => Kyc.fromJson(x))),
        reference: json["reference"],
        metadata: json["metadata"],
        preferences: json["preferences"],
        placeOfBirth: json["place_of_birth"],
        createdAtFormatted: json["created_at_formatted"],
        updatedAtFormatted: json["updated_at_formatted"],
        referralLink: json["referral_link"],
        accountLimits: json["account_limits"] == null
            ? null
            : AccountLimits.fromJson(json["account_limits"]),
        accounts: List<Account>.from(
            json["accounts"].map((x) => Account.fromJson(x))),
      );
}

class AccountLimits {
  dynamic maximumBalance;
  dynamic maximumSingleDeposit;
  dynamic maximumTransferWithdrawal;
  dynamic maximumDailyCumulativeDebit;

  AccountLimits({
    required this.maximumBalance,
    required this.maximumSingleDeposit,
    required this.maximumTransferWithdrawal,
    required this.maximumDailyCumulativeDebit,
  });

  factory AccountLimits.fromJson(Map<String, dynamic> json) => AccountLimits(
        maximumBalance: json["maximum balance"],
        maximumSingleDeposit: json["maximum single deposit"],
        maximumTransferWithdrawal: json["maximum transfer/withdrawal"],
        maximumDailyCumulativeDebit: json["maximum daily cumulative debit"],
      );

  Map<String, dynamic> toJson() => {
        "maximum balance": maximumBalance,
        "maximum single deposit": maximumSingleDeposit,
        "maximum transfer/withdrawal": maximumTransferWithdrawal,
        "maximum daily cumulative debit": maximumDailyCumulativeDebit,
      };
}

class Account {
  dynamic id;
  dynamic reference;
  dynamic customerId;
  dynamic type;
  dynamic accountNumber;
  dynamic bankCode;
  dynamic bankName;
  dynamic prevBalance;
  dynamic balance;
  dynamic currency;
  dynamic status;
  dynamic balanceFormatted;

  Account({
    required this.id,
    required this.reference,
    required this.customerId,
    required this.type,
    required this.accountNumber,
    required this.bankCode,
    required this.bankName,
    required this.prevBalance,
    required this.balance,
    required this.currency,
    required this.status,
    required this.balanceFormatted,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        reference: json["reference"],
        customerId: json["customer_id"],
        type: json["type"],
        accountNumber: json["account_number"],
        bankCode: json["bank_code"],
        bankName: json["bank_name"],
        prevBalance: json["prev_balance"],
        balance: json["balance"],
        currency: json["currency"],
        status: json["status"],
        balanceFormatted: json["balance_formatted"],
      );
}

class Kyc {
  dynamic id;
  dynamic customerId;
  dynamic category;
  dynamic tier;
  dynamic documentType;
  dynamic fileName;
  dynamic filePath;
  dynamic value;
  dynamic verificationStatus;
  dynamic documentCountry;
  dynamic documentIssuedDate;
  dynamic documentExpiration;

  Kyc({
    required this.id,
    required this.customerId,
    required this.category,
    required this.tier,
    required this.documentType,
    required this.fileName,
    required this.filePath,
    required this.value,
    required this.verificationStatus,
    required this.documentCountry,
    required this.documentIssuedDate,
    required this.documentExpiration,
  });

  factory Kyc.fromJson(Map<String, dynamic> json) => Kyc(
        id: json["id"],
        customerId: json["customer_id"],
        category: json["category"],
        tier: json["tier"],
        documentType: json["document_type"],
        fileName: json["file_name"],
        filePath: json["file_path"],
        value: json["value"],
        verificationStatus: json["verification_status"],
        documentCountry: json["document_country"],
        documentIssuedDate: json["document_issued_date"],
        documentExpiration: json["document_expiration"],
      );
}
