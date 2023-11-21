import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Widgets/components.dart';
import '../../Widgets/custom_text.dart';
import '../../providers/auth_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/dimension_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';
import '../../resources/routes_manager.dart';

class PasswordResetSuccessfullyScreen extends StatefulWidget {
  const PasswordResetSuccessfullyScreen({Key? key}) : super(key: key);
  @override
  State<PasswordResetSuccessfullyScreen> createState() =>
      _PasswordResetSuccessfullyScreenState();
}

class _PasswordResetSuccessfullyScreenState
    extends State<PasswordResetSuccessfullyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 217.h,
              ),
              Center(
                child: Consumer<AuthProvider>(builder: (ctx, auth, child) {
                  return Column(
                    children: [
                      Container(
                        height: 120.h,
                        width: 120.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(successIcon),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      const CustomTextWithLineHeight(
                          text: passwordResetSuccessfully,
                          fontSize: 16,
                          alignCenter: true,
                          textColor: Color(0xFF282828),
                          fontWeight: boldFont),
                    ],
                  );
                }),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: MainButton(done, () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.loginScreen, (route) => false);
                }),
              ),
              SizedBox(
                height: bottomPadding.h,
              ),
            ],
          )),
    );
  }
}
