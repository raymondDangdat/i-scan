import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:i_scan/providers/attendance_provider.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/bottom_nav_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    super.key,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  late AuthProvider authProvider;
  late BottomNavProvider bottomNavProvider;
  late AttendanceProvider attendanceProvider;

  void _goDoctorBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );

    if(index == 0){
      attendanceProvider.getTodayAttendanceStatus(authProvider.firebaseUserProfile?.userId ?? "");
    }
    bottomNavProvider.updateSelectedIndex(index);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bottomNavProvider = context.watch<BottomNavProvider>();
    authProvider = context.watch<AuthProvider>();
    attendanceProvider = context.watch<AttendanceProvider>();
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: Consumer2<BottomNavProvider, AuthProvider>(
          builder: (ctx, bottomProvider, authProvider, child) {
        return BottomNavigationBar(
          backgroundColor: white,
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
              fontWeight: boldFont,
              height: 1.5,
              fontSize: 10,
              color: Color(0xFF1A1A1A)),
          unselectedLabelStyle: const TextStyle(
            fontWeight: mediumFont,
            height: 1.5,
            fontSize: 10,
            color: Color(0xFF1A1A1A),
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SvgPicture.asset(homeInactiveIcon),
              ),
              label: "Home",
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SvgPicture.asset(activeHomeIcon),
              ),
              backgroundColor: white,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SvgPicture.asset(marketplaceInActiveIcon),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SvgPicture.asset(marketplaceActiveIcon),
              ),
              label: "Attendance",
              backgroundColor: white,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SvgPicture.asset(moreInActiveIcon),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SvgPicture.asset(moreActiveIcon),
              ),
              label: "Settings",
              backgroundColor: white,
            ),
          ],
          currentIndex: bottomProvider.selectedIndex,
          selectedItemColor: const Color(0xFF1A1A1A),
          unselectedItemColor: const Color(0xFF1A1A1A),
          onTap: (index) {
            _goDoctorBranch(index);
          },
        );
      }),
    );
  }
}
