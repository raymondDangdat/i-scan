import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/Widgets/title_widget.dart';

import '../resources/constants/color_constants.dart';
import '../resources/constants/dimension_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';
import 'custom_text.dart';

class OpportunityWidget extends StatelessWidget {
  const OpportunityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyTextPrimaryWithLineHeight(
                text: opportunities,
                textColor: Color(0xFF0E0E0E),
                fontWeight: boldFont,
                fontSize: 15,
                lineHeight: 1.5,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 204.h,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(opportunitiesBgUrl), fit: BoxFit.cover),
                // color: const Color(0xFF0B7ACC),
                borderRadius: BorderRadius.circular(16.r)),
            child: Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWidget(
                        title: winBig,
                        textColor: white,
                        fontSize: 32,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const TitleWidget(
                        title: joinTheHashItFest,
                        textColor: white,
                        fontSize: 12,
                        fontWeight: mediumFont,
                      ),
                      const TitleWidget(
                        title: win1Million,
                        textColor: white,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
