import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/constants/color_constants.dart';
import '../resources/constants/dimension_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';
import 'cached_network_image_widget.dart';
import 'components.dart';
import 'custom_text.dart';

Future showInsufficientBalanceModal(BuildContext importedContext) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    context: importedContext,
    backgroundColor: white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(modalRadius.r),
          topRight: Radius.circular(modalRadius.r)),
    ),
    builder: (BuildContext context) {
      return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
              margin: EdgeInsets.only(
                  top: 14.h,
                  left: horizontalPadding.w,
                  right: horizontalPadding.w),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(modalRadius.r),
                    topRight: Radius.circular(modalRadius.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWithLineHeight(
                              text: insufficientBalance,
                              fontSize: 24,
                              fontWeight: boldFont,
                              textColor: Color(0xFF181C26),
                              alignCenter: true,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const BodyTextPrimaryWithLineHeight(
                          text: youDoNotHaveEnough,
                          fontSize: 10,
                          alignCenter: true,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          height: 100.h,
                          width: 105.w,
                          child: const CachedNetworkImageWidget(
                              height: 100, imageUrl: insufficientFundImgURL),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        MainButton(
                          topUpWallet,
                          () {
                            Navigator.pop(context);
                          },
                          color: black,
                        )
                      ],
                    ),
                  ),
                ],
              )));
    },
  );
}
