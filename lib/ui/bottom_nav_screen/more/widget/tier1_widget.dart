import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/functions.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_snack_back.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/kyc_tier_info_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';
import '../more_screen.dart';

class Tier1Widget extends StatelessWidget {
  const Tier1Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, KYCTierInfoProvider>(
        builder: (ctx, authProvider, kycInfoProvider, child) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (kycInfoProvider.resMessage != '') {
          customSnackBar(context, kycInfoProvider.resMessage);

          ///Clear the response message to avoid duplicate
          kycInfoProvider.clear();
        }
      });
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
            if (kycInfoProvider.isDisplayingNextTierInfo)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  const BodyTextPrimaryWithLineHeight(
                    text: "Tier 2 Benefit",
                    fontSize: 12,
                    fontWeight: boldFont,
                    textColor: black,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  const TierCardWidget(
                      label1Text: balanceLimit,
                      label2Text: singleCreditLimit,
                      text1: "500,000.00",
                      text2: "200,000.00"),
                  SizedBox(
                    height: 9.h,
                  ),
                  const TierCardWidget(
                      label1Text: "Single Debit Limit",
                      label2Text: dailyDebitLimit,
                      text1: "10,000.00",
                      text2: "100,000.00"),
                  SizedBox(
                    height: 9.h,
                  ),
                  const TierCardWidget(
                      label1Text: "Upgrade fee",
                      label2Text: "",
                      text1: "50.00",
                      text2: ""),
                ],
              ),
            SizedBox(
              height: 18.h,
            ),
            if (!kycInfoProvider.isDisplayingNextTierInfo)
              MainButton(
                "",
                () {
                  kycInfoProvider.updateIsDisplayNextTierInfo(true);
                },
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 33.w,
                      width: 33.w,
                      child: Image.asset(upgradeTierIcon),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    const BodyTextPrimaryWithLineHeight(
                      text: "Upgrade to Tier 2",
                      textColor: white,
                      fontWeight: boldFont,
                      fontSize: 13,
                    )
                  ],
                ),
                color: const Color(0xFF2056BE),
              ),
            if (kycInfoProvider.isDisplayingNextTierInfo)
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: MainButton(
                      "",
                      () {
                        kycInfoProvider.updateIsDisplayNextTierInfo(false);
                      },
                      widget: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BodyTextPrimaryWithLineHeight(
                            text: cancel,
                            textColor: Color(0xFFF60700),
                            fontWeight: boldFont,
                            fontSize: 13,
                          )
                        ],
                      ),
                      color: const Color(0x11F60700),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Expanded(
                    flex: 3,
                    child: MainButton(
                      "",
                      () async {
                        if (kycInfoProvider.upgradingTierLevel) {
                        } else {
                          bool tierUpgraded = await kycInfoProvider
                              .upgradeTierLevel(context: context);

                          popLoader(context: context);

                          if (tierUpgraded) {
                            kycInfoProvider.updateIsDisplayNextTierInfo(false);
                            kycInfoProvider.updateCurrentTier(2);
                            kycInfoProvider.updateTierUpgradeSubmitted(true);
                          }
                          authProvider.getProfile();
                        }
                      },
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 33.w,
                            width: 33.w,
                            child: Image.asset(upgradeTierIcon),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          const BodyTextPrimaryWithLineHeight(
                            text: "Upgrade to Tier 2",
                            textColor: white,
                            fontWeight: boldFont,
                            fontSize: 13,
                          )
                        ],
                      ),
                      color: const Color(0xFF2056BE),
                    ),
                  ),
                ],
              ),
          ],
        ),
      );
    });
  }
}
