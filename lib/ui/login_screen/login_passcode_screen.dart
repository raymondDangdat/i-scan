import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/functions.dart';
import '../../Widgets/custom_keyboard/custom_keyboard.dart';
import '../../Widgets/custom_snack_back.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/pin_filled.dart';
import '../../providers/auth_provider.dart';
import '../../providers/bottom_nav_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';
import '../../resources/navigation_utils.dart';
import '../../services/local_auth.dart';
import 'login_screen.dart';

class LoginPassCodeScreen extends StatefulWidget {
  const LoginPassCodeScreen({Key? key}) : super(key: key);

  @override
  State<LoginPassCodeScreen> createState() => _LoginPassCodeScreenState();
}

class _LoginPassCodeScreenState extends State<LoginPassCodeScreen> {
  late AuthProvider auth;

  bool hasError = false;
  String currentText = "";
  List<String> pin = [];

  bool wrongPin = false;

  int biometricLoginAttempts = 1;

  @override
  Widget build(BuildContext context) {
    auth = context.watch<AuthProvider>();
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(child: SingleChildScrollView(
        child: Consumer2<AuthProvider, BottomNavProvider>(
            builder: (ctx, authProvider, bottomNavProvider, child) {
          return Column(
            children: [
              const SizedBox(
                height: 83,
              ),
              Container(
                height: 68.h,
                width: 68.h,
                decoration: BoxDecoration(
                    color: cardColor,
                    image: DecorationImage(
                        image: NetworkImage(
                            authProvider.userProfile?.data.avatar ?? ""),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(100.r)),
              ),
              SizedBox(
                height: 13.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 17.w,
                  ),
                  const SemiBold20px(
                    text: welcome,
                    textColor: black,
                    fontWeight: mediumFont,
                    fontSize: 22,
                  ),
                  SemiBold20px(
                    text: authProvider.hiveUserData?.userName == null ||
                            authProvider.hiveUserData!.userName
                                .toString()
                                .isEmpty
                        ? "#NewUser"
                        : "#${authProvider.hiveUserData!.userName!}",
                    textColor: mainColor,
                    fontWeight: boldFont,
                    fontSize: 22,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SizedBox(
                      width: 25, height: 25, child: Image.asset(welcomeEmoji))
                ],
              ),
              SizedBox(
                height: 23.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(greenPadlock),
                  SizedBox(
                    width: 3.w,
                  ),
                  const CustomTextWithLineHeight(
                      text: passcode,
                      fontSize: 14,
                      alignCenter: true,
                      textColor: black,
                      lineHeight: 1.5,
                      fontWeight: mediumFont),
                ],
              ),
              SizedBox(
                height: 29.h,
              ),
              Consumer2<AuthProvider, BottomNavProvider>(
                  builder: (ctx, auth, bottomNavProvider, child) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (auth.resMessage != '') {
                    customSnackBar(context, auth.resMessage);

                    ///Clear the response message to avoid duplicate
                    auth.clear();
                    pin = [];
                  }
                });
                return auth.isLoading
                    ? const Center(
                        child: CupertinoActivityIndicator(
                            // color: white,
                            ))
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            pin.isNotEmpty
                                ? const PinFilled()
                                : const PinUnfilled(),
                            pin.length >= 2
                                ? const PinFilled()
                                : const PinUnfilled(),
                            pin.length >= 3
                                ? const PinFilled()
                                : const PinUnfilled(),
                            pin.length >= 4
                                ? const PinFilled()
                                : const PinUnfilled(),
                            pin.length >= 5
                                ? const PinFilled()
                                : const PinUnfilled(),
                            pin.length >= 6
                                ? const PinFilled()
                                : const PinUnfilled(),
                          ],
                        ),
                      );
              }),
              SizedBox(height: 46.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 46.w),
                child: CustomKeyboard(
                  isPlainText: true,
                  showBiometricKey: true,
                  onTextInput: (myText) {
                    _insertPin(myText);
                    // _insertText(myText);
                  },
                  onBackspace: () {
                    _removePin();
                    // _backspace();
                  },
                  onBiometricClicked: () async {
                    final sharedPref = await SharedPreferences.getInstance();
                    String savedEmail =
                        sharedPref.getString(savedSharedPrefEmail) ?? "";
                    String savedPassword =
                        sharedPref.getString(savedSharedPrefPassword) ?? "";
                    final authenticate = await LocalAuth.authentucate();
                    if (mounted && authenticate) {
                      debugPrint("Authenticated using Local Auth");
                      bool isLoggedIn = await auth.loginUser(
                          context: context,
                          email: savedEmail,
                          password: savedPassword);

                      if (context.mounted) {
                        debugPrint("Should pop");
                        popLoader(context: context, isGoRouterScreen: false);
                      }

                      if (mounted && isLoggedIn) {
                        debugPrint("IS LOgGED IN WITH BIOMETRIC $isLoggedIn");

                        sendUserToHomeScreen();
                      } else {
                        Navigator.pop(context);
                        // navTo(context: context, path: Routes.loginScreen);
                        navToWithScreenName(
                            context: context, screen: const LoginScreen());
                      }
                    } else {
                      //CHECK OF THE ATTEMPT FAILED TWICE, TAKE THEM TO LOGIN WITH EMAIL AND PASSWORD
                      if (mounted && biometricLoginAttempts == 2) {
                        Navigator.pop(context);
                        navToWithScreenName(
                            context: context, screen: const LoginScreen());
                        // navTo(context: context, path: Routes.loginScreen);
                      } else {
                        biometricLoginAttempts++;
                      }
                      setState(() {});

                      debugPrint("Email: $savedEmail Passcode: $savedPassword");
                    }
                  },
                ),
              ),
              const SizedBox(height: 12),
              const SizedBox(
                height: 16,
              )
            ],
          );
        }),
      )),
    );
  }

  void _insertPin(String myText) async {
    if (pin.length < 6) {
      pin.add(myText);
      if (pin.length == 6) {
        final sharedPref = await SharedPreferences.getInstance();
        String savedUserID = sharedPref.getString(savedSharedPrefUserID) ?? "";
        final pinAsString = pin.join("");
        auth.updatePasscode(pinAsString);
        bool isLoggedIn = await auth.loginUser(
            context: context,
            email: savedUserID,
            password: pinAsString,
            isPasscode: true);
        if (context.mounted) {
          popLoader(context: context);
        }
        if (mounted && isLoggedIn) {
          sendUserToHomeScreen();
        } else {
          //IF ATTEMPTS FAILED TWICE, TAKE USER TO LOGIN WITH EMAIL AND PASSWORD
          if (context.mounted && biometricLoginAttempts == 2) {
            Navigator.pop(context);
            navToWithScreenName(context: context, screen: const LoginScreen());
          } else {
            biometricLoginAttempts++;
          }
        }
      }
      setState(() {});
    }
  }

  void _removePin() {
    if (pin.isNotEmpty) {
      pin.removeLast();
      setState(() {});
    }
  }

  void sendUserToHomeScreen() async {
    context.go("/home");
  }
}
