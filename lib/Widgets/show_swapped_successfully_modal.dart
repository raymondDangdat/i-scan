import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';
import 'components.dart';
import 'custom_text.dart';

Future showSwappedSuccessfullyModal(
    {required BuildContext context,
    required String dollarAmount,
    required String nairaEquivalent}) {
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      return Container(
        constraints: BoxConstraints(minHeight: 275.h, maxHeight: 300.h),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 27.h,
            ),
            Container(
              height: 70.h,
              width: 78.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(swapIcon), fit: BoxFit.cover),
              ),
            ),

            SizedBox(
              height: 11.h,
            ),

            SizedBox(
              width: 206.w,
              child: CustomTextWithLineHeight(
                text:
                    "You have successful swapped \$$dollarAmount into NGN$nairaEquivalent",
                alignCenter: true,
                fontWeight: boldFont,
                textColor: const Color.fromRGBO(85, 85, 85, 1),
              ),
            ),

            const Spacer(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: OutlineBtn(done, () {
                Navigator.pop(context);
              }),
            ),

            SizedBox(
              height: 20.h,
            ),

            //  You have successful swapped
            // $100 into NGN30,000
          ],
        ),
      );
    }),
  );
}
