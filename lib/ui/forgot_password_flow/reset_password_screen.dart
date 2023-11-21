import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../Utils/go_router_route_names.dart';
import '../../Widgets/components.dart';
import '../../Widgets/custom_snack_back.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/textfields.dart';
import '../../providers/auth_provider.dart';
import '../../providers/state_and_city_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
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
                        text: resetPassword,
                        textColor: Color(0xFF282828),
                        fontWeight: boldFont,
                        fontSize: 16,
                      ),
                      SizedBox(
                        height: 21.h,
                        width: 21.w,
                        child: Image.asset(smileStar),
                      )
                    ],
                  ),
                ],
              )),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWithLineHeight(
                    text: pleaseProvideYourNewPassword,
                    textColor: Color.fromRGBO(0, 0, 0, 0.37),
                    fontWeight: mediumFont,
                    fontSize: 16,
                  ),
                ],
              ),
              SizedBox(
                height: 28.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PwdField(
                        hint: "New Passowrd",
                        controller: passwordController,
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
                      SizedBox(height: 21.h),
                      PwdField(
                        hint: "Confirm Password",
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
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Consumer2<AuthProvider, StateAndCityProvider>(
                          builder: (ctx, authProvider, countryProvider, child) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (authProvider.resMessage != '') {
                            customSnackBar(context, authProvider.resMessage);

                            ///Clear the response message to avoid duplicate
                            authProvider.clear();
                          }
                        });
                        return MainButton(
                          authProvider.isLoading
                              ? "Resetting..."
                              : resetPassword,
                          () async {
                            // openNavScreen(context);
                            if (passwordController.text.trim().length < 8) {
                              customSnackBar(
                                  context, "Please enter a valid password");
                            } else if (passwordController.text.trim() !=
                                confirmPasswordController.text.trim()) {
                              customSnackBar(context,
                                  "Password does not match confirm password");
                            } else {
                              if (authProvider.isLoading) {
                                //  Is loading already
                              } else {
                                final passwordReset =
                                    await authProvider.resetPassword(
                                  password: passwordController.text,
                                );
                                if (mounted && passwordReset) {
                                  context.goNamed(loginRouteName);
                                }
                              }
                            }
                          },
                          color: black,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
