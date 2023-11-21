import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/cached_network_image_widget.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/card_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';
import '../../../../resources/font_manager.dart';

class DollarVirtualCardCard extends StatelessWidget {
  final Color cardNumberTextColor;
  const DollarVirtualCardCard({Key? key, this.cardNumberTextColor = white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<CardProvider, AuthProvider>(
        builder: (ctx, cardProvider, authProvider, child) {
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
                  ? dollarCardBgUrl
                  : dollarVirtualCardHiddenDetailsURL,
              topLeftRadius: 16,
              topRightRadius: 16,
              bottomLeftRadius: 16,
              bottomRightRadius: 16,
            )),
            Positioned(
                top: 82.h,
                left: 29.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyTextPrimaryWithLineHeight(
                      text: cardProvider.showCardDetails
                          ? "1234 5678 9000 0000"
                          : "",
                      fontSize: 28,
                      fontFamily: kreditFontFamily,
                      fontWeight: semiBoldFont,
                      textColor: cardNumberTextColor,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        BodyTextPrimaryWithLineHeight(
                          text: cardProvider.showCardDetails
                              ? "${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}"
                              : "",
                          fontSize: 12,
                          textColor: white,
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        BodyTextPrimaryWithLineHeight(
                          text: cardProvider.showCardDetails ? "12/25" : "",
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
                          text: "123",
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
