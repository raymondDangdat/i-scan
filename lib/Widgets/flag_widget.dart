import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/constants/image_constant.dart';

class FlagWidget extends StatelessWidget {
  final double dimension;
  const FlagWidget({Key? key, this.dimension = 22}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      width: 22.h,
      decoration: BoxDecoration(
        // color: mainColor,
        borderRadius: BorderRadius.circular(100.r),
        image: const DecorationImage(
            image: AssetImage(nigerianFlag), fit: BoxFit.cover),
        // borderRadius: BorderRadius.circular(100.r)
      ),
    );
  }
}
