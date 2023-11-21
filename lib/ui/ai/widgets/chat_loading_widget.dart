import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ChatLoadingWidget extends StatelessWidget {
  const ChatLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 45,
        width: 80,
        margin: EdgeInsets.only(
          top: 20.h,
        ),
        padding: const EdgeInsets.all(18),
        decoration: const ShapeDecoration(
          color: Color(0x19EEF5FF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
        ),
        child: const LoadingIndicator(
          indicatorType: Indicator.ballBeat,
          colors: [Colors.white],
          strokeWidth: 1,
          pathBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}
