import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_scan/ui/forgot_password_flow/reset_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../Utils/functions.dart';
import '../../Widgets/components.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/title_widget.dart';
import '../../providers/auth_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';
import '../../resources/navigation_utils.dart';

class ConfirmEmailOrPhoneNumberScreen extends StatefulWidget {
  const ConfirmEmailOrPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmEmailOrPhoneNumberScreen> createState() =>
      _ConfirmEmailOrPhoneNumberScreenState();
}

class _ConfirmEmailOrPhoneNumberScreenState
    extends State<ConfirmEmailOrPhoneNumberScreen> {
  final emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  Color incompleteContainerColor = const Color(0xFF282828);
  Color completeContainerColor = const Color.fromRGBO(49, 184, 95, 1);
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          bottom: false,
          // top: false,
          child: Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios_new_rounded)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 31.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(
                        title:
                            "Confirm your ${authProvider.isUseEmailForPasswordReset ? 'email address' : 'phone number'}",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 345.w,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'We’ll send a code to ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: authProvider.emailOrPhoneController.text,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(
                                text: ' to confirm it belongs to you.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: otpController.text.length < 4
                                ? incompleteContainerColor
                                : completeContainerColor,
                            borderRadius: BorderRadius.circular(18.r)),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 23.w, vertical: 25.h),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: const TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                          ),
                          textStyle: const TextStyle(color: white),
                          length: 4,
                          obscureText: true,
                          autoFocus: true,
                          obscuringCharacter: '*',
                          obscuringWidget: SvgPicture.asset(
                            otpObscureImg,
                            color: otpController.text.length < 4
                                ? const Color.fromRGBO(255, 255, 255, 0.38)
                                : white,
                          ),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 47,
                            fieldWidth: 47,
                            activeColor:
                                const Color.fromRGBO(255, 255, 255, 0.38),
                            inactiveColor: otpController.text.length < 4
                                ? const Color.fromRGBO(255, 255, 255, 0.38)
                                : white,
                            inactiveFillColor: otpController.text.length < 4
                                ? incompleteContainerColor
                                : completeContainerColor,
                            selectedColor: otpController.text.length < 4
                                ? const Color.fromRGBO(255, 255, 255, 0.38)
                                : white,
                            selectedFillColor: otpController.text.length < 4
                                ? incompleteContainerColor
                                : completeContainerColor,
                            activeFillColor: otpController.text.length < 4
                                ? incompleteContainerColor
                                : completeContainerColor,
                          ),
                          cursorColor: white,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            debugPrint("Completed");
                            setState(() {});
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            debugPrint(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Regular12px(
                            text: didntReceiveOtp,
                            textColor: black,
                          ),
                          InkWell(
                            onTap: () async {
                              await authProvider.requestOrVerifyOtp(
                                  isRequestOtp: true,
                                  isResendOTP: true,
                                  context: context,
                                  showLoading: false);
                            },
                            child: SemiBold12px(
                              text: authProvider.requestingOtpResend
                                  ? "Resending OTP..."
                                  : resend,
                              fontWeight: boldFont,
                              textColor: const Color(0xFF0093FF),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      MainButton(
                        authProvider.verifyingOtp ? "Verifying..." : verify,
                        () async {
                          if (!authProvider.verifyingOtp) {
                            if (otpController.text.isNotEmpty &&
                                otpController.text.trim().length > 3) {
                              bool isVerified =
                                  await authProvider.verifyPasswordResetOtp(
                                      otp: otpController.text,
                                      context: context);
                              if (mounted) {
                                popLoader(context: context);
                              }
                              if (mounted && isVerified) {
                                navToWithScreenName(
                                    context: context,
                                    screen: const ResetPasswordScreen());
                                // navTo(
                                //     context: context,
                                //     path: Routes.resetPasswordScreen);
                              } else {
                                //  For testing\
                                //   openResetPasswordScreen(context);
                              }
                            }
                          }
                        },
                        color: black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            );
          })),
    );
  }
}
