import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/shortcut_navigation.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../model/shortcut_model.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/dash_board_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';

class DashboardShortcutWidget extends StatelessWidget {
  const DashboardShortcutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, DashboardProvider>(
        builder: (ctx, authProvider, dashboardProvider, child) {
      return SizedBox(
        height: 56.h,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: shortcutsItems.length,
            itemBuilder: (context, index) {
              final shortcut = shortcutsItems[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16.w : 0,
                  right: index < shortcutsItems.length - 1 ? 7 : 0,
                ),
                child: CustomContainerButton(
                  horizontalPadding: 16,
                  verticalPadding: 16,
                  borderRadius: 18,
                  borderColor: inputBorderColor,
                  bgColor: appBgColor2,
                  onTap: () {
                    openRespectiveScreen(context, shortcut.title,
                        token: authProvider.hiveUserData?.token ?? "");
                  },
                  widget: Row(
                    children: [
                      SvgPicture.asset(shortcut.smallIcon),
                      SizedBox(
                        width: 8.w,
                      ),
                      BodyTextPrimaryWithLineHeight(
                        text: shortcut.title,
                        textColor: const Color(0xFF181C26),
                        fontWeight: mediumFont,
                        fontSize: 10,
                      )
                    ],
                  ),
                  title: '',
                ),
              );
            }),
      );
    });
  }
}
