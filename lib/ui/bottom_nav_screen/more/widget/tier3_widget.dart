import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/kyc_tier_info_provider.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class Tier3Widget extends StatelessWidget {
  const Tier3Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, KYCTierInfoProvider>(
        builder: (ctx, authProvider, kycInfoProvider, child) {
      return CustomContainerButton(
        onTap: () {},
        title: "",
        horizontalPadding: 16,
        verticalPadding: 16,
        borderRadius: 9,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(infoIconBlack),
                SizedBox(
                  width: 2.w,
                ),
                BodyTextPrimaryWithLineHeight(
                  text:
                      "You are currently on Tier ${kycInfoProvider.currentTier}",
                  fontWeight: mediumFont,
                  textColor: const Color.fromRGBO(122, 125, 135, 1),
                )
              ],
            ),
            SizedBox(
              height: 19.h,
            ),
            const BodyTextPrimaryWithLineHeight(
              text: "Account Limits",
              fontWeight: mediumFont,
              fontSize: 12,
              textColor: Color.fromRGBO(122, 125, 135, 1),
            ),
            SizedBox(
              height: 14.h,
            ),
            CustomContainerButton(
              onTap: () {},
              title: "",
              borderRadius: 7,
              verticalPadding: 5,
              horizontalPadding: 6,
              bgColor: const Color(0xFFF6F6F6),
              widget: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BodyTextPrimaryWithLineHeight(
                        text: "Balance Limit",
                        fontWeight: mediumFont,
                        fontSize: 12,
                        textColor: Color.fromRGBO(122, 125, 135, 1),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      BodyTextPrimaryWithLineHeight(
                        text:
                            authProvider.userProfile?.data.accountLimits == null
                                ? "Not Specified"
                                : authProvider.userProfile?.data.accountLimits
                                    ?.maximumBalance,
                        fontWeight: boldFont,
                        fontSize: 12,
                        textColor: const Color.fromRGBO(100, 103, 115, 1),
                      ),
                    ],
                  )),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BodyTextPrimaryWithLineHeight(
                          text: singleCreditLimit,
                          fontWeight: mediumFont,
                          fontSize: 12,
                          textColor: Color.fromRGBO(122, 125, 135, 1),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        BodyTextPrimaryWithLineHeight(
                          text: authProvider.userProfile?.data.accountLimits ==
                                  null
                              ? "Not Specified"
                              : authProvider.userProfile?.data.accountLimits
                                  ?.maximumSingleDeposit,
                          fontWeight: boldFont,
                          fontSize: 12,
                          textColor: const Color.fromRGBO(100, 103, 115, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomContainerButton(
              onTap: () {},
              title: "",
              borderRadius: 7,
              verticalPadding: 5,
              horizontalPadding: 6,
              bgColor: const Color(0xFFF6F6F6),
              widget: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BodyTextPrimaryWithLineHeight(
                        text: "Single Debit Limit",
                        fontWeight: mediumFont,
                        fontSize: 12,
                        textColor: Color.fromRGBO(122, 125, 135, 1),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      BodyTextPrimaryWithLineHeight(
                        text:
                            authProvider.userProfile?.data.accountLimits == null
                                ? "Not Specified"
                                : authProvider.userProfile?.data.accountLimits
                                    ?.maximumTransferWithdrawal,
                        fontWeight: boldFont,
                        fontSize: 12,
                        textColor: const Color.fromRGBO(100, 103, 115, 1),
                      ),
                    ],
                  )),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BodyTextPrimaryWithLineHeight(
                          text: "Daily Debit Limit",
                          fontWeight: mediumFont,
                          fontSize: 12,
                          textColor: Color.fromRGBO(122, 125, 135, 1),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        BodyTextPrimaryWithLineHeight(
                          text: authProvider.userProfile?.data.accountLimits ==
                                  null
                              ? "Not Specified"
                              : authProvider.userProfile?.data.accountLimits
                                  ?.maximumDailyCumulativeDebit,
                          fontWeight: boldFont,
                          fontSize: 12,
                          textColor: const Color.fromRGBO(100, 103, 115, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
