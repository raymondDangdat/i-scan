import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/Widgets/custom_snack_back.dart';
import 'package:i_scan/Widgets/modal_header_with_close_icon_widget.dart';
import 'package:i_scan/resources/constants/dimension_constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/string_constants.dart';
import '../components.dart';
import '../custom_text.dart';
import '../long_divider.dart';

Future showDeviceChangedModal(
  BuildContext importedContext, {
  bool isWallet = true,
}) {
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: importedContext,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      return Container(
        constraints: BoxConstraints(minHeight: 330.h, maxHeight: 400.h),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 14.h),
            const ModalHeaderWithCloseIconWidget(),
            SizedBox(
              height: 19.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SemiBold16px(
                  text: deviceChanged,
                  fontSize: 15,
                  fontWeight: boldFont,
                  textColor: Color(0xFF1A202C),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: const LongDivider(),
            ),

            SizedBox(height: 50.h,),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding.w
              ),
              child: const BodyTextPrimaryWithLineHeight(text: "Looks like you are logged in with a different device from the one you registered with!",
              alignCenter: true, fontSize: 18, textColor: mainColor,),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: Column(
                children: [
                  Consumer<AuthProvider>(
                      builder: (ctx, authProvider, child) {
                      return MainButton(requestDeviceUpdate, () async{
                      bool sent =   await authProvider.sendDeviceRequestUpdate(context: context);

                      if(context.mounted && sent){
                        customSnackBar(context, "Request sent!");
                        Navigator.pop(context);
                      }else{
                        if(context.mounted){
                          customSnackBar(context, "Could not send request");
                        }
                      }
                      });
                    }
                  )
                ],
              ),
            )
          ],
        ),
      );
    }),
  );
}
