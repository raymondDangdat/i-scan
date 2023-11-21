import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/user_tag_widget.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/dash_board_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor2,
      body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopPadding(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const UserTagWidget(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(notificationIconSvg),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        // InkWell(
                        //     onTap: () {
                        //       context.goNamed(scanQRCodeScannerRouteName);
                        //     },
                        //     child: SvgPicture.asset(scanIconSvg)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(child: Consumer2<AuthProvider, DashboardProvider>(
                  builder: (ctx, authProvider, dashboardProvider, child) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 23.h,),

                          SizedBox(
                            height: 14.h,
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                );
              }))
            ],
          )),
    );
  }
}

class QuickActionItem extends StatelessWidget {
  final VoidCallback onTap;
  final String iconName;
  final String title;
  const QuickActionItem(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(iconName),
          SizedBox(
            width: 8.w,
          ),
          BodyTextLightWithLineHeight(
            text: title,
            fontSize: 12,
            fontWeight: mediumFont,
            textColor: const Color.fromRGBO(182, 187, 201, 1),
          ),
        ],
      ),
    );
  }
}
