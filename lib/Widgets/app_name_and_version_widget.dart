import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/constants/font_constants.dart';
import 'custom_text.dart';

class AppNameAndVersionWidget extends StatelessWidget {
  const AppNameAndVersionWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Medium12px(
            text: "HashIT App Ltd",
            fontSize: 10,
            fontWeight: boldFont,
            textColor: Color.fromRGBO(78, 82, 95, 1),
          ),
          SizedBox(
            height: 2.h,
          ),
          const Medium12px(
            text: "App version : 1.0.0",
            fontSize: 10,
            fontWeight: regularFont,
            textColor: Color.fromRGBO(78, 82, 95, 1),
          ),
        ],
      ),
    );
  }
}
