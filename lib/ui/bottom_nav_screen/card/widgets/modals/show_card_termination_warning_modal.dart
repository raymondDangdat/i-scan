import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../../../Widgets/components.dart';
import '../../../../../../resources/constants/color_constants.dart';
import '../../../../../../resources/constants/dimension_constants.dart';
import '../../../../../../resources/constants/string_constants.dart';
import '../../../../../Widgets/modal_header_with_close_icon_widget.dart';
import '../../../../../Widgets/title_widget.dart';
import '../../../../../providers/auth_provider.dart';
import '../../../../../providers/card_provider.dart';
import '../../../../../resources/constants/image_constant.dart';

Future showCardTerminationWarningModal(BuildContext importedContext,
    {bool isTarget = true}) {
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
        child: Consumer2<CardProvider, AuthProvider>(
          builder: (ctx, cardProvider, authProvider, child) {
            return Container(
              margin: EdgeInsets.only(
                  bottom: bottomPadding.h,
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
                  SizedBox(height: 14.h),
                  const ModalHeaderWithCloseIconWidget(),
                  SizedBox(
                    height: 32.h,
                  ),
                  SvgPicture.asset(
                    terminateCardIcon,
                    height: 122.h,
                    width: 122.h,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  const TitleWidget(
                    title: areYouSureYouWantToTerminateYourCard,
                    fontSize: 24,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  OutlineBtn(
                    no,
                    () {
                      Navigator.pop(context);
                    },
                    borderRadius: 18,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  MainButton(
                    "Yes",
                    () {
                      String id = cardProvider.cardList[0].id;
                      cardProvider.manageCard(
                        id: id,
                        action: "close",
                        reason: "reason",
                      );
                      // Navigator.pop(context);
                      // showCardTerminatedModal(importedContext);
                    },
                    border: 18,
                    color: const Color(0xFF0C0C0C),
                    textColor: const Color.fromRGBO(252, 45, 95, 1),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
