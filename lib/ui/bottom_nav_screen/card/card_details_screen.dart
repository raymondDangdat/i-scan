import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_scan/ui/bottom_nav_screen/card/widgets/dollar_virtual_card_card.dart';
import 'package:i_scan/ui/bottom_nav_screen/card/widgets/naira_virtual_card_card.dart';
import 'package:provider/provider.dart';

import '../../../Utils/functions.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/title_widget.dart';
import '../../../model/card_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/card_provider.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<CardProvider, AuthProvider>(
        builder: (ctx, cardProvider, authProvider, child) {
      CardModel card = cardProvider.cardList[0];
      return Expanded(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            IScanAppBar(
              title: "",
              onTap: () {
                //Show car Dashboard
                cardProvider.updateCardScreenStep(2);
              },
            ),
            SizedBox(
              height: 21.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
              child: const Row(
                children: [
                  TitleWidget(
                    title: cardDetails,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Column(
                  children: [
                    if (!cardProvider.nairaCardSelected)
                      const DollarVirtualCardCard(
                        cardNumberTextColor: Color.fromRGBO(145, 147, 155, 1),
                      ),
                    if (cardProvider.nairaCardSelected)
                      const NairaVirtualCardCard(),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomContainerButton(
                      onTap: () {},
                      title: "",
                      borderRadius: 16,
                      widget: Column(
                        children: [
                          ItemWidget(
                            label: cardPan,
                            info: card.pan,
                            showCopyIcon: true,
                            showSizedBox: true,
                          ),
                          ItemWidget(
                            label: cvv,
                            info: card.cvv!,
                            showCopyIcon: true,
                            showSizedBox: true,
                          ),
                          ItemWidget(
                            label: expiryDate,
                            info: "${card.expiryMonth}/${card.expiryYear}",
                            showCopyIcon: true,
                            showSizedBox: true,
                          ),
                          ItemWidget(
                            label: "PIN",
                            info: card.pin ?? "",
                            showCopyIcon: true,
                            showSizedBox: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomContainerButton(
                      onTap: () {},
                      title: "",
                      borderRadius: 16,
                      widget: Column(
                        children: [
                          ItemWidget(
                            label: "Card owner’s name",
                            info: card.name,
                            showSizedBox: true,
                          ),
                          ItemWidget(
                            label: "Street address",
                            info: card.billingAddress.street,
                            showSizedBox: true,
                          ),
                          ItemWidget(
                            label: "City",
                            info: card.billingAddress.city,
                            showSizedBox: true,
                          ),
                          ItemWidget(
                            label: "State",
                            info: card.billingAddress.state,
                            showSizedBox: true,
                          ),
                          ItemWidget(
                            label: "Country",
                            info: card.billingAddress.country,
                            showSizedBox: true,
                          ),
                          ItemWidget(
                            label: "Postal code",
                            info: card.billingAddress.postalCode,
                            showSizedBox: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ItemWidget extends StatelessWidget {
  final String label;
  final String info;
  final bool showCopyIcon;
  final VoidCallback? onTap;
  final bool showSizedBox;
  const ItemWidget({
    Key? key,
    required this.label,
    required this.info,
    this.showCopyIcon = false,
    this.onTap,
    this.showSizedBox = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyTextPrimaryWithLineHeight(
              text: label,
              fontSize: 10,
            ),
            Row(
              children: [
                TitleWidget(
                  title: info,
                  fontSize: 12,
                ),
                if (showCopyIcon)
                  InkWell(
                    onTap: () {
                      copyToClipboard(info);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: SvgPicture.asset(copyIconSmall),
                    ),
                  ),
              ],
            ),
          ],
        ),
        if (showSizedBox)
          SizedBox(
            height: 16.h,
          ),
      ],
    );
  }
}
