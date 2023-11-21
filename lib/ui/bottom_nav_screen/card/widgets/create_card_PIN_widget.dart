import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../providers/card_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';
import 'card_type_toggle.dart';

class CreateCardPINScreen extends StatefulWidget {
  const CreateCardPINScreen({Key? key}) : super(key: key);

  @override
  State<CreateCardPINScreen> createState() => _CreateCardPINScreenState();
}

class _CreateCardPINScreenState extends State<CreateCardPINScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
      return Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: black,
                    image: DecorationImage(
                        image: NetworkImage(cardEmptyStateBgUrl),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: EdgeInsets.only(top: 36.h, bottom: 38.h, left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 164.w,
                        child: CustomContainerButton(
                          onTap: () {},
                          title: "",
                          borderRadius: 32,
                          horizontalPadding: 8,
                          verticalPadding: 8,
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
                              const GradientTextWidget(
                                text: virtualCardCreation,
                                gradientColors: [
                                  Color.fromRGBO(120, 150, 255, 1),
                                  Color.fromRGBO(45, 252, 178, 1),
                                ],
                                fontSize: 12,
                                fontWeight: boldFont,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const TitleWidget(
                        title: chooseCardType,
                        textColor: Color.fromRGBO(211, 212, 215, 1),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BodyTextLightWithLineHeight(
                        text: pleaseMakeASelection,
                        textColor: Colors.white.withOpacity(0.5),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              const CardTypeToggle(),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: MainButton(
                  proceedAndPay,
                  () {},
                  border: 18,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
