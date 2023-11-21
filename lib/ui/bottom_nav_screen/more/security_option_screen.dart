import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/ui/bottom_nav_screen/more/password_reset_flow/password_reset_screen.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_card.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';
import 'change_pin_screen.dart';

class SecurityOptionScreen extends StatelessWidget {
  const SecurityOptionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        children: [
          const TopPadding(),
          const IScanAppBar(
            title: security,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 33.h,
                  ),
                  CustomListTile(
                    iconSize: 33,
                    arrowColor: black,
                    subTitleColor: const Color.fromRGBO(0, 0, 0, 0.58),
                    titleColor: black,
                    title: changePin,
                    subTitle: changeYourTransactionPin,
                    bgColor: white,
                    onTap: () {
                      navToWithScreenName(
                          context: context, screen: const ChangePinScreen());
                      // navTo(context: context, path: Routes.changePinScreen);
                    },
                    leadingIcon: lockSmall,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomListTile(
                    iconSize: 33,
                    arrowColor: black,
                    subTitleColor: const Color.fromRGBO(0, 0, 0, 0.58),
                    titleColor: black,
                    leadingIcon: keyIcon,
                    title: changePassword,
                    subTitle: changeYourLoginPassword,
                    bgColor: white,
                    onTap: () {
                      navToWithScreenName(
                          context: context,
                          screen: const ChangePasswordScreen());
                      // navTo(
                      //     context: context, path: Routes.changePasswordScreen);
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomListTile(
                    iconSize: 34,
                    arrowColor: black,
                    subTitleColor: const Color.fromRGBO(0, 0, 0, 0.58),
                    titleColor: black,
                    leadingIcon: touchIdSmall,
                    title: biometricLogin,
                    subTitle: changeYourTransactionPin,
                    bgColor: white,
                    onTap: () {
                      //                     navToWithScreenName(
                      //   context: context, screen: const Paymen());
                      // navTo(context: context, path: Routes.paymentLinkScreen);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
