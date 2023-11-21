import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../Utils/go_router_route_names.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';
import '../custom_text.dart';
import '../long_divider.dart';
import '../pull_down_indicator.dart';

Future showQuickActionsModal(
  BuildContext context, {
  bool isWallet = true,
}) {
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      return Container(
        constraints: BoxConstraints(minHeight: 400.h, maxHeight: 627.h),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 14.h),
              const PullDownIndicator(),
              SizedBox(
                height: 19.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SemiBold16px(
                    text: chooseAnOption,
                    fontSize: 15,
                    fontWeight: boldFont,
                    textColor: Color(0xFF1A202C),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: const LongDivider(),
              ),
              SizedBox(
                height: 29.h,
              ),
              ItemWidget(
                  onTap: () {
                    context.goNamed(sendMoneyRouteName);
                    Navigator.pop(context);
                  },
                  icon: bankTransferIcon,
                  title: "Bank Transfer",
                  subTitle: "Make a transfer to any bank account"),
              SizedBox(
                height: 25.h,
              ),
              ItemWidget(
                  onTap: () {
                    context.goNamed(mobileTopUpRouteName);
                    Navigator.pop(context);
                  },
                  icon: buyAirtimeQIcon,
                  title: "Buy Airtime",
                  subTitle: "Recharge your phones easily"),
              SizedBox(
                height: 25.h,
              ),
              ItemWidget(
                  onTap: () {
                    context.goNamed(mobileTopUpRouteName);
                    Navigator.pop(context);
                  },
                  icon: buyDataQuickActionIcon,
                  title: "Buy Data",
                  subTitle: "Recharge your phones easily"),
              SizedBox(
                height: 25.h,
              ),
              ItemWidget(
                  icon: earnQIcon,
                  onTap: () {
                    context.goNamed(earningDashboardRouteName);
                    Navigator.pop(context);
                  },
                  title: "Earn",
                  subTitle: "Perform tasks and earn"),
            ],
          ),
        ),
      );
    }),
  );
}

class ItemWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  const ItemWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onTap,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(
              width: 14.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SemiBold16px(
                  text: title,
                  fontSize: 15,
                  fontWeight: boldFont,
                  textColor: const Color(0xFF1A202C),
                ),
                SemiBold16px(
                  text: subTitle,
                  fontSize: 10,
                  fontWeight: mediumFont,
                  textColor: const Color(0xFF718096),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
