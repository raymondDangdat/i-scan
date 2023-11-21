import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/go_router_route_names.dart';
import '../../../../Utils/shortcut_navigation.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../model/shortcut_model.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/bottom_nav_provider.dart';
import '../../../../providers/dash_board_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class ShortcutWrapperWidget extends StatelessWidget {
  const ShortcutWrapperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer3<AuthProvider, DashboardProvider, BottomNavProvider>(
        builder:
            (ctx, authProvider, dashboardProvider, bottomNavProvider, child) {
      return Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent:
                      MediaQuery.of(context).size.width > 480 ? 265 : 125,
                  childAspectRatio:
                      MediaQuery.of(context).size.width > 480 ? 5 / 6 : 4.5 / 4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              itemBuilder: (context, index) {
                final shortcut = shortcutsItems[index];
                return GestureDetector(
                    onTap: () async {
                      openRespectiveScreen(context, shortcut.title,
                          token: authProvider.hiveUserData?.token ?? "");
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: index == 2 ||
                                  index == 5 ||
                                  index == 8 ||
                                  index == 11
                              ? 0
                              : 7.w,
                          bottom: index == 9 || index == 10 || index == 11
                              ? 0
                              : 7.w),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(27, 31, 44, 1),
                          border: Border.all(
                              color: const Color.fromRGBO(0, 0, 0, 0.09),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        // padding: EdgeInsets.all(16.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(shortcut.newIcon),
                            SizedBox(
                              height: 10.h,
                            ),
                            SemiBold14px(
                              text: shortcut.title,
                              textColor:
                                  Colors.white.withOpacity(0.800000011920929),
                              fontSize: 10,
                              fontWeight: mediumFont,
                            ),
                          ],
                        ),
                      ),
                    ));
              },
              itemCount: shortcutsItems.length),
          SizedBox(
            height: 8.h,
          ),
          CustomContainerButton(
            onTap: () {
              context.go(adminDrsRoute);
              bottomNavProvider.updateSelectedIndex(1);
              dashboardProvider.startTimer();
            },
            title: "",
            bgColor: const Color.fromRGBO(27, 31, 44, 1),
            borderRadius: 18,
            verticalPadding: 16,
            horizontalPadding: 16,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(hashAIIcon),
                SizedBox(
                  width: 5.w,
                ),
                const BodyTextPrimaryTextColor(
                  text: hashAI,
                  fontSize: 10,
                  fontWeight: mediumFont,
                  textColor: white,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
