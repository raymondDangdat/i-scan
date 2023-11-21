import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Widgets/custom_text.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class HashTrybeCard extends StatelessWidget {
  const HashTrybeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
      child: Column(
        children: [
          const Row(
            children: [
              BodyTextPrimaryWithLineHeight(
                text: hashTrybe,
                textColor: black,
                fontWeight: semiBoldFont,
                fontSize: 12,
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 29.w, right: 47.w, top: 41.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: black,
                  image: const DecorationImage(
                      image: AssetImage(connectHashItBg), fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 118.w,
                    child: BodyTextPrimaryWithLineHeight(
                      text:
                          "Meet new people, share all you want expressively- ",
                      fontSize: 10,
                      textColor: Colors.white.withOpacity(0.8999999761581421),
                    ),
                  ),
                  SizedBox(
                    width: 118.w,
                    child: BodyTextPrimaryWithLineHeight(
                      text: connectSocializeInspire,
                      fontSize: 10,
                      textColor: Colors.white.withOpacity(0.8999999761581421),
                      fontWeight: boldFont,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    width: 114.w,
                    child: const BodyTextPrimaryWithLineHeight(
                      text: joinTheHashTrybe,
                      fontWeight: boldFont,
                      fontSize: 20,
                      textColor: white,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
