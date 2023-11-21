import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/go_router_route_names.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../model/ways_to_arn_model.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/string_constants.dart';
import 'package:provider/provider.dart';

class WaysToEarnBeforePaymentWidget extends StatelessWidget {
  const WaysToEarnBeforePaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
      return SizedBox(
          height: 185.h,
          child: ListView.builder(
              itemCount: waysToEarnList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final wayToEarn = waysToEarnList[index];
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? horizontalPadding.w : 0, right: 4.w),
                  child: InkWell(
                    onTap: () {
                      // debugPrint(authProvider.userProfile?.data.customerType);
                      //
                      // if (authProvider.userProfile != null &&
                      //     authProvider.userProfile?.data.customerType.toString() ==
                      //         customerUserType) {
                      //   showPayToActivateEarningModal(context);
                      // } else {
                      //   context.goNamed(earningDashboardRouteName);
                      // }
                      // navToWithScreenName(
                      //     context: context, screen: const EarnMainScreen());
                    },
                    child: Container(
                      width: 340.w,
                      padding: EdgeInsets.all(24.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: wayToEarn.bgColor,
                          image: DecorationImage(
                              image: AssetImage(wayToEarn.bgImage),
                              fit: BoxFit.cover)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleWidget(
                            title: wayToEarn.title,
                            textColor: white,
                            fontSize: 24,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          SizedBox(
                            width: 200.w,
                            child: BodyTextPrimaryWithLineHeight(
                              text: wayToEarn.subTitle,
                              fontSize: 10,
                              textColor:
                                  Colors.white.withOpacity(0.8999999761581421),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 155.w,
                            child: OutlineBtn(
                              wayToEarn.btnText,
                              () {
                                debugPrint(authProvider
                                    .userProfile?.data.customerType);

                                if (authProvider.userProfile != null &&
                                    authProvider.userProfile?.data.customerType
                                            .toString() ==
                                        customerUserType) {
                                } else {
                                  if (index == 0) {
                                    context.goNamed(earningDashboardRouteName);
                                  } else if (index == 1) {
                                    context.goNamed(
                                        advertisementDashboardRouteName);
                                  } else {
                                    context.goNamed(drHomeRoute);
                                  }
                                }
                                // navToWithScreenName(
                                //     context: context,
                                //     screen: const EarnMainScreen());
                                // navTo(
                                //     context: context,
                                //     path: Routes.earnMainScreen);
                              },
                              backgroundColor: Colors.transparent,
                              textColor: white,
                              borderColor: white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }));
    });
  }
}
