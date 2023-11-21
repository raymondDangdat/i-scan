import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/constant_widgets.dart';
import '../../../../Widgets/custom_snack_back.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/textfields.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/state_and_city_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/string_constants.dart';
import '../../../../resources/navigation_utils.dart';
import '../password_reset_flow/pin_reset_screen.dart';
import 'info_edited_screen.dart';

class ConfirmYourPhoneNumberScreen extends StatefulWidget {
  const ConfirmYourPhoneNumberScreen({Key? key}) : super(key: key);
  @override
  State<ConfirmYourPhoneNumberScreen> createState() =>
      _ConfirmYourPhoneNumberScreenState();
}

class _ConfirmYourPhoneNumberScreenState
    extends State<ConfirmYourPhoneNumberScreen> {
  final otpController = TextEditingController();

  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopPadding(),
              // SizedBox(height: 25.h,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(
                      title: confirmPhoneNumber,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    CustomTextWithLineHeight(
                      text: wellSendACodeToThePhone,
                      textColor: black,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Consumer2<AuthProvider, StateAndCityProvider>(
                      builder: (ctx, authProvider, countryProvider, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 19.h,
                        ),
                        const CustomTextWithLineHeight(
                          text: verificationCode,
                          textColor: black,
                          fontWeight: boldFont,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomField(
                          "*******",
                          otpController,
                          isCapitalizeSentence: false,
                          type: const TextInputType.numberWithOptions(
                              signed: true),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () async {
                                await authProvider.requestOtpForUpdateOrReset(
                                    isRequestOtp: true,
                                    showLoading: false,
                                    isEmail: false);
                              },
                              child: SemiBold12px(
                                text: authProvider.requestingOtpResend
                                    ? "Resending OTP..."
                                    : "Resend Code",
                                fontWeight: boldFont,
                                textColor: const Color(0xFF0093FF),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Consumer2<AuthProvider, StateAndCityProvider>(
                    builder: (ctx, authProvider, countryProvider, child) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (authProvider.resMessage != '') {
                      customSnackBar(context, authProvider.resMessage);

                      ///Clear the response message to avoid duplicate
                      authProvider.clear();
                    }
                  });
                  return MainButton(
                    authProvider.isVerifyingOtp
                        ? "Confirming Phone number..."
                        : authProvider.isLoading
                            ? "Updating phone number..."
                            : next,
                    () async {
                      if (otpController.text.length < 4) {
                        customSnackBar(context, "Please enter a valid OTP");
                      } else {
                        bool numberVerified =
                            await authProvider.requestOtpForUpdateOrReset(
                                isRequestOtp: false,
                                showLoading: false,
                                otp: otpController.text,
                                isEmail: false,
                                isVerifying: true);
                        if (mounted && numberVerified) {
                          bool isUpdated = await authProvider.updateUserInfo(
                              fieldName: "phone_number",
                              valueToUpdate:
                                  authProvider.phoneNumberOrEmailToEdit);
                          if (mounted && isUpdated) {
                            //Update the success message to show on the next screen
                            authProvider
                                .updateProfileEditedMessage(phoneNumberUpdated);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            if (authProvider.isChangePIN) {
                              //  ROUTE TO CHANGE/RESET PIN SCREEN
                              navToWithScreenName(
                                  context: context,
                                  screen: const ResetPINScreen());
                              // navTo(
                              //     context: context,
                              //     path: Routes.resetPINScreen);

                              authProvider.updateIsChangePIN(false);
                            } else {
                              navToWithScreenName(
                                  context: context,
                                  screen: const InfoEditedScreen());
                              //  navTo(
                              //   context: context,
                              //   path: Routes.profileUpdatedScreen);
                            }
                          }
                        }
                      }
                    },
                  );
                }),
              ),
              SizedBox(
                height: bottomPadding.h,
              )
            ],
          )),
    );
  }
}
