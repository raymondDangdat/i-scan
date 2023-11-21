import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../Widgets/components.dart';
import '../../Widgets/custom_snack_back.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/label_widget.dart';
import '../../Widgets/textfields.dart';
import '../../providers/auth_provider.dart';
import '../../providers/state_and_city_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';
import '../../resources/navigation_utils.dart';
import '../login_screen/login_screen.dart';
import 'confirm_email_or_phone_number_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          bottom: false,
          child: Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 31.h,
                ),
                Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(hashitBlackIcon),
                    SizedBox(
                      height: 28.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomTextWithLineHeight(
                          text: forgotPasswordd,
                          textColor: Color(0xFF282828),
                          fontWeight: boldFont,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 21.h,
                          width: 21.w,
                          child: Image.asset(wearyFace),
                        )
                      ],
                    ),
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWithLineHeight(
                      text:
                          "Please provide your correct registered ${authProvider.isUseEmailForPasswordReset ? 'email' : 'phone number'}",
                      textColor: const Color.fromRGBO(0, 0, 0, 0.37),
                      fontWeight: mediumFont,
                      fontSize: 12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 38.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelWidget(
                            label: authProvider.isUseEmailForPasswordReset
                                ? "Email"
                                : phoneNumber),
                        Row(
                          children: [
                            Expanded(
                              child: CustomField(
                                authProvider.isUseEmailForPasswordReset
                                    ? email
                                    : phoneNumber,
                                authProvider.emailOrPhoneController,
                                isCapitalizeSentence: false,
                                type: TextInputType.emailAddress,
                                prefixIcon: Icon(
                                  authProvider.isUseEmailForPasswordReset
                                      ? Iconsax.sms
                                      : Iconsax.mobile,
                                  color: prefixIconColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              authProvider.toggleUseEmailForPasswordReset();
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomTextWithLineHeight(
                                text: authProvider.isUseEmailForPasswordReset
                                    ? usePhoneNumberInstead
                                    : "Use email instead",
                                textColor: const Color(0xFF0093FF),
                                fontWeight: mediumFont,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 107.h,
                        ),
                        Consumer2<AuthProvider, StateAndCityProvider>(builder:
                            (ctx, authProvider, countryProvider, child) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (authProvider.resMessage != '') {
                              customSnackBar(context, authProvider.resMessage);

                              ///Clear the response message to avoid duplicate
                              authProvider.clear();
                            }
                          });
                          return MainButton(
                            authProvider.isLoading ? "Sending..." : sendMeCode,
                            () async {
                              if (authProvider
                                      .emailOrPhoneController.text.length <
                                  5) {
                                customSnackBar(context,
                                    " ${authProvider.isUseEmailForPasswordReset ? 'Please enter a valid email' : 'Please enter a valid phone number'}");
                              } else {
                                final isOtpSent =
                                    await authProvider.forgotPassword(
                                        email: authProvider
                                            .emailOrPhoneController.text);
                                if (mounted && isOtpSent) {
                                  navToWithScreenName(
                                      context: context,
                                      screen:
                                          const ConfirmEmailOrPhoneNumberScreen());
                                  // navTo(
                                  //     context: context,
                                  //     path: Routes
                                  //         .confirmEmailOrPhoneNumberScreen);
                                } else {
                                  //  Just for testing
                                  //   openConfirmEmailOrPhoneNumberScreen(context);
                                }
                              }
                            },
                            color: black,
                          );
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            navToWithScreenName(
                                context: context, screen: const LoginScreen());
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Regular12px(
                                text: rememberYourPassword,
                                textColor: black,
                              ),
                              SemiBold12px(
                                text: logInInstead,
                                fontWeight: boldFont,
                                textColor: Color(0xFF0093FF),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          })),
    );
  }
}
