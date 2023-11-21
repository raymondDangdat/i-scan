import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../Widgets/custom_snack_back.dart';
import '../providers/airtime_and_data_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/dash_board_provider.dart';
import '../providers/favourite_provider.dart';
import '../resources/constants/connectivity.dart';
import '../resources/constants/string_constants.dart';
import '../resources/navigation_utils.dart';
import 'go_router_route_names.dart';

openRespectiveScreen(BuildContext context, String shortcutName,
    {required String token}) async {
  bool isConnected = await connectionChecker();
  bool screenOpened = false;
  if (context.mounted && isConnected) {
    if (context.mounted && shortcutName == sendMoney) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final beneficiaryProvider =
          Provider.of<FavouriteProvider>(context, listen: false);
      if (authProvider.userProfile == null ||
          authProvider.userProfile!.data.accounts.isEmpty) {
        authProvider.getProfile();
        customSnackBar(context, "You account is not yet setup");
      } else {
        beneficiaryProvider.getBeneficiaries(
            customerId: authProvider.hiveUserData?.userId ?? "");
        context.goNamed(sendMoneyRouteName);
        screenOpened = true;
      }
    } else if (shortcutName == buyAirtime) {
      final airtimeAndDataProvider =
          Provider.of<AirtimeAndDataProvider>(context, listen: false);
      airtimeAndDataProvider.updateIsBuyAirtime(true);
      airtimeAndDataProvider.updateSelectedTopUpOption(airtime);
      context.goNamed(mobileTopUpRouteName);
      screenOpened = true;
    } else if (shortcutName == buyData) {
      final airtimeAndDataProvider =
          Provider.of<AirtimeAndDataProvider>(context, listen: false);
      airtimeAndDataProvider.updateIsBuyAirtime(false);
      airtimeAndDataProvider.updateSelectedTopUpOption(dataBundle);
      context.goNamed(mobileTopUpRouteName);
      screenOpened = true;
    } else if (shortcutName == utilities) {
      screenOpened = true;
      context.goNamed(payABillRouteName);
    } else if (shortcutName == earn) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      if (authProvider.userProfile != null &&
          authProvider.userProfile?.data.customerType.toString() ==
              customerUserType) {
      } else {
        context.goNamed(earningDashboardRouteName);
        screenOpened = true;
      }
    } else if (shortcutName == save) {
      context.goNamed(savingsMainScreenRouteName);
      screenOpened = true;
    } else if (shortcutName == giveaway) {
      screenOpened = true;
    } else if (shortcutName == advert) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      if (authProvider.userProfile != null &&
          authProvider.userProfile?.data.customerType.toString() ==
              customerUserType) {
      } else {}
    } else if (shortcutName == market) {
      final cartProvider = Provider.of<CartProvider>(context, listen: false);
    }

    if (screenOpened) {
      final dashboardProvider =
          Provider.of<DashboardProvider>(context, listen: false);

      if (dashboardProvider.wrappedApps) {
        dashboardProvider.startTimer();
      }
    }
  } else {
    if (context.mounted) {
      customSnackBar(context, "No Internet Connection");
    }
  }
}
