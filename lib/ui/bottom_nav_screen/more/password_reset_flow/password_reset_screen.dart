import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/functions.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/constant_widgets.dart';
import '../../../../Widgets/custom_snack_back.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/label_widget.dart';
import '../../../../Widgets/textfields.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/success_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/string_constants.dart';
import '../../../../resources/navigation_utils.dart';
import '../../../forgot_password_flow/forgot_password_screen.dart';
import '../edit_profile_screens/info_edited_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopPadding(),
          const IScanAppBar(
            title: "",
            showWidget: true,
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const TitleWidget(
              title: resetPassword,
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 28.h,
                      ),
                      const LabelWidget(
                        label: oldPassword,
                        textColor: black,
                        fontWeight: boldFont,
                      ),
                      PwdField(
                        hint: "********",
                        controller: oldPasswordController,
                        isObscured: obscure,
                        hasBorder: true,
                        prefixIcon: const Icon(
                          Iconsax.lock,
                          color: prefixIconColor,
                        ),
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      const LabelWidget(
                        label: newPassword,
                        textColor: black,
                        fontWeight: boldFont,
                      ),
                      PwdField(
                        hint: "********",
                        controller: newPasswordController,
                        isObscured: obscure,
                        hasBorder: true,
                        prefixIcon: const Icon(
                          Iconsax.lock,
                          color: prefixIconColor,
                        ),
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      const LabelWidget(
                        label: confirmPassword,
                        textColor: black,
                        fontWeight: boldFont,
                      ),
                      PwdField(
                        hint: "********",
                        controller: confirmPasswordController,
                        isObscured: obscure,
                        hasBorder: true,
                        prefixIcon: const Icon(
                          Iconsax.lock,
                          color: prefixIconColor,
                        ),
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      navToWithScreenName(
                          context: context,
                          screen: const ForgotPasswordScreen());
                      // navTo(
                      //     context: context, path: Routes.forgotPasswordScreen);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SemiBold12px(
                          text: "Forgot Password?",
                          fontWeight: boldFont,
                          fontSize: 14,
                          textColor: black,
                        ),
                        SemiBold12px(
                          text: " Reset Now",
                          fontWeight: boldFont,
                          fontSize: 14,
                          textColor: Color(0xFF0093FF),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Consumer2<SuccessProvider, AuthProvider>(
                builder: (ctx, successProvider, authProvider, child) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (authProvider.resMessage != '') {
                  customSnackBar(context, authProvider.resMessage);

                  ///Clear the response message to avoid duplicate
                  authProvider.clear();
                }
              });
              return MainButton(
                authProvider.isLoading ? "Loading..." : continueTo,
                () async {
                  if (oldPasswordController.text.trim().length < 8) {
                    customSnackBar(context,
                        "Your old password is must be at least 8 characters");
                  } else if (newPasswordController.text.length < 8) {
                    customSnackBar(context,
                        "New password is must be at least 8 characters");
                  } else if (newPasswordController.text.trim() !=
                      confirmPasswordController.text.trim()) {
                    customSnackBar(
                        context, 'New password must match confirm password');
                  } else {
                    final passwordChanged = await authProvider.changePassword(
                        context: context,
                        oldPassword: oldPasswordController.text.trim(),
                        password: newPasswordController.text.trim());

                    if (mounted) {
                      popLoader(context: context);
                    }

                    if (mounted && passwordChanged) {
                      authProvider.updateProfileEditedMessage(passwordUpdated);
                      navToWithScreenName(
                          context: context, screen: const InfoEditedScreen());
                    }
                  }
                },
                color: black,
              );
            }),
          )
        ],
      )),
    );
  }
}
