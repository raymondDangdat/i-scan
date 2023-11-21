import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:i_scan/model/qr_code_model.dart';
import 'package:i_scan/providers/auth_provider.dart';
import 'package:i_scan/resources/navigation_utils.dart';
import 'package:i_scan/services/data_service.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/constant_widgets.dart';
import '../../../../providers/attendance_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../confirm_attendance_screen/confirm_attendance_screen.dart';

class ScanToCheckInScreen extends StatefulWidget {
  const ScanToCheckInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanToCheckInScreenState();
}

class _ScanToCheckInScreenState extends State<ScanToCheckInScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  late AttendanceProvider attendanceProvider;
  late AuthProvider authProvider;
  Position? position;

  DocumentSnapshot? qrCode;
  QRCodeModel? qrCodeModel;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

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
    attendanceProvider = context.watch<AttendanceProvider>();
    authProvider = context.watch<AuthProvider>();
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        // top: false,
        child: Column(
          children: <Widget>[
            const TopPadding(),
            const IScanAppBar(
              title: "",
              arrowBackColor: white,
            ),
            Expanded(child: _buildQrView(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.h
        : 300.h;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: white,
          borderRadius: 20,
          borderLength: 20,
          borderWidth: 2,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      if (result?.code != null) {
        attendanceProvider.updateScannedResult(result);
        navToWithScreenName(
            context: context, screen: const ConfirmAttendanceScreen());
        debugPrint("Scanned Data: ${result?.code ?? ""}");
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
