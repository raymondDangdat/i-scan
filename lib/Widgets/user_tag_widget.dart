import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:i_scan/Widgets/title_widget.dart';
import 'package:provider/provider.dart';

import '../Utils/go_router_route_names.dart';
import '../providers/auth_provider.dart';
import '../providers/bottom_nav_provider.dart';
import '../resources/constants/color_constants.dart';
import 'components.dart';

class UserTagWidget extends StatelessWidget {
  const UserTagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, BottomNavProvider>(
        builder: (ctx, authProvider, bottomNavProvider, child) {
      return CustomContainerButton(
        onTap: () {
          context.go(drAttendanceRoute);
          bottomNavProvider.updateSelectedIndex(5);
        },
        title: "",
        bgColor: black,
        horizontalPadding: 9,
        verticalPadding: 9,
        borderRadius: 17,
        widget: Row(
          children: [
            Container(
              height: 30.h,
              width: 30.h,
              padding: EdgeInsets.all(1.r),
              decoration: BoxDecoration(
                  color: cardColor,
                  image: DecorationImage(
                      image: NetworkImage(authProvider.userProfile == null ||
                              authProvider.userProfile!.data.avatar == null ||
                              authProvider.userProfile!.data.avatar
                                  .toString()
                                  .isEmpty
                          ? ""
                          : authProvider.userProfile!.data.avatar),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100.r)),
            ),
            SizedBox(
              width: 6.w,
            ),
            TitleWidget(
              title:
                  "Hi, ${authProvider.firebaseUserProfile == null ? 'Guest' : 'Dr. ${authProvider.firebaseUserProfile?.firstName} ${authProvider.firebaseUserProfile?.lastName}'}",
              fontSize: 14,
              textColor: const Color(0xFFDFDFDF),
            ),
          ],
        ),
      );
    });
  }
}
