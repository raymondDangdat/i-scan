import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../Utils/shortcut_navigation.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../model/shortcut_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class MoreDashboardItemsScreen extends StatefulWidget {
  const MoreDashboardItemsScreen({Key? key}) : super(key: key);

  @override
  State<MoreDashboardItemsScreen> createState() =>
      _MoreDashboardItemsScreenState();
}

class _MoreDashboardItemsScreenState extends State<MoreDashboardItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      body: SafeArea(
          bottom: false,
          child: Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopPadding(),
                const IScanAppBar(title: ""),
                SizedBox(
                  height: 28.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                      child: const HeaderText(
                        text: bills,
                        textColor: black,
                        fontSize: 18,
                        fontWeight: boldFont,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: shortcutsItems.length,
                        itemBuilder: (context, index) {
                          final shortcut = shortcutsItems[index];
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: index == shortcutsItems.length - 1
                                    ? 50
                                    : 8.h,
                                left: horizontalPadding.w,
                                right: horizontalPadding.w),
                            child: SecurityItem(
                                leadingIconName: shortcut.smallIcon,
                                title: shortcut.title,
                                onTap: () {
                                  openRespectiveScreen(context, shortcut.title,
                                      token: authProvider.hiveUserData?.token ??
                                          "");
                                }),
                          );
                        })),
              ],
            );
          })),
    );
  }
}

class SecurityItem extends StatelessWidget {
  final String leadingIconName;
  final String title;
  final String trailingIcon;
  final VoidCallback onTap;
  const SecurityItem(
      {Key? key,
      required this.leadingIconName,
      required this.title,
      this.trailingIcon = forwardIcon,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding:
              EdgeInsets.only(top: 11.h, left: 11.w, bottom: 11.h, right: 19.w),
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(18.r)),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(11.r),
                decoration: const ShapeDecoration(
                  // color: Color(0x118B83BC),
                  shape: OvalBorder(),
                ),
                child: SvgPicture.asset(leadingIconName),
              ),
              SizedBox(
                width: 11.w,
              ),
              Expanded(
                child: BodyTextPrimaryWithLineHeight(
                  text: title,
                  textColor: black,
                  fontSize: 14,
                  fontWeight: boldFont,
                ),
              ),
              SvgPicture.asset(trailingIcon)
            ],
          )),
    );
  }
}
