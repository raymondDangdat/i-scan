import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:i_scan/providers/ai_provider.dart';
import 'package:i_scan/providers/airtime_and_data_provider.dart';
import 'package:i_scan/providers/attendance_provider.dart';
import 'package:i_scan/providers/banks_provider.dart';
import 'package:i_scan/providers/cart_provider.dart';
import 'package:i_scan/providers/contact_provider.dart';
import 'package:i_scan/providers/giveaway_provider.dart';
import 'package:i_scan/providers/home_screen_provider.dart';
import 'package:i_scan/providers/interests_provider.dart';
import 'package:i_scan/providers/kyc_tier_info_provider.dart';
import 'package:i_scan/providers/my_product_provider.dart';
import 'package:i_scan/providers/orders_provider.dart';
import 'package:i_scan/providers/send_money_provider.dart';
import 'package:i_scan/resources/constants/color_constants.dart';
import 'package:provider/provider.dart';
import 'Utils/app_navigation.dart';
import 'firebase_options.dart';
import 'model/user_hive_model.dart';
import 'providers/add_product_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/bill_payment_provider.dart';
import 'providers/bottom_nav_provider.dart';
import 'providers/card_provider.dart';
import 'providers/favourite_provider.dart';
import 'providers/state_and_city_provider.dart';
import 'providers/customer_provider.dart';
import 'providers/dash_board_provider.dart';
import 'providers/help_and_support_provider.dart';
import 'providers/history_provider.dart';
import 'providers/success_provider.dart';
import 'providers/transactions_provider.dart';
import 'providers/withdrawal_provider.dart';
import 'resources/constants/string_constants.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "i-scan-45ea6",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: mainColor, // navigation bar color
    statusBarColor: mainColor, // status bar color
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(UserHiveModelAdapter());
  await Hive.openBox<UserHiveModel>(userBox);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => DashboardProvider()),
    ChangeNotifierProvider(create: (context) => CardProvider()),
    ChangeNotifierProvider(create: (context) => BottomNavProvider()),
    ChangeNotifierProvider(create: (context) => SuccessProvider()),
    ChangeNotifierProvider(create: (context) => HelpAndSupportProvider()),
    ChangeNotifierProvider(create: (context) => HistoryProvider()),
    ChangeNotifierProvider(create: (context) => CustomerProvider()),
    ChangeNotifierProvider(create: (context) => StateAndCityProvider()),
    ChangeNotifierProvider(create: (context) => WithdrawalProvider()),
    ChangeNotifierProvider(create: (context) => SendMoneyProvider()),
    ChangeNotifierProvider(create: (context) => AirtimeAndDataProvider()),
    ChangeNotifierProvider(create: (context) => BillPaymentProvider()),
    ChangeNotifierProvider(create: (context) => BanksProvider()),
    ChangeNotifierProvider(create: (context) => TransactionsProvider()),
    ChangeNotifierProvider(create: (context) => GiveawayProvider()),
    ChangeNotifierProvider(create: (context) => FavouriteProvider()),
    ChangeNotifierProvider(create: (context) => AddProductProvider()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context) => MyProductProvider()),
    ChangeNotifierProvider(create: (context) => OrdersProvider()),
    ChangeNotifierProvider(create: (context) => ContactProvider()),
    ChangeNotifierProvider(create: (context) => InterestsProvider()),
    ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
    ChangeNotifierProvider(create: (context) => KYCTierInfoProvider()),
    ChangeNotifierProvider(create: (context) => AiProvider()),
    ChangeNotifierProvider(create: (context) => AttendanceProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // final _navigatorKey = GlobalKey<NavigatorState>();

  // NavigatorState get _navigator => _navigatorKey.currentState!;

  bool isLoggedIn = false;
  bool hasPassCode = false;

  late AuthProvider auth;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) return;
    final isBackground = state == AppLifecycleState.paused;
    if (isBackground) {}
// ON RESUMED, CHECK THE PREVIOUS TIME USER HAVE SPENT ON THE APP
    if (state == AppLifecycleState.resumed) {
      await getSharePrefValues();
      debugPrint("====================App Resume===========");
      // if(isLoggedIn && hasPassCode){
      //   _navigator.pushNamedAndRemoveUntil(Routes.loginPasscodeScreen, (route) => false);
      // }
    }
  }

  @override
  void initState() {
    super.initState();
    // getSharePrefValues();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> getSharePrefValues() async {
    hasPassCode = auth.hiveUserData?.hasBiometric ?? false;
    isLoggedIn = auth.hiveUserData?.isLoggedIn ?? false;
    setState(() {
      debugPrint(
          "Has Passcode: $hasPassCode Is LoggedIn: $isLoggedIn auth value $hasPassCode");
    });
  }

  @override
  Widget build(BuildContext context) {
    auth = context.watch<AuthProvider>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) =>
          // builder: (_, child) =>
          MaterialApp.router(
        title: 'I-Scan',
        debugShowCheckedModeBanner: false,
        routerConfig: AppNavigation.router,
      ),
      // MaterialApp(
      //   navigatorKey: _navigatorKey,
      //   debugShowCheckedModeBanner: false,
      //   onGenerateRoute: RouteGenerator.getRoute,
      //   initialRoute: Routes.splashRoute,
      //   theme: getApplicationTheme(),
      //   home: const SplashScreen(),
      // )
    );
  }
}
