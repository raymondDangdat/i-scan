import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:i_scan/ui/bottom_nav_screen/more/password_reset_flow/password_reset_screen.dart';
import 'package:i_scan/ui/bottom_nav_screen/more/password_reset_flow/pin_reset_screen.dart';
import 'package:i_scan/ui/bottom_nav_screen/more/widget/expandable_card.dart';
import 'package:i_scan/ui/bottom_nav_screen/more/widget/tier1_widget.dart';
import 'package:i_scan/ui/bottom_nav_screen/more/widget/tier2_widget.dart';
import 'package:i_scan/ui/bottom_nav_screen/more/widget/tier3_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../Utils/functions.dart';
import '../../../Utils/go_router_route_names.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_snack_back.dart';
import '../../../Widgets/custom_text.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/bottom_nav_provider.dart';
import '../../../providers/kyc_tier_info_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';

class DrSettingScreen extends StatefulWidget {
  const DrSettingScreen({Key? key}) : super(key: key);

  @override
  State<DrSettingScreen> createState() => _DrSettingScreenState();
}

class _DrSettingScreenState extends State<DrSettingScreen> {
  int selectedCard = 0;
  //1 is account info, 2 is account limit, 3 is security, 0 is none
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor2,
      body: Consumer2<AuthProvider, BottomNavProvider>(
          builder: (ctx, authProvider, bottomNavProvider, child) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 250.h,
                  child: Stack(children: [
                    Positioned(
                      top: 0,
                      bottom: 40,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D5AFC),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r)),
                        ),
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding.w,
                          vertical: 19.h,
                        ),
                        child: const HeaderText(
                          text: settings,
                          textColor: white,
                          fontSize: 18,
                          fontWeight: boldFont,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      right: 15,
                      top: 80,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        padding: const EdgeInsets.all(17),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 64.h,
                                  width: 64.h,
                                  decoration: BoxDecoration(
                                      color: cardColor,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              authProvider.userProfile ==
                                                          null ||
                                                      authProvider.userProfile!
                                                              .data.avatar ==
                                                          null ||
                                                      authProvider.userProfile!
                                                          .data.avatar
                                                          .toString()
                                                          .isEmpty
                                                  ? ""
                                                  : authProvider.userProfile!
                                                      .data.avatar),
                                          fit: BoxFit.cover),
                                      borderRadius:
                                          BorderRadius.circular(16.r)),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        BodyTextPrimaryWithLineHeight(
                                          text:
                                              "${authProvider.firebaseUserProfile?.firstName} ${authProvider.firebaseUserProfile?.lastName}",
                                          textColor: black,
                                          fontSize: 16,
                                          fontWeight: boldFont,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 18.h),
                            MainButton(
                              editProfile,
                              () {
                                context.goNamed(editProfileRouteName);
                              },
                              widget: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(editProfileImgSvg),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  const BodyTextPrimaryWithLineHeight(
                                    text: editProfile,
                                    textColor: Color(0xFFE9ECEF),
                                    fontSize: 12,
                                    lineHeight: 1.33,
                                    fontWeight: boldFont,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                CustomExpansionTile(
                  title: security,
                  icon: Iconsax.shield_tick,
                  isExpanded: selectedCard == 3,
                  onTap: () {
                    setState(() {
                      selectedCard = selectedCard == 3 ? 4 : 3;
                    });
                  },
                  children: [
                    SecurityItem(
                        leadingIconName: securitySettingsLockIcon,
                        title: resetPassword,
                        onTap: () {
                          navToWithScreenName(
                              context: context,
                              screen: const ChangePasswordScreen());
                        }),
                  ],
                ),
                SizedBox(
                  height: 19.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MainButton(
                    logout,
                    () async {
                      bool isLogout =
                          await authProvider.logout(context: context);

                      if (mounted && isLogout) {
                        context.push(context.namedLocation(loginRouteName));
                      }
                    },
                    color: const Color.fromRGBO(24, 29, 38, 1),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class AccountInformationItem extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback copyFunction;
  const AccountInformationItem(
      {Key? key,
      required this.title,
      required this.value,
      required this.copyFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(232, 233, 235, 1),
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BodyTextPrimaryWithLineHeight(
            text: title,
            textColor: const Color.fromRGBO(122, 125, 135, 1),
            fontSize: 12,
            lineHeight: 1.2,
            fontWeight: mediumFont,
          ),
          InkWell(
            onTap: copyFunction,
            child: Row(
              children: [
                BodyTextPrimaryWithLineHeight(
                  text: value,
                  textColor: const Color.fromRGBO(24, 29, 38, 1),
                  fontSize: 12,
                  lineHeight: 1.33,
                  fontWeight: boldFont,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Icon(
                  Iconsax.document_copy,
                  size: 20.h,
                  color: const Color.fromRGBO(167, 169, 175, 1),
                )
              ],
            ),
          ),
        ],
      ),
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
              // color: const Color.fromRGBO(232, 233, 235, 1),
              borderRadius: BorderRadius.circular(9.r)),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(11.r),
                decoration: const ShapeDecoration(
                  color: Color(0x118B83BC),
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

class TierCardWidget extends StatelessWidget {
  final String label1Text;
  final String label2Text;
  final String text1;
  final String text2;
  const TierCardWidget(
      {Key? key,
      required this.label1Text,
      required this.label2Text,
      required this.text1,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerButton(
      onTap: () {},
      title: "",
      borderRadius: 7,
      verticalPadding: 5,
      horizontalPadding: 6,
      bgColor: const Color(0x0F2056BE),
      widget: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTextPrimaryWithLineHeight(
                text: label1Text,
                fontWeight: mediumFont,
                fontSize: 12,
                textColor: const Color(0xFF2056BE),
              ),
              SizedBox(
                height: 6.h,
              ),
              BodyTextPrimaryWithLineHeight(
                text:
                    "${text1.toLowerCase() == "UNLIMITED".toLowerCase() ? '' : nairaSign}$text1",
                fontWeight: boldFont,
                fontSize: 12,
                textColor: const Color(0xFF2056BE),
              ),
            ],
          )),
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyTextPrimaryWithLineHeight(
                  text: label2Text,
                  fontWeight: mediumFont,
                  fontSize: 12,
                  textColor: const Color(0xFF2056BE),
                ),
                SizedBox(
                  height: 6.h,
                ),
                BodyTextPrimaryWithLineHeight(
                  text: "${text2.isEmpty ? '' : nairaSign}$text2",
                  fontWeight: boldFont,
                  fontSize: 12,
                  textColor: const Color(0xFF2056BE),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
