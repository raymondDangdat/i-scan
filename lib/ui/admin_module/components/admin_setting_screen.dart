import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../Utils/go_router_route_names.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_text.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/bottom_nav_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';
import '../../bottom_nav_screen/home/more_dashboard_item_screen.dart';
import '../../bottom_nav_screen/more/password_reset_flow/password_reset_screen.dart';
import '../../bottom_nav_screen/more/widget/expandable_card.dart';

class IScanAdminSettings extends StatefulWidget {
  const IScanAdminSettings({Key? key}) : super(key: key);

  @override
  State<IScanAdminSettings> createState() => _IScanAdminSettingsState();
}

class _IScanAdminSettingsState extends State<IScanAdminSettings> {
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, BottomNavProvider>(
        builder: (ctx, authProvider, bottomNavProvider, child) {
        return Expanded(
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
                        authProvider.updateIsDoctor(true);
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
            ));
      }
    );
  }
}
