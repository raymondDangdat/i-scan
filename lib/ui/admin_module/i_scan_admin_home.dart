import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_scan/Widgets/custom_text.dart';
import 'package:i_scan/providers/bottom_nav_provider.dart';
import 'package:provider/provider.dart';
import '../../resources/constants/color_constants.dart';
import 'components/i_scan_admin_dashboard.dart';
import 'components/i_scan_admin_attendance.dart';
import 'components/admin_setting_screen.dart';
import 'components/i_scan_admin_doctors.dart';

class IScanAdminDashboardView extends StatefulWidget {
  const IScanAdminDashboardView({Key? key}) : super(key: key);

  @override
  State<IScanAdminDashboardView> createState() =>
      _IScanAdminDashboardViewState();
}

class _IScanAdminDashboardViewState extends State<IScanAdminDashboardView> {


  PageController controller = PageController(viewportFraction: 0.95);

  late BottomNavProvider dashboardProvider;

  @override
  void dispose() {
    super.dispose();
    dashboardProvider.updateAdminSelectedIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    dashboardProvider = context.watch<BottomNavProvider>();
    return Scaffold(
      backgroundColor: appBgColor2,
      body: SafeArea(
          bottom: false,
          // top: false,
          child: Consumer<BottomNavProvider>(
              builder: (ctx, bottomNavProvider, child) {
            return Column(
              children: [
                if (bottomNavProvider.adminSelectedIndex == 0)
                  const Expanded(child: IScanAdminDashboard()),
                if (bottomNavProvider.adminSelectedIndex == 1)
                  const Expanded(child: IScanAdminAttendance()),
                if (bottomNavProvider.adminSelectedIndex == 2)
                  const Expanded(child: IScanAdminDoctors()),
                if (bottomNavProvider.adminSelectedIndex == 3)
                  const Expanded(child: IScanAdminSettings()),
                Consumer<BottomNavProvider>(
                    builder: (ctx, dashboardProvider, child) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(101, 123, 154, 0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(1, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        bottom: Platform.isAndroid ? 6.h : 18.h,
                        left: 30.w,
                        top: 10.h,
                        right: 30.w),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BottomBarItem(
                          icon: dashboardProvider.adminSelectedIndex == 0
                              ? ""
                              : "",
                          title: "Home",
                          textColor: dashboardProvider.adminSelectedIndex == 0
                              ? mainColor
                              : const Color.fromRGBO(193, 202, 215, 1),
                          onTap: () {
                            dashboardProvider.updateAdminSelectedIndex(0);
                          },
                        ),
                        BottomBarItem(
                          icon: dashboardProvider.adminSelectedIndex == 1
                              ? ""
                              : "",
                          title: "Attendance",
                          textColor: dashboardProvider.adminSelectedIndex == 1
                              ? mainColor
                              : const Color.fromRGBO(193, 202, 215, 1),
                          onTap: () {
                            dashboardProvider.updateAdminSelectedIndex(1);
                          },
                        ),
                        BottomBarItem(
                          icon: dashboardProvider.adminSelectedIndex == 2
                              ? ""
                              : "",
                          title: "Doctors",
                          textColor: dashboardProvider.adminSelectedIndex == 2
                              ? mainColor
                              : const Color.fromRGBO(193, 202, 215, 1),
                          onTap: () {
                            dashboardProvider.updateAdminSelectedIndex(2);
                          },
                        ),
                        BottomBarItem(
                          icon: dashboardProvider.adminSelectedIndex == 3
                              ? ""
                              : "",
                          title: "Settings",
                          textColor: dashboardProvider.adminSelectedIndex == 3
                              ? mainColor
                              : const Color.fromRGBO(193, 202, 215, 1),
                          onTap: () {
                            dashboardProvider.updateAdminSelectedIndex(3);
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ],
            );
          })),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color textColor;
  const BottomBarItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onTap,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
            width: 20.h,
            child: SvgPicture.asset(icon),
          ),
          SizedBox(
            height: 5.h,
          ),
          BodyTextPrimaryWithLineHeight(
            text: title,
            textColor: textColor,
          )
        ],
      ),
    );
  }
}
