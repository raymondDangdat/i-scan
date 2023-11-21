import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../Widgets/components.dart';
import '../../../../../../resources/constants/color_constants.dart';
import '../../../../../../resources/constants/dimension_constants.dart';
import '../../../../../../resources/constants/font_constants.dart';
import '../../../../../../resources/constants/string_constants.dart';
import '../../../../../Widgets/modal_header_with_close_icon_widget.dart';
import '../../../../../Widgets/thumb_up_widget.dart';
import '../../../../../Widgets/title_widget.dart';
import '../../../../../providers/auth_provider.dart';
import '../../../../../providers/card_provider.dart';

Future showCardTerminatedModal(BuildContext importedContext,
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
                    const ThumbUpWidget(),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomContainerButton(
                          onTap: () {},
                          title: successful,
                          borderRadius: 8,
                          verticalPadding: 8,
                          horizontalPadding: 8,
                          fontSize: 10,
                          fontWeight: boldFont,
                          bgColor: const Color(0xFFEAFFF3),
                          textColor: const Color.fromRGBO(27, 151, 84, 1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const TitleWidget(
                      title: youHaveSuccessfullyTerminatedYourCard,
                      fontSize: 24,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    MainButton(
                      cardDashboard,
                      () {
                        Navigator.pop(context);
                        cardProvider.updateCardScreenStep(2);
                      },
                      border: 16,
                      color: const Color(0xFF0C0C0C),
                    ),
                  ],
                ));
          }));
    },
  );
}
