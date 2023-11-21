import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../providers/dash_board_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';
import 'custom_text.dart';

class CardDetailWidget extends StatelessWidget {
  final String walletType;
  final String walletBalance;
  final String ibnNumber;
  const CardDetailWidget(
      {Key? key,
      required this.walletType,
      required this.walletBalance,
      this.ibnNumber = ""})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (ctx, dashboardProvider, child) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(41, 41, 41, 1),
            borderRadius: BorderRadius.circular(7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    dashboardProvider.toggleShowBalance();
                  },
                  child: Icon(
                    dashboardProvider.showBalance
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                    color: white,
                    size: 20,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 34.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BodyTextPrimaryWithLineHeight(
                  text: "567386******4563",
                  fontSize: 14,
                  textColor: white,
                  letterSpacing: 10,
                  lineHeight: 1.4,
                  fontWeight: regularFont,
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30.w,
                  child: const BodyTextPrimaryWithLineHeight(
                    text: "VALID THRU",
                    fontSize: 10,
                    textColor: white,
                    lineHeight: 1.4,
                    fontWeight: regularFont,
                  ),
                ),
                SizedBox(
                  width: 11.w,
                ),
                const BodyTextPrimaryWithLineHeight(
                  text: "05/26",
                  fontSize: 10,
                  textColor: white,
                  lineHeight: 1.4,
                  fontWeight: regularFont,
                ),
                SizedBox(
                  width: 27.w,
                ),
                const BodyTextPrimaryWithLineHeight(
                  text: "CVV  053",
                  fontSize: 10,
                  textColor: white,
                  lineHeight: 1.4,
                  fontWeight: regularFont,
                ),
              ],
            ),
            SizedBox(
              height: 34.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 13.w, top: 16.h),
                  child: const BodyTextPrimaryWithLineHeight(
                    text: virtualCard,
                    textColor: white,
                    fontWeight: boldFont,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 16.w,
                  ),
                  child: SizedBox(
                      height: 23.h, width: 66.w, child: Image.asset(visaImg)),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
