import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/constants/color_constants.dart';
import '../resources/constants/image_constant.dart';

class IScanLogoWidget extends StatelessWidget {
  const IScanLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(100.r),
          image: const DecorationImage(
              image: AssetImage(stetescopImg), fit: BoxFit.fill)),
    );
  }
}
