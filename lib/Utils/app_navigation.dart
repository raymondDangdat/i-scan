import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_scan/ui/bottom_nav_screen/home/dashboard_screen.dart';
import '../ui/admin_module/i_scan_admin_home.dart';
import '../ui/bottom_nav_screen/bottom_nav_screen.dart';
import '../ui/bottom_nav_screen/card/dr_attendance_screen.dart';
import '../ui/bottom_nav_screen/home/widgets/scan_qr_to_checkin_screen.dart';
import '../ui/bottom_nav_screen/more/more_screen.dart';
import '../ui/login_screen/login_screen.dart';
import '../ui/notice_before_open_account_screen/notice_before_open_account_screen.dart';

import '../ui/splash_screen/splash_screen.dart';
import 'go_router_route_names.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/splash";
  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorAdminHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellAdminHome');
  static final _shellNavigatorAdminAttendance =
      GlobalKey<NavigatorState>(debugLabel: 'shellAdminAttendance');
  static final _shellNavigatorAdminDoctors =
      GlobalKey<NavigatorState>(debugLabel: 'shellAdminDoctors');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Admin Branch Dashboard
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAdminHome,
            routes: <RouteBase>[
              GoRoute(
                path: iScanDrDashboardRoute,
                name: iScanDrDashboardRoute,
                builder: (BuildContext context, GoRouterState state) =>
                    const DashboardScreen(),
                routes: [
                  GoRoute(
                      path: scanQRCodeScannerRouteName,
                      name: scanQRCodeScannerRouteName,
                      pageBuilder: (context, state) =>
                          buildPageWithoutAnimation(
                              context: context,
                              state: state,
                              child: const ScanToCheckInScreen())),
                ],
              ),
            ],
          ),

          ///Branch Admin Attendance
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAdminAttendance,
            routes: <RouteBase>[
              GoRoute(
                path: adminAttendanceRoute,
                name: adminAttendanceRoute,
                builder: (BuildContext context, GoRouterState state) =>
                    const DrAttendanceScreen(),
                routes: [],
              ),
            ],
          ),

          /// Branch Admin Doctors
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAdminDoctors,
            routes: <RouteBase>[
              GoRoute(
                path: adminDrsRoute,
                name: adminDrsRoute,
                builder: (BuildContext context, GoRouterState state) =>
                    const DrSettingScreen(),
                routes: [],
              ),
            ],
          ),
        ],
      ),

      /// Login Screen
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/loginScreen',
        name: loginRouteName,
        builder: (context, state) => LoginScreen(
          key: state.pageKey,
        ),
      ),

      /// Admin Home
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/icanAdmonadminHomeRoute',
        name: adminHomeRouteName,
        builder: (context, state) => IScanAdminDashboardView(
          key: state.pageKey,
        ),
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/splash',
        name: "Splash",
        builder: (context, state) => SplashScreen(
          key: state.pageKey,
        ),
      ),

      GoRoute(
          path: "/noticeBeforeRouteName",
          name: noticeBeforeLoginRouteName,
          pageBuilder: (context, state) => buildPageWithoutAnimation(
              context: context,
              state: state,
              child: const NoticeBeforeOpenAccountScreen())),
    ],
  );
}

CustomTransitionPage<double> buildPageWithoutAnimation({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<double>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          child);
}
