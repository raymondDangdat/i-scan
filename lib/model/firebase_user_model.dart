import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserModel {
  dynamic id;
  dynamic firstName;
  dynamic lastName;
  dynamic profileImage;
  dynamic fCMToken;
  dynamic dateJoined;
  dynamic rank;
  dynamic userId;
  dynamic yearsOfExperience;
  dynamic deviceId;

  FirebaseUserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.profileImage,
      this.fCMToken,
      this.dateJoined,
      this.rank,
      this.userId,
      this.yearsOfExperience,
      this.deviceId});

  factory FirebaseUserModel.fromDocument(DocumentSnapshot doc) {
    return FirebaseUserModel(
        firstName: doc['firstName'] ?? '',
        lastName: doc['lastName'] ?? '',
        profileImage: doc['profileImage'] ?? '',
        fCMToken: doc['FCMToken'],
        dateJoined: doc['dateJoined'],
        rank: doc['rank'],
        userId: doc['userId'],
        deviceId: doc['deviceId'],
        yearsOfExperience: ['yearsOfExperience']);
  }
}
