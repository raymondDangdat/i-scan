import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_scan/Widgets/pull_down_indicator.dart';

import '../resources/constants/dimension_constants.dart';
import '../resources/constants/image_constant.dart';

class ModalHeaderWithCloseIconWidget extends StatelessWidget {
  const ModalHeaderWithCloseIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: horizontalPadding.w),
          child: Container(width: 40),
        ),
        const PullDownIndicator(),
        Padding(
          padding: EdgeInsets.only(right: horizontalPadding.w),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(closeIconSvg)),
        )
      ],
    );
  }
}
