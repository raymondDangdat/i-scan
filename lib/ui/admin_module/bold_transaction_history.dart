import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/resources/constants/color_constants.dart';

class BoldTransactionHistoryView extends StatefulWidget {
  const BoldTransactionHistoryView({Key? key}) : super(key: key);

  @override
  State<BoldTransactionHistoryView> createState() =>
      _BoldTransactionHistoryViewState();
}

class _BoldTransactionHistoryViewState
    extends State<BoldTransactionHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 33.h),
          height: MediaQuery.of(context).size.height,
          child: Container(),
        ),
      ),
    );
  }
}
