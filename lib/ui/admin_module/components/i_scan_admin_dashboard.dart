import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:i_scan/Widgets/components.dart';
import 'package:i_scan/providers/attendance_provider.dart';
import 'package:i_scan/providers/auth_provider.dart';
import 'package:i_scan/resources/constants/dimension_constants.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../model/qr_code_model.dart';
import '../../../services/data_service.dart';

class IScanAdminDashboard extends StatefulWidget {
  const IScanAdminDashboard({Key? key}) : super(key: key);

  @override
  State<IScanAdminDashboard> createState() => _IScanAdminDashboardState();
}

class _IScanAdminDashboardState extends State<IScanAdminDashboard> {
  PageController controller = PageController(viewportFraction: 0.95);
  var currentPageValue = 0.0;

  final currentPageNotifier = ValueNotifier<int>(0);

  late AuthProvider lateAuthProvider;

  Position? position;

  DocumentSnapshot? qrCode;
  QRCodeModel? qrCodeModel;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final attendanceProvider =
          Provider.of<AttendanceProvider>(context, listen: false);
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      //  Get the device current location
      position =
          await attendanceProvider.determineCurrentPosition(context: context);

      qrCode = await DatabaseService(
              uId: authProvider.firebaseUserProfile?.userId ?? "")
          .getQRCodeData();

      if (qrCode != null && qrCode!.exists) {
        qrCodeModel = QRCodeModel.fromDocument(qrCode!);
        debugPrint(qrCodeModel!.long);
        //  Calculate the distance
        if (position != null) {
          attendanceProvider.calculateDistance(
              position!.latitude,
              position!.latitude,
              double.parse(qrCodeModel!.lat),
              double.parse(qrCodeModel!.long));
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, AttendanceProvider>(
        builder: (ctx, authProvider, attendanceProvider, child) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
        child: Column(
          children: [
            SizedBox(
              height: 54.h,
            ),
            IScanAppBar(
              title:
                  "Welcome, ${authProvider.firebaseUserProfile?.firstName ?? 'Unknown'}",
              showBackButton: false,
            ),
            SizedBox(
              height: 20.h,
            ),
            qrCodeModel == null
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 100.h, bottom: 50.h),
                      child: const CupertinoActivityIndicator(),
                    ),
                  )
                : SizedBox(
                    width: 300.h,
                    height: 300.h,
                    child: QrImageView(
                      data:
                          '{"lat": "${qrCodeModel?.lat ?? 0}", "long": "${qrCodeModel?.long}", "date": "${qrCodeModel?.dateTime}"}',
                      version: QrVersions.auto,
                      size: 300.h,
                    ),
                  ),
            SizedBox(
              height: 10.h,
            ),
            MainButton("Re-Generate QR Code", () async {
              await attendanceProvider.determineCurrentPosition(
                  context: context);
              debugPrint(
                  "User ID: ${authProvider.firebaseUserProfile?.userId}");
              await DatabaseService(
                      uId: authProvider.firebaseUserProfile?.userId)
                  .saveQRCode(
                      lat: '${position?.latitude ?? "0"}',
                      long: '${position?.longitude ?? "0"}',
                      dateTime: DateTime.now().toString());
              debugPrint("Position ${position?.latitude}");
            })
          ],
        ),
      );
    });
  }
}
