import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/kyc_tier_info_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class TierUpgradeSubmitted extends StatelessWidget {
  const TierUpgradeSubmitted({Key? key}) : super(key: key);

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
              height: 25.h,
            ),
            Center(
              child: SizedBox(
                height: 68.h,
                width: 68.h,
                child: Image.asset(tierUpgradeIcon),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const BodyTextPrimaryWithLineHeight(
                text: yourSubmissionHasBeenDone,
                fontWeight: mediumFont,
                fontSize: 12,
                alignCenter: true,
                textColor: Color.fromRGBO(122, 125, 135, 1),
              ),
            ),
            SizedBox(
              height: 42.h,
            ),
            MainButton(
              "",
              () {
                kycInfoProvider.updateTierUpgradeSubmitted(false);
              },
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 33.w,
                    width: 33.w,
                    child: Image.asset(upgradeTierIconDisable),
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
              color: const Color.fromRGBO(166, 187, 229, 1),
            ),
          ],
        ),
      );
    });
  }
}
