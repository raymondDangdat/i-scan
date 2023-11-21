import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:i_scan/resources/constants/dimension_constants.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_snack_back.dart';
import '../../../Widgets/custom_text.dart';
import '../../../providers/auth_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/string_constants.dart';
import '../../Widgets/i_scan_logo_widget.dart';
import '../../Widgets/modals/show_attendance_error_modal.dart';
import '../../Widgets/title_widget.dart';
import '../../model/qr_code_model.dart';
import '../../providers/attendance_provider.dart';
import '../../resources/constants/image_constant.dart';
import '../../services/data_service.dart';

class ConfirmAttendanceScreen extends StatefulWidget {
  const ConfirmAttendanceScreen({Key? key}) : super(key: key);
  @override
  State<ConfirmAttendanceScreen> createState() =>
      _ConfirmAttendanceScreenState();
}

class _ConfirmAttendanceScreenState extends State<ConfirmAttendanceScreen> {
  late AttendanceProvider attendanceProvider;
  late AuthProvider authProvider;
  Position? position;

  DocumentSnapshot? qrCode;
  QRCodeModel? qrCodeModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final attendanceProvider =
          Provider.of<AttendanceProvider>(context, listen: false);
      if (mounted) {
        //  Get the device current location
        position =
            await attendanceProvider.determineCurrentPosition(context: context);
        setState(() {});
      }
      qrCode = await DatabaseService(
              uId: authProvider.firebaseUserProfile?.userId ?? "")
          .getQRCodeData();
      if (qrCode != null && qrCode!.exists) {
        qrCodeModel = QRCodeModel.fromDocument(qrCode!);
        debugPrint(qrCodeModel!.long);
        //  Calculate the distance
        if (position != null) {
          await attendanceProvider.calculateDistance(
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
    authProvider = context.watch<AuthProvider>();
    attendanceProvider = context.watch<AttendanceProvider>();
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 56.h,
              ),
              const IScanLogoWidget(),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TitleWidget(
                            title: "QR Code Scanned",
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          SizedBox(
                              width: 30.h,
                              height: 30.h,
                              child: Image.asset(congratImg)),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const CustomTextWithLineHeight(
                        text: youAreLoggedInAs,
                        textColor: black,
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Row(
                        children: [
                          const BodyTextPrimaryWithLineHeight(
                            text: "Full Name: ",
                          ),
                          TitleWidget(
                            title:
                                "${authProvider.firebaseUserProfile?.firstName} ${authProvider.firebaseUserProfile?.lastName}",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Row(
                        children: [
                          const BodyTextPrimaryWithLineHeight(
                            text: "Rank: ",
                          ),
                          TitleWidget(
                            title: "${authProvider.firebaseUserProfile?.rank}",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Consumer2<AuthProvider, AttendanceProvider>(
                    builder: (ctx, authProvider, attendanceProvider, child) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (authProvider.resMessage != '') {
                      customSnackBar(context, authProvider.resMessage);

                      ///Clear the response message to avoid duplicate
                      authProvider.clear();
                    }
                  });
                  return MainButton(
                    "Submit Attendance",
                    () async {
                      // Convert Dart string to JSON
                      var jsonnr = json
                          .decode(attendanceProvider.scannedResult?.code ?? "");
                      debugPrint("JSON :::::${jsonnr['lat']}");

                      debugPrint("QR Code Model: $qrCodeModel");
                      debugPrint("Position: $position");

                      setState(() {});

                      if (qrCodeModel != null && position != null) {
                        // calculate the distance
                        double distance =
                            await attendanceProvider.calculateDistance(
                                position!.latitude,
                                position!.longitude,
                                double.parse(jsonnr['lat']),
                                double.parse(jsonnr['long']));

                        if (mounted && distance < 1000) {
                          attendanceProvider.checkInOrOut(userId: authProvider.firebaseUserProfile?.userId ?? "", context: context, user: authProvider.firebaseUserProfile!);
                        } else {
                          if (mounted) {
                            Future.delayed(const Duration(seconds: 2), () {
                              showAttendanceErrorModal(context);
                            });
                          }
                        }
                      } else {
                        customSnackBar(context,
                            "Your location and the QR code from cloud must be available, try again");
                       await attendanceProvider.determineCurrentPosition(context: context);
                        qrCode = await DatabaseService(
                            uId: authProvider.firebaseUserProfile?.userId ?? "")
                            .getQRCodeData();


                      }
                      setState(() {});
                      // context.push(context.namedLocation(loginRouteName));
                    },
                  );
                }),
              )
            ],
          )),
    );
  }
}
