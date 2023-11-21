import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Utils/constants.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';
import 'no_card_created_widget.dart';

class NairaCreateCardInfoWidget extends StatelessWidget {
  const NairaCreateCardInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          CustomContainerButton(
            onTap: () {},
            title: "",
            verticalPadding: 16,
            horizontalPadding: 16,
            borderRadius: 8,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BodyTextPrimaryWithLineHeight(
                  text: nairaCard,
                  textColor: Color(0xFF181C26),
                  fontSize: 16,
                  fontWeight: mediumFont,
                ),
                Row(
                  children: [
                    SizedBox(
                        height: 16.h,
                        width: 46.w,
                        child: Image.asset(verveIcon)),
                    SizedBox(
                      width: 16.w,
                    ),
                    SvgPicture.asset(
                      nairaSignBlackIcon,
                      height: 24.h,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const BodyTextPrimaryWithLineHeight(
            text: onlyLimitedToNigerianCurrencyAnd,
            fontSize: 12,
          ),
          SizedBox(
            height: 25.h,
          ),
          const Row(
            children: [
              BodyTextPrimaryWithLineHeight(
                text: issuingFee,
                fontSize: 12,
                fontWeight: mediumFont,
                textColor: Color.fromRGBO(55, 59, 75, 1),
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomContainerButton(
            onTap: () {},
            title: "",
            borderRadius: 16,
            bgColor: const Color(0xFFEAEEFF),
            widget: Row(
              children: [
                SvgPicture.asset(blueInfoIcon),
                SizedBox(
                  width: 16.w,
                ),
                const BodyTextLightWithLineHeight(
                  text: paymentForCardIssuingAndDeliveryAreFinal,
                  fontSize: 12,
                )
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          CustomContainerButton(
            onTap: () {},
            title: "",
            verticalPadding: 16,
            horizontalPadding: 16,
            borderRadius: 8,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(cardIcon__),
                SizedBox(
                  width: 24.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BodyTextPrimaryWithLineHeight(
                        text: chargeFee,
                        fontSize: 10,
                      ),
                      BodyTextPrimaryWithLineHeight(
                        text: "$nairaSign${moneyFormat.format(1000)}",
                        textColor: const Color(0xFF181C26),
                        fontSize: 20,
                        fontWeight: boldFont,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: 16.h, width: 46.w, child: Image.asset(verveIcon)),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          const Row(
            children: [
              BodyTextPrimaryWithLineHeight(
                text: benefits,
                fontSize: 12,
                fontWeight: mediumFont,
                textColor: Color.fromRGBO(55, 59, 75, 1),
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomContainerButton(
            onTap: () {},
            title: "",
            verticalPadding: 24,
            horizontalPadding: 24,
            borderRadius: 8,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CardItemWidget(
                    subTitle: acrossAll36States,
                    title: usableAcrossNigeria,
                    leadingIcon: usableInNigeriaIcon),
                SizedBox(
                  height: 24.h,
                ),
                const CardItemWidget(
                    subTitle: shopOnAnyPlatformOnline,
                    title: onlineShopping,
                    leadingIcon: onlineShoppingIcon),
                SizedBox(
                  height: 24.h,
                ),
                const CardItemWidget(
                    subTitle: payForAnyEntertainment,
                    title: entertainment,
                    showDivider: false,
                    leadingIcon: entertainmentIcon),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
