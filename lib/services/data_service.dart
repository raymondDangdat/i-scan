import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i_scan/model/first_step_account_creationl.dart';

import '../Utils/functions.dart';
import '../model/firebase_user_model.dart';
import '../resources/constants/connectivity.dart';

class DatabaseService {
  final String uId;
  DatabaseService({required this.uId});
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference referralsCollection =
      FirebaseFirestore.instance.collection('referrals');
  final CollectionReference registeredDevices =
      FirebaseFirestore.instance.collection('registeredDevices');
  final CollectionReference qrCodeCollection =
      FirebaseFirestore.instance.collection('qrCode');
  final CollectionReference attendanceCollection =
  FirebaseFirestore.instance.collection('attendance');
  final CollectionReference generalAttendanceCollection =
  FirebaseFirestore.instance.collection('generalAttendance');

  final CollectionReference deviceUpdateCollection =
  FirebaseFirestore.instance.collection('device_update_requests');

  Future updateUserData({required FirstStepAccountCreation firstStep}) async {
    return await userCollection.doc(uId).set({
      'firstName': firstStep.firstName,
      'lastName': firstStep.lastName,
      'email': firstStep.email,
      'profileImage': '',
      'FCMToken': '',
      'userId': uId,
      "userType": "user",
      'rank': firstStep.rank,
      'yearsOfExperience': firstStep.yearsOfExperience,
      'dateJoined': DateTime.now().toString(),
      "deviceId": firstStep.deviceId,
    });
  }

  Future updateUserPayment() async {
    return await userCollection.doc(uId).update({
      'subscribe': true,
      'dateSubscribed': DateTime.now().toString(),
      'expiryDate': DateTime(
              DateTime.now().year + 1, DateTime.now().month, DateTime.now().day)
          .toString()
    }).then((value) async {
      // await rewardReferral();
    });
  }

  Future<FirebaseUserModel?> getUserDetail() async {
    FirebaseUserModel? user;
    bool connected = await connectionChecker();
    if (connected) {
      DocumentSnapshot doc = await userCollection.doc(uId).get();
      if (doc.exists) {
        user = FirebaseUserModel.fromDocument(doc);
      }
    } else {
      Fluttertoast.showToast(msg: "No Internet connection");
    }

    return user;
  }

  Future saveDeviceId(String deviceId) async {
    return await registeredDevices.doc(deviceId).set({
      'deviceId': deviceId,
    });
  }

  Future saveQRCode(
      {required String lat,
      required String long,
      required String dateTime}) async {
    return await qrCodeCollection
        .doc("qrCode")
        .set({'lat': lat, 'long': long, 'dateTime': dateTime});
  }

  Stream<QuerySnapshot> get userData {
    return userCollection.snapshots();
  }

  Future<bool> checkInOrCheckOut({required bool isCheckIn}) async {
    bool isChecked = true;
    await attendanceCollection
        .doc(uId)
        .collection(
        returnTodayDate())
        .add({
      "isCheckIn": isCheckIn,
      "date": DateTime.now().toString(),
      "userId": uId,
    }).catchError((e) {
      isChecked = false;
      debugPrint("Error Checking:::::${e.toString()}");
    });
    debugPrint("Attendance Checked:::::::::$isChecked");
    return isChecked;
  }

  Future<bool> requestDeviceUpdate({required FirebaseUserModel user, required String deviceId}) async {
    bool isChecked = true;
    await deviceUpdateCollection
        .doc(uId).set({
      "userId": uId,
      "date" : DateTime.now().toString(),
      "full_name": "${user.firstName} ${user.lastName}",
      "deviceId": deviceId
    })
        .catchError((e) {
      isChecked = false;
      debugPrint("Error Checking:::::${e.toString()}");
    });
    debugPrint("Attendance Checked:::::::::$isChecked");
    return isChecked;

  }


  Future<bool> checkIn({required FirebaseUserModel user}) async {
    bool isChecked = true;
    await generalAttendanceCollection.doc("${user.userId}-${returnTodayDate()}")
        .set({
      "CheckInDate": DateTime.now().toString(),
      "userId": uId,
      'checkOutDate': "",
      'date': returnTodayDate(),
      "fullName": "${user.firstName} ${user.lastName}",
      "rank": user.rank

    }).catchError((e) {
      isChecked = false;
      debugPrint("Error Checking:::::${e.toString()}");
    });
    debugPrint("Attendance Checked:::::::::$isChecked");
    return isChecked;
  }

  Future<bool> checkOut() async {
    bool isChecked = true;
    await generalAttendanceCollection
        .doc("$uId-${returnTodayDate()}").update({
      'checkOutDate': DateTime.now().toString(),

    }).catchError((e) {
      isChecked = false;
      debugPrint("Error Checking:::::${e.toString()}");
    });
    debugPrint("Attendance Checked OUT:::::::::$isChecked");
    return isChecked;
  }

  Future<QuerySnapshot?> getAttendanceToday() async {
    QuerySnapshot? attendanceToday;
   attendanceToday=   await attendanceCollection
        .doc(uId)
        .collection(returnTodayDate())
        .get();

   debugPrint("Attendance this day:::::::::$attendanceToday");

    return attendanceToday;
  }

  Future<DocumentSnapshot?> getDrAttendance() async {
    DocumentSnapshot? docAttendance;
    docAttendance=   await attendanceCollection
        .doc(uId)
        .get();

    // debugPrint("Attendance this day:::::::::${docAttendance.metadata.}");

    return docAttendance;
  }

  Future<QuerySnapshot?> getDoctors() async {
    QuerySnapshot? attendanceToday;
    attendanceToday=   await attendanceCollection
        .doc(uId)
        .collection(returnTodayDate())
        .get();
    debugPrint(":::::::::$attendanceToday");
    return attendanceToday;
  }

  Future<QuerySnapshot?> adminGetAttendance() async {
    QuerySnapshot? attendanceSnapshot;
    attendanceSnapshot=   await attendanceCollection.get();
    debugPrint(":::::::::${attendanceSnapshot.docs.length}");
    return attendanceSnapshot;
  }

  Future<DocumentSnapshot> getQRCodeData() async {
    final snapshot = await qrCodeCollection.doc("qrCode").get();
    debugPrint("QR CODE: ${snapshot.exists} ================");
    return snapshot;
  }



  getQuestionData(String quizId, String qId) async {
    return await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .where('question_id', isEqualTo: qId)
        .get();
  }

  getUserDailyXps(String userId, String day) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("xps")
        .doc(day)
        .get();
  }



  getUserTotalXps(String userId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get();
  }

  // Future<bool> updateUserXP(String userID, String date, String xp, int totalXP) async{
  //   final ref = await SharedPreferences.getInstance();
  //   ref.setString(totalXp, totalXP.toString());
  //   try{
  //     await userCollection.doc(userID).collection('xps').doc(date).set({
  //       'xp' : xp,
  //       'day' : date
  //     });
  //
  //     await userCollection.doc(userID).update({
  //       'totalXp' : totalXP,
  //     });
  //     return true;
  //   }catch(e){
  //     Fluttertoast.showToast(msg: "Sorry, could not save XP");
  //     return false;
  //   }
  //
  // }

  // Future<bool> updateLocalXP(String userID,  int totalXP, List<XpLocalData> hiveXpList) async{
  //   final ref = await SharedPreferences.getInstance();
  //   ref.setString(totalXp, totalXP.toString());
  //   try{
  //     for(int i = 0; i < hiveXpList.length; i++){
  //       await userCollection.doc(userID).collection('xps').doc(hiveXpList[i].day).set({
  //         'xp' : hiveXpList[i].xp,
  //         'day' : hiveXpList[i].day
  //       });
  //
  //       print("Saved ${hiveXpList[i].xp}");
  //     }
  //
  //
  //     await userCollection.doc(userID).update({
  //       'totalXp' : totalXP,
  //     });
  //     return true;
  //   }catch(e){
  //     Fluttertoast.showToast(msg: "Sorry, could not save XP");
  //     return false;
  //   }
  //
  // }

  // Future<bool> newLogicUpdateLocalXP(String userID,  int totalXP, List<XpLocalData> hiveXpList) async{
  //   final ref = await SharedPreferences.getInstance();
  //   ref.setString(totalXp, totalXP.toString());
  //   try{
  //     for(int i = 0; i < hiveXpList.length; i++){
  //       await userCollection.doc(userID).collection('xps').doc(hiveXpList[i].day).set({
  //         'xp' : hiveXpList[i].xp,
  //         'day' : hiveXpList[i].day
  //       });
  //       print("Saved ${hiveXpList[i].xp}");
  //     }
  //     await userCollection.doc(userID).update({
  //       'totalXp' : totalXP,
  //     });
  //     return true;
  //   }catch(e){
  //     Fluttertoast.showToast(msg: "Sorry, could not save XP");
  //     return false;
  //   }
  // }

  getRandomizedQuestions(String quizId, String type) async {
    return await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .where('type', isEqualTo: type)
        .get();
  }

  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

// static UploadTask uploadBytes(String destination, Uint8List data) {
//   try {
//     final ref = FirebaseStorage.instance.ref(destination);
//
//     return ref.putData(data);
//   } on FirebaseException catch (e) {
//     return null;
//   }
// }
}
