import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../Utils/go_router_route_names.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_card.dart';
import '../../../Widgets/custom_text.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';
import '../home/widgets/account_details_modal.dart';
import '../more/change_pin_screen.dart';
import 'account_details.dart';
import 'card_order_tracking.dart';
import 'notification_settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const CustomTextWithLineHeight(
                  text: profile,
                  fontWeight: boldFont,
                  fontSize: 20,
                  textColor: Color.fromRGBO(65, 65, 65, 1),
                ),
                SizedBox(
                  height: 46.h,
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
                      Row(
                        children: [
                          Container(
                            height: 58.h,
                            width: 60.h,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(12.r)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 9.h),
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(dummyProfile),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                navToWithScreenName(
                                    context: context,
                                    screen: const AccountDetailsScreen());
                                // navTo(
                                //     context: context,
                                //     path: Routes.profileDetailScreen);
                              },
                              child: Container(
                                height: 58.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(12.r)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 9.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const CustomTextWithLineHeight(
                                              text: "Nelson Mojolaoluwa",
                                              fontWeight: boldFont,
                                              fontSize: 14,
                                              textColor: black,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            SvgPicture.asset(verifiedIcon),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        const CustomTextWithLineHeight(
                                          text: "adeyemosteve@gmail.comsz  ",
                                          fontWeight: mediumFont,
                                          fontSize: 10,
                                          textColor:
                                              Color.fromRGBO(52, 52, 52, 1),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(arrowForward)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      InkWell(
                        onTap: () {
                          showAccountDetailsModal(context);
                        },
                        child: Container(
                          height: 58.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(12.r)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 9.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      CustomTextWithLineHeight(
                                        text: seeAccountDetails,
                                        fontWeight: boldFont,
                                        fontSize: 14,
                                        textColor: black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  const CustomTextWithLineHeight(
                                    text: yourBankAccountShowsHere,
                                    fontWeight: mediumFont,
                                    fontSize: 10,
                                    textColor: Color.fromRGBO(52, 52, 52, 1),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(dropdownArrow),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomTextWithLineHeight(
                        text: "Other Settings",
                        fontWeight: mediumFont,
                        fontSize: 12,
                        textColor: Color.fromRGBO(65, 65, 65, 1),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      CustomListTile(
                        title: showAccountBalance,
                        subTitle: "",
                        onTap: () {},
                        bgColor: white,
                        trailingIcon: Iconsax.arrow_circle_down,
                        arrowColor: const Color.fromRGBO(67, 57, 201, 0.1),
                        leadingIcon: eyes,
                        svgIcon: toggleIcon,
                        iconSize: 30,
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      CustomListTile(
                        title: showCancelledCards,
                        subTitle: "",
                        onTap: () {},
                        bgColor: white,
                        trailingIcon: Iconsax.arrow_circle_down,
                        arrowColor: const Color.fromRGBO(67, 57, 201, 0.1),
                        leadingIcon: eyes,
                        svgIcon: toggleIcon,
                        iconSize: 30,
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      CustomListTile(
                        title: changePin,
                        subTitle: "",
                        onTap: () {
                          navToWithScreenName(
                              context: context,
                              screen: const ChangePinScreen());
                          // navTo(context: context, path: Routes.changePinScreen);
                        },
                        bgColor: white,
                        trailingIcon: Iconsax.arrow_circle_down,
                        arrowColor: const Color.fromRGBO(67, 57, 201, 0.1),
                        leadingIcon: passwordIcon,
                        svgIcon: arrowForward,
                        iconSize: 30,
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      CustomListTile(
                        title: bioMetricSignIn,
                        subTitle: "",
                        onTap: () {},
                        bgColor: white,
                        trailingIcon: Iconsax.arrow_circle_down,
                        arrowColor: const Color.fromRGBO(67, 57, 201, 0.1),
                        leadingIcon: faceIdIcon,
                        svgIcon: toggleIcon,
                        iconSize: 30,
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      CustomListTile(
                        title: notificationSettings,
                        subTitle: "",
                        onTap: () {
                          navToWithScreenName(
                              context: context,
                              screen: const NotificationSettingsScreen());
                          // navTo(
                          //     context: context,
                          //     path: Routes.notificationSettingsScreen);
                        },
                        bgColor: white,
                        trailingIcon: Iconsax.arrow_circle_down,
                        arrowColor: const Color.fromRGBO(67, 57, 201, 0.1),
                        leadingIcon: bellIcon,
                        svgIcon: arrowForward,
                        iconSize: 30,
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      CustomListTile(
                        title: cardOrderTracking,
                        subTitle: "",
                        onTap: () {
                          navToWithScreenName(
                              context: context,
                              screen: const CardOrderTrackingScreen());
                          // navTo(
                          //     context: context,
                          //     path: Routes.cardOrderTrackingScreen);
                        },
                        bgColor: white,
                        trailingIcon: Iconsax.arrow_circle_down,
                        arrowColor: const Color.fromRGBO(67, 57, 201, 0.1),
                        leadingIcon: cardOrderTrackingIcon,
                        svgIcon: toggleIcon,
                        iconSize: 30,
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      MainButton(
                        logout,
                        () {
                          context
                              .push(context.namedLocation(loginPasscodeName));
                          // navToWithScreenName(
                          //     context: context,
                          //     screen: const LoginPassCodeScreen(),
                          //     isPushAndRemoveUntil: true);
                          // navTo(
                          //     context: context,
                          //     path: Routes.loginPasscodeScreen,
                          //     isPushAndRemoveUntil: true);
                        },
                        color: const Color.fromRGBO(255, 120, 75, 1),
                      )
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
