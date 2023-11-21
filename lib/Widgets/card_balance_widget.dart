import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../providers/dash_board_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';
import '../ui/bottom_nav_screen/home/widgets/account_details_modal.dart';
import 'components.dart';
import 'custom_text.dart';

class CardBalanceWidget extends StatelessWidget {
  final String walletType;
  final String walletBalance;
  final String ibnNumber;
  const CardBalanceWidget(
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
        decoration:
            BoxDecoration(color: white, borderRadius: BorderRadius.circular(7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    dashboardProvider.showEuroBalance
                        ? Container(
                            padding: const EdgeInsets.all(2),
                            height: 23.h,
                            width: 23.h,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(100),
                                  image: const DecorationImage(
                                      image: AssetImage(ngFlag))),
                            ),
                          )
                        : Container(
                            height: 23,
                            width: 23,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
                                    image: AssetImage(btcIcon),
                                    fit: BoxFit.cover)),
                          ),
                    SizedBox(
                      width: 7.w,
                    ),
                    const BodyTextPrimaryWithLineHeight(
                      text: "Nigeria Naira (NGN)",
                      textColor: Color.fromRGBO(29, 29, 29, 1),
                      fontSize: 12,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    dashboardProvider.toggleShowBalance();
                  },
                  child: Icon(
                    dashboardProvider.showBalance
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                    color: black,
                    size: 20,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            const Row(
              children: [
                BodyTextPrimaryWithLineHeight(
                  text: "N1,000,000",
                  fontSize: 24,
                  textColor: black,
                  lineHeight: 1.22,
                  fontWeight: boldFont,
                ),
                BodyTextPrimaryWithLineHeight(
                  text: ".00",
                  fontSize: 14,
                  textColor: black,
                  lineHeight: 1.22,
                  fontWeight: boldFont,
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainerButton(
                  onTap: () {
                    showAccountDetailsModal(context);
                  },
                  widget: Row(
                    children: [
                      const Icon(
                        Iconsax.wallet_add,
                        color: white,
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      const Medium12px(
                        text: fund,
                        fontWeight: mediumFont,
                        textColor: white,
                      )
                    ],
                  ),
                  title: fund,
                  bgColor: mainColor,
                  textColor: white,
                  height: 36,
                  borderRadius: 6.r,
                  horizontalPadding: 10.w,
                ),
                CustomContainerButton(
                  borderRadius: 6.r,
                  onTap: () {},
                  widget: Row(
                    children: [
                      const Icon(
                        Iconsax.wallet_minus,
                        color: mainColor,
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      const Medium12px(
                        text: withdraw,
                        fontWeight: mediumFont,
                        textColor: mainColor,
                      )
                    ],
                  ),
                  title: withdraw,
                  bgColor: white,
                  borderColor: mainColor,
                  textColor: lightBlueTextColor,
                  height: 36,
                  horizontalPadding: 10.w,
                ),
                CustomContainerButton(
                  borderRadius: 6.r,
                  widget: Row(
                    children: [
                      const Icon(
                        Iconsax.repeat,
                        color: mainColor,
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      const Medium12px(
                        text: swap,
                        fontWeight: mediumFont,
                        textColor: mainColor,
                      )
                    ],
                  ),
                  onTap: () {},
                  title: swap,
                  bgColor: white,
                  borderColor: mainColor,
                  textColor: lightBlueTextColor,
                  height: 36,
                  horizontalPadding: 10.w,
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
