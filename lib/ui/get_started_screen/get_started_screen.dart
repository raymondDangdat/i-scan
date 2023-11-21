import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/components.dart';
import '../../Widgets/custom_text.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';
import '../../resources/navigation_utils.dart';
import '../login_screen/login_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 63.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 41.w),
            child: const BodyTextPrimaryWithLineHeight(
              text: iScan,
              fontSize: 23.35,
              alignCenter: true,
              textColor: white,
              fontWeight: boldFont,
            ),
          ),
          SizedBox(
            height: 98.h,
          ),
          Container(
            height: 273.h,
            width: 292.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(stetescopImg), fit: BoxFit.fill)),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Column(
              children: [
                OutlineBtn(
                  createAccount,
                  () {
                    navToWithScreenName(
                        context: context, screen: const SignUpScreen());
                  },
                  backgroundColor: black,
                  textColor: white,
                  borderColor: white,
                ),
                SizedBox(
                  height: 17.h,
                ),
                MainButton(
                  haveAnAccount,
                  () {
                    navToWithScreenName(
                        context: context, screen: const LoginScreen());
                    // navTo(context: context, path: Routes.loginScreen);
                  },
                  color: white,
                  textColor: black,
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
