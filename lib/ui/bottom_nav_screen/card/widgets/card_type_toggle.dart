import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../providers/card_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class CardTypeToggle extends StatelessWidget {
  const CardTypeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
      child: Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
        return Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
              color: black, borderRadius: BorderRadius.circular(46.r)),
          child: Row(
            children: [
              Expanded(
                  child: CustomContainerButton(
                onTap: () {
                  cardProvider.updateNairaCardSelected(true);
                },
                title: "",
                borderRadius: 63,
                bgColor:
                    cardProvider.nairaCardSelected ? white : Colors.transparent,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(cardProvider.nairaCardSelected
                        ? nairaSignBlackIcon
                        : nairaSignActiveIcon),
                    SizedBox(
                      width: 5.w,
                    ),
                    BodyTextLightWithLineHeight(
                      text: nairaCard,
                      fontWeight: mediumFont,
                      fontSize: 12,
                      textColor: cardProvider.nairaCardSelected ? black : white,
                    ),
                  ],
                ),
              )),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: CustomContainerButton(
                onTap: () {
                  cardProvider.updateNairaCardSelected(false);
                },
                title: "",
                bgColor: !cardProvider.nairaCardSelected
                    ? white
                    : Colors.transparent,
                borderRadius: 63,
                widget: Row(
                  children: [
                    SvgPicture.asset(!cardProvider.nairaCardSelected
                        ? dollarSignInActiveIcon
                        : dollarSignActiveIcon),
                    SizedBox(
                      width: 5.w,
                    ),
                    BodyTextLightWithLineHeight(
                      text: dollarCard,
                      fontWeight: mediumFont,
                      fontSize: 12,
                      textColor:
                          !cardProvider.nairaCardSelected ? black : white,
                    )
                  ],
                ),
              )),
            ],
          ),
        );
      }),
    );
  }
}
