import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/Widgets/custom_snack_back.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/auth_provider.dart';
import '../../providers/state_and_city_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/connectivity.dart';
import '../../resources/constants/constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/navigation_utils.dart';
import '../get_started_screen/get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthProvider auth;

  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateProvider =
          Provider.of<StateAndCityProvider>(context, listen: false);
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      auth.getShowBalance();
      //Get and update the share prefs values
      authProvider.updateFaceIDAuthorizeTransaction(null);
      authProvider.updateUseFaceID(null);
      stateProvider.getListOfStates();
    });
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    auth = context.watch<AuthProvider>();
    return Scaffold(
      backgroundColor: splashBgColor,
      body: SafeArea(
          bottom: false,
          top: false,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: splashBgColor),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 273.h,
                    width: 292.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(stetescopImg), fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  _goNext() async {
    debugPrint("CONNECTED TO THE INTERNET============= IN INIT STATE");
    final sharedPref = await SharedPreferences.getInstance();

    // Check for Internet Connection
    bool isConnected = await connectionChecker();
    if (isConnected) {
      debugPrint("CONNECTED TO THE INTERNET=============");
      if (mounted) {
        navToWithScreenName(context: context, screen: const GetStartedScreen());
      }
      //OPEN ONBOARDING SCREENS
      // if (sharedPref.getBool(showOnBoarding) == null ||
      //     sharedPref.getBool(showOnBoarding) == true) {
      //   if (mounted) {
      //     navToWithScreenName(
      //         context: context, screen: const GetStartedScreen());
      //
      //   }
      // } else {
      //   if (mounted) {
      //     bool hasUserData = await auth.updateUserData(context);
      //     if (mounted && hasUserData) {
      //       bool isLoggedIn = auth.hiveUserData?.isLoggedIn ?? false;
      //       bool hasPassCode = auth.hiveUserData?.hasBiometric ?? false;
      //       debugPrint("Is LoggedIn: $isLoggedIn Has Passcode: $hasPassCode");
      //       //ENSURE ALL THAT IS REQUIRED FOR BIOMETRIC AND PASSCODE LOGIN ARE AVAILABLE BEFORE ROUTING TO THE SCREEN
      //       if (hasPassCode &&
      //           savedEmail.isNotEmpty &&
      //           savedPassword.isNotEmpty &&
      //           savedSharedPrefUserID.isNotEmpty) {
      //         context.push(context.namedLocation(loginPasscodeName));
      //         // navToWithScreenName(context: context, screen: const LoginPassCodeScreen(), isPushAndRemoveUntil: true);
      //         // navTo(
      //         //     context: context,
      //         //     path: Routes.loginPasscodeScreen,
      //         //     isPushAndRemoveUntil: true);
      //         // openLoginPasscodeScreen(context);
      //       } else {
      //         navToWithScreenName(
      //             context: context, screen: const LoginScreen());
      //         // navTo(context: context, path: Routes.loginScreen);
      //       }
      //     } else {
      //       navToWithScreenName(context: context, screen: const LoginScreen());
      //       // navTo(context: context, path: Routes.loginScreen);
      //     }
      //   }
      // }
    } else {
      // User Not connected to the Internet
      debugPrint("NOT CONNECTED TO THE INTERNET=============");
      if (mounted) {
        customSnackBar(
            context, "Please connect to a stable Internet Connection");
        navToWithScreenName(context: context, screen: const GetStartedScreen());
      }
    }
  }
}
