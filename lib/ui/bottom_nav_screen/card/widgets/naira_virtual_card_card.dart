import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/cached_network_image_widget.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../model/card_model.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/card_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';
import '../../../../resources/font_manager.dart';

class NairaVirtualCardCard extends StatelessWidget {
  const NairaVirtualCardCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<CardProvider, AuthProvider>(
        builder: (ctx, cardProvider, authProvider, child) {
      CardModel card = cardProvider.cardList[0];
      return Container(
        height: 228.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(43, 147, 123, 1),
            borderRadius: BorderRadius.circular(16.r)),
        child: Stack(
          children: [
            Positioned(
                child: CachedNetworkImageWidget(
              height: 228.h,
              imageUrl: cardProvider.showCardDetails
                  ? nairaVirtualCardBgUrl
                  : nairaVirtualCardHiddenDetailsURL,
              topLeftRadius: 16,
              topRightRadius: 16,
              bottomLeftRadius: 16,
              bottomRightRadius: 16,
            )),
            Positioned(
                top: 86.h,
                left: 29.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyTextPrimaryWithLineHeight(
                      text: cardProvider.showCardDetails
                          ? card.pan.toString().replaceAllMapped(
                              RegExp(r'.{1,4}'),
                              (match) => '${match.group(0)} ')
                          : "",
                      fontSize: 22,
                      // fontFamily: kreditFontFamily,
                      fontWeight: semiBoldFont,
                      textColor: white,
                    ),
                    Row(
                      children: [
                        BodyTextPrimaryWithLineHeight(
                          text: cardProvider.showCardDetails ? card.name : "",
                          fontSize: 12,
                          textColor: white,
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        BodyTextPrimaryWithLineHeight(
                          text: cardProvider.showCardDetails
                              ? "${card.expiryMonth}/${card.expiryYear}"
                              : "",
                          fontSize: 12,
                          textColor: white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    Row(
                      children: [
                        BodyTextPrimaryWithLineHeight(
                          text: "CVV:",
                          fontSize: 10,
                          textColor: cardProvider.showCardDetails
                              ? white
                              : Colors.transparent,
                          fontWeight: mediumFont,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        BodyTextPrimaryWithLineHeight(
                          text: card.cvv!,
                          fontSize: 14,
                          textColor: cardProvider.showCardDetails
                              ? white
                              : Colors.transparent,
                          fontWeight: boldFont,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        InkWell(
                          onTap: () {
                            cardProvider.toggleShowCardDetails();
                          },
                          child: const BodyTextPrimaryWithLineHeight(
                            text: clickToHideCardDetails,
                            fontSize: 10,
                            textColor: white,
                            underLine: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      );
    });
  }
}
