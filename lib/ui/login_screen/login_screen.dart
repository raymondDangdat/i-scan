import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:i_scan/Utils/functions.dart';
import 'package:i_scan/Widgets/i_scan_logo_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/go_router_route_names.dart';
import '../../Widgets/components.dart';
import '../../Widgets/custom_snack_back.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/textfields.dart';
import '../../providers/auth_provider.dart';
import '../../providers/bottom_nav_provider.dart';
import '../../providers/state_and_city_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/constants.dart';
import '../../resources/constants/dimension_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/string_constants.dart';
import '../../resources/navigation_utils.dart';
import '../admin_module/i_scan_admin_home.dart';
import '../get_started_screen/get_started_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscure = true;

  @override
  void initState() {
    emailController.text = "admin@iscan.io";
    passwordController.text = "Password";
    emailController.text = "emawac@mailto.plus";
    passwordController.text = "Smart001@";

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final auth = Provider.of<AuthProvider>(context, listen: false);
      //  Get the device ID information
      auth.getDeviceInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: topPadding.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: InkWell(
                        onTap: () {
                          navToWithScreenName(
                              context: context,
                              screen: const GetStartedScreen());
                          // navTo(
                          //     context: context, path: Routes.getStartedScreen);
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                  ),
                ],
              ),
              SizedBox(
                height: 31.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const IScanLogoWidget(),
                      SizedBox(
                        height: 28.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWithLineHeight(
                            text: nowLogin,
                            textColor: Color(0xFF282828),
                            fontWeight: boldFont,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWithLineHeight(
                            text: providerYourEmail,
                            textColor: Color.fromRGBO(0, 0, 0, 0.37),
                            fontWeight: mediumFont,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomField(
                              email,
                              emailController,
                              isCapitalizeSentence: false,
                              type: TextInputType.emailAddress,
                              prefixIcon: const Icon(
                                Iconsax.sms,
                                color: prefixIconColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 21.h),
                      PwdField(
                        hint: password,
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
                      SizedBox(
                        height: 15.h,
                      ),
                      InkWell(
                        onTap: () {
                          // navToWithScreenName(
                          //     context: context,
                          //     screen: const ForgotPasswordScreen());
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomTextWithLineHeight(
                              text: forgotPassword,
                              textColor: black,
                              fontWeight: mediumFont,
                              fontSize: 12,
                            ),
                          ],
                        ),
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Consumer3<AuthProvider, StateAndCityProvider,
                            BottomNavProvider>(
                        builder: (ctx, authProvider, countryProvider,
                            bottomNavScreen, child) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (authProvider.resMessage != '') {
                          customSnackBar(context, authProvider.resMessage);

                          ///Clear the response message to avoid duplicate
                          authProvider.clear();
                        }
                      });
                      return MainButton(
                        logIn,
                        () async {
                          final sharedPrefs =
                              await SharedPreferences.getInstance();
                          //Pop out the loading indicator

                          if (mounted && emailController.text.length < 5) {
                            customSnackBar(
                                context, "Please enter a valid email");
                          } else if (context.mounted &&
                              passwordController.text.trim().length < 8) {
                            customSnackBar(context,
                                "Password must be at least 8 characters");
                          } else {
                            if (context.mounted) {
                              final isLoggedIn = await authProvider
                                  .signInUserWithEmailAndPassword(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text);

                              if (mounted) {
                                popLoader(context: context);
                              }

                              if (mounted && isLoggedIn) {
                                sharedPrefs.setBool(showOnBoarding, false);
                                if (authProvider.isDoctor) {

                                  context.go(iScanDrDashboardRoute);
                                } else {
                                  navToWithScreenName(
                                      context: context,
                                      screen: const IScanAdminDashboardView());
                                }
                              }
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
                            context: context, screen: const SignUpScreen());
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Regular12px(
                            text: dontHaveAnAccount,
                            textColor: black,
                          ),
                          SemiBold12px(
                            text: signUpInstead,
                            fontWeight: boldFont,
                            textColor: Color(0xFF0093FF),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: bottomPadding.h,
              )
            ],
          )),
    );
  }
}
