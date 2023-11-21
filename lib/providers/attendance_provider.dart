import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:i_scan/Utils/functions.dart';
import 'package:i_scan/Utils/go_router_route_names.dart';
import 'package:i_scan/Widgets/custom_snack_back.dart';
import 'package:i_scan/model/firebase_user_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../services/data_service.dart';

class AttendanceProvider extends ChangeNotifier {
  String _resMessage = "";
  String get resMessage => _resMessage;

  double _distance = 0.0;
  double get distance => _distance;

  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;
  void updateCurrentPosition(Position? position) {
    _currentPosition = position;
    notifyListeners();
  }

  Barcode? _scannedResult;
  Barcode? get scannedResult => _scannedResult;

  void updateScannedResult(Barcode? result) {
    _scannedResult = result;
    notifyListeners();
  }

  DocumentSnapshot? _qrCode;
  DocumentSnapshot? get qrCode => _qrCode;

  void updateQRCode(DocumentSnapshot? qrCode) {
    _qrCode = qrCode;
    notifyListeners();
  }


  QuerySnapshot? _todayAttendanceSnapshot;
  QuerySnapshot? get todayAttendanceSnapshot => _todayAttendanceSnapshot;

  bool _gettingTodayAttendanceStatus = false;
  bool get gettingTodayAttendanceStatus => _gettingTodayAttendanceStatus;


  Future<void> getTodayAttendanceStatus(String userId)async{
    _gettingTodayAttendanceStatus = true;
    _todayAttendanceSnapshot = null;
    notifyListeners();
    _todayAttendanceSnapshot = await DatabaseService(uId: userId).getAttendanceToday();
    _gettingTodayAttendanceStatus = false;
    notifyListeners();
  }


  Future<void> getDocAttendances(String userId)async{
    await DatabaseService(uId: userId).getDrAttendance();

  }

  Future<void> checkInOrOut({required String userId, required BuildContext context, required FirebaseUserModel user})async{
    showIScanLoader(context, message: _todayAttendanceSnapshot!.docs.isEmpty ? "Checking In..." : "Checking Out...");

    if(_todayAttendanceSnapshot!.docs.isEmpty){
    //  PERFORM GENERAL CHECK IN AFTER
      bool isChecked = await DatabaseService(
          uId: userId)
          .checkInOrCheckOut(isCheckIn: _todayAttendanceSnapshot!.docs.isEmpty ? true : false);
      await DatabaseService(uId: userId).checkIn(user: user);
      getTodayAttendanceStatus(userId);
      if(context.mounted){
        popLoader(context: context);
      }
      if(isChecked && context.mounted){
        context.go(iScanDrDashboardRoute);
      }else{

      }
    }else{
    //  PERFORM GENERAL CHECKOUT AFTER
      bool isChecked = await DatabaseService(
          uId: userId)
          .checkInOrCheckOut(isCheckIn: _todayAttendanceSnapshot!.docs.isEmpty ? true : false);
      await DatabaseService(uId: userId).checkOut();
      getTodayAttendanceStatus(userId);
      if(context.mounted){
        popLoader(context: context);
      }
      if(isChecked && context.mounted){
        context.go(iScanDrDashboardRoute);
      }else{

      }
    }

  }

  Future<double> calculateDistance(
      currentLat, currentLong, qrCodeLat, qrCodeLong) async {
    double localDistance = 0.0;
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((qrCodeLat - currentLat) * p) / 2 +
        cos(currentLat * p) *
            cos(qrCodeLat * p) *
            (1 - cos((qrCodeLong - currentLong) * p)) /
            2;
    localDistance = 12742 * asin(sqrt(a));

    localDistance = double.parse((localDistance).toStringAsFixed(2));

    _distance = localDistance;
    print("The distance is: $_distance");
    notifyListeners();
    return localDistance;
  }

  //VARIABLE TO DETERMINE IF THE LOCATION IS GRANTED
  bool _locationFetched = false;
  bool get locationFetched => _locationFetched;

  bool _gettingLocation = false;
  bool get gettingLocation => _gettingLocation;

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determineCurrentPosition(
      {required BuildContext context}) async {
    bool serviceEnabled;
    LocationPermission permission;
    _locationFetched = false;
    _gettingLocation = true;
    notifyListeners();

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      if (context.mounted) {
        customSnackBar(context, "Location services are disabled.");
      }

      notifyListeners();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        if (context.mounted) {
          customSnackBar(context, 'Location permissions are denied');
        }
        notifyListeners();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      if (context.mounted) {
        customSnackBar(context,
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      notifyListeners();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _locationFetched = true;
    _gettingLocation = false;
    notifyListeners();
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
