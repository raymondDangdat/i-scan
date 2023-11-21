import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../Widgets/arrow_back_icon.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_card.dart';
import '../../../Widgets/custom_text.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopPadding(),
          const ArrowBackWidget(),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const CustomTextWithLineHeight(
                  text: notificationSettings,
                  fontWeight: boldFont,
                  fontSize: 20,
                  textColor: Color.fromRGBO(65, 65, 65, 1),
                ),
                SizedBox(
                  height: 27.h,
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 14.h,
                      ),
                      CustomListTile(
                        title: loginNotification,
                        subTitle: "",
                        onTap: () {},
                        bgColor: white,
                        trailingIcon: Iconsax.arrow_circle_down,
                        arrowColor: const Color.fromRGBO(67, 57, 201, 0.1),
                        leadingIcon: loginNotificationIcon,
                        svgIcon: toggleIcon,
                        iconSize: 30,
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      CustomListTile(
                        title: newsLetterNotification,
                        subTitle: "",
                        onTap: () {},
                        bgColor: white,
                        trailingIcon: Iconsax.arrow_circle_down,
                        arrowColor: const Color.fromRGBO(67, 57, 201, 0.1),
                        leadingIcon: newsLetterIcon,
                        svgIcon: toggleIcon,
                        iconSize: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ],
      )),
    );
  }
}
