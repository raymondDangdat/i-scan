import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../Utils/go_router_route_names.dart';
import '../providers/dash_board_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';
import 'components.dart';
import 'custom_text.dart';

class BalanceCard extends StatelessWidget {
  final String walletType;
  final String walletBalance;
  final String ibnNumber;
  const BalanceCard(
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
            color: lightBlueTextColor, borderRadius: BorderRadius.circular(7)),
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
                            height: 23,
                            width: 23,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(100),
                                  image: const DecorationImage(
                                      image: AssetImage(euroIcon))),
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
                    const SizedBox(
                      width: 7,
                    ),
                    BodyTextPrimaryWithLineHeight(
                      text: dashboardProvider.showEuroBalance
                          ? walletType
                          : crypto,
                      textColor: white,
                      fontSize: 10,
                      lineHeight: 1.12,
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
                    color: white,
                    size: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                BodyTextPrimaryWithLineHeight(
                  text: "€00",
                  fontSize: 24,
                  textColor: white,
                  lineHeight: 1.22,
                  fontWeight: boldFont,
                ),
                BodyTextPrimaryWithLineHeight(
                  text: ".00",
                  fontSize: 14,
                  textColor: white,
                  lineHeight: 1.22,
                  fontWeight: boldFont,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            BodyTextLightWithLineHeight(
              text: dashboardProvider.showEuroBalance
                  ? "IBAN: GB93MOCK00000070803104"
                  : "",
              textColor: white,
              lineHeight: 1.12,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainerButton(
                  onTap: () {}, title: addFund,
                  bgColor: const Color.fromRGBO(0, 0, 0, 0.33),
                  // borderColor: const Color.fromRGBO(0, 0, 0, 0.33),
                  textColor: white,
                  height: 36,
                  horizontalPadding: 27,
                ),
                CustomContainerButton(
                  onTap: () {
                    context.push(context.namedLocation(loginRouteName));
                    // navToWithScreenName(
                    //     context: context,
                    //     screen: const LoginPassCodeScreen(),
                    //     isPushAndRemoveUntil: true);
                    // navTo(
                    //     context: context,
                    //     path: Routes.loginPasscodeScreen,
                    //     isPushAndRemoveUntil: true);
                  },
                  title: receive,
                  bgColor: white,
                  borderColor: white,
                  textColor: lightBlueTextColor,
                  height: 36,
                  horizontalPadding: 27,
                ),
                CustomContainerButton(
                  onTap: () {},
                  title: settings,
                  bgColor: white,
                  borderColor: white,
                  textColor: lightBlueTextColor,
                  height: 36,
                  horizontalPadding: 14,
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}

class BalanceCard2 extends StatelessWidget {
  final String walletType;
  final String ibnNumber;
  final double height;
  final Widget? buttonsWidget;
  const BalanceCard2(
      {Key? key,
      required this.walletType,
      this.height = 108,
      this.buttonsWidget,
      this.ibnNumber = ""})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (ctx, dashboardProvider, child) {
      return Container(
        // height: height.h,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        width: double.infinity,
        decoration: BoxDecoration(
            color: lightBlueTextColor, borderRadius: BorderRadius.circular(7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BodyTextPrimaryWithLineHeight(
                      text: dashboardProvider.showEuroBalance
                          ? walletType
                          : crypto,
                      textColor: white,
                      fontSize: 10,
                      lineHeight: 1.12,
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
                    color: white,
                    size: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                BodyTextPrimaryWithLineHeight(
                  text: "€00",
                  fontSize: 24,
                  textColor: white,
                  lineHeight: 1.22,
                  fontWeight: boldFont,
                ),
                BodyTextPrimaryWithLineHeight(
                  text: ".00",
                  fontSize: 14,
                  textColor: white,
                  lineHeight: 1.22,
                  fontWeight: boldFont,
                ),
              ],
            ),
            if (buttonsWidget != null)
              const SizedBox(
                height: 8,
              ),
            if (buttonsWidget != null) buttonsWidget!
          ],
        ),
      );
    });
  }
}
