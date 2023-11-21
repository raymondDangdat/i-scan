import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:i_scan/Utils/go_router_route_names.dart';
import 'package:i_scan/Widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../../../../../../Widgets/components.dart';
import '../../../../../../resources/constants/color_constants.dart';
import '../../../../../../resources/constants/dimension_constants.dart';
import '../../../../../../resources/constants/string_constants.dart';
import '../../../../../Widgets/modal_header_with_close_icon_widget.dart';
import '../../../../../Widgets/title_widget.dart';
import '../../../../../providers/auth_provider.dart';
import '../../../../../providers/card_provider.dart';

Future showAttendanceErrorModal(BuildContext importedContext, {bool isTarget = true}) {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 14.h),
                  const ModalHeaderWithCloseIconWidget(),
                  SizedBox(
                    height: 49.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleWidget(
                        title: errorTakingAttendance,
                        fontSize: 24,
                      )
                    ],
                  ),

                  SizedBox(
                    height: 32.h,
                  ),

                  const BodyTextPrimaryWithLineHeight(text: "You don't seem to be in the same location with the Hospital",
                  alignCenter: true, fontSize: 18,),
                  SizedBox(
                    height: 24.h,
                  ),

                  MainButton(okay, () async {
                    context.go(iScanDrDashboardRoute);
                  })
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
