import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../providers/card_provider.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class VirtualCardGradientWidget extends StatelessWidget {
  final List<Color> gradientColors;
  final double verticalPadding;
  final double horizontalPadding;
  const VirtualCardGradientWidget(
      {Key? key,
      this.gradientColors = const [
        Color.fromRGBO(120, 150, 255, 1),
        Color.fromRGBO(45, 252, 178, 1),
      ],
      this.horizontalPadding = 8,
      this.verticalPadding = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164.w,
      child: CustomContainerButton(
        onTap: () {},
        title: "",
        borderRadius: 32,
        horizontalPadding: horizontalPadding,
        verticalPadding: verticalPadding,
        bgColor: const Color(0xFF181C26),
        widget: Row(
          children: [
            SizedBox(
              height: 36.h,
            ),
            SvgPicture.asset(virtualCardIcon),
            SizedBox(
              width: 8.w,
            ),
            Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
              return GradientTextWidget(
                text: virtualCardCreation,
                gradientColors: cardProvider.nairaCardSelected
                    ? gradientColors
                    : [
                        const Color.fromRGBO(255, 120, 193, 1),
                        const Color.fromRGBO(252, 219, 45, 1)
                      ],
                fontSize: 12,
                fontWeight: boldFont,
              );
            }),
          ],
        ),
      ),
    );
  }
}
