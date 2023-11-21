import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/long_divider.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../providers/card_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';
import 'card_type_toggle.dart';
import 'dollar_create_card_info_widget.dart';
import 'modals/preview_payment_for_virtual_card_modal.dart';
import 'naira_card_create_card_info_widget.dart';
import 'virtual_card_gradient_widget.dart';

class NoCardCreatedWidget extends StatelessWidget {
  const NoCardCreatedWidget({Key? key}) : super(key: key);

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
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 36.h, bottom: 38.h, left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VirtualCardGradientWidget(),
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
              if (cardProvider.nairaCardSelected)
                const NairaCreateCardInfoWidget(),
              if (!cardProvider.nairaCardSelected)
                const DollarCreateCardInfoWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: MainButton(
                  cardProvider.nairaCardSelected
                      ? getVirtualHashNairaCard
                      : getVirtualHashDollarCard,
                  () {
                    showPreviewPaymentForVirtualCardModal(context);
                  },
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

class CardItemWidget extends StatelessWidget {
  final String leadingIcon;
  final String title;
  final String subTitle;
  final bool showDivider;
  const CardItemWidget(
      {Key? key,
      required this.subTitle,
      required this.title,
      required this.leadingIcon,
      this.showDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(leadingIcon),
        SizedBox(
          width: 24.w,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
              title: title,
              fontSize: 14,
              fontWeight: mediumFont,
              textColor: black,
            ),
            BodyTextPrimaryWithLineHeight(
              text: subTitle,
              fontSize: 10,
            ),
            if (showDivider)
              SizedBox(
                height: 12.h,
              ),
            if (showDivider) const LongDivider(),
          ],
        ))
      ],
    );
  }
}
