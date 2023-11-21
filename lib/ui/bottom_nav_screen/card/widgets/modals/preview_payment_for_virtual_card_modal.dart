import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../../Utils/constants.dart';
import '../../../../../Widgets/components.dart';
import '../../../../../Widgets/custom_text.dart';
import '../../../../../Widgets/long_divider.dart';
import '../../../../../Widgets/modal_header_with_close_icon_widget.dart';
import '../../../../../Widgets/title_widget.dart';
import '../../../../../providers/auth_provider.dart';
import '../../../../../providers/card_provider.dart';
import '../../../../../resources/constants/color_constants.dart';
import '../../../../../resources/constants/dimension_constants.dart';
import '../../../../../resources/constants/font_constants.dart';
import '../../../../../resources/constants/image_constant.dart';
import '../../../../../resources/constants/string_constants.dart';
import 'show_where_payment_will_occur_modal.dart';

Future showPreviewPaymentForVirtualCardModal(BuildContext importedContext,
    {bool isTarget = true}) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    context: importedContext,
    backgroundColor: white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(modalRadius.r),
          topRight: Radius.circular(modalRadius.r)),
    ),
    builder: (BuildContext context) {
      return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Consumer2<CardProvider, AuthProvider>(
              builder: (ctx, cardProvider, authProvider, child) {
            return Container(
                margin: EdgeInsets.only(
                    bottom: bottomPadding.h,
                    top: 14.h,
                    left: horizontalPadding.w,
                    right: horizontalPadding.w),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(modalRadius.r),
                      topRight: Radius.circular(modalRadius.r)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 14.h),
                    const ModalHeaderWithCloseIconWidget(),
                    SizedBox(
                      height: 58.h,
                    ),
                    SvgPicture.asset(previewIcon),
                    SizedBox(
                      height: 8.h,
                    ),
                    const TitleWidget(
                      title: preview,
                      fontSize: 24,
                    ),
                    SizedBox(
                      height: 16.h,
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
                      height: 16.h,
                    ),
                    if (cardProvider.nairaCardSelected)
                      CustomContainerButton(
                        onTap: () {},
                        title: "",
                        height: 16,
                        verticalPadding: 18,
                        borderRadius: 9,
                        bgColor: const Color.fromRGBO(232, 233, 235, 1),
                        widget: Column(
                          children: [
                            const Item(
                                label: "Services:", title: virtualCardIssuing),
                            Item(
                                label: "From:",
                                title: authProvider.userProfile == null ||
                                        authProvider
                                            .userProfile!.data.accounts.isEmpty
                                    ? "0000000000"
                                    : authProvider.userProfile!.data.accounts[0]
                                        .accountNumber),
                            Item(
                              label: "Amount:",
                              title: cardProvider.nairaCardSelected
                                  ? "$nairaSign${moneyFormat.format(1000)}$decimalPlace"
                                  : "$nairaSign${moneyFormat.format(3000)}",
                              showSizedBox: false,
                            ),
                          ],
                        ),
                      ),
                    if (!cardProvider.nairaCardSelected)
                      CustomContainerButton(
                        onTap: () {},
                        title: "",
                        height: 16,
                        verticalPadding: 18,
                        borderRadius: 9,
                        bgColor: const Color.fromRGBO(232, 233, 235, 1),
                        widget: Column(
                          children: [
                            const Item(
                                label: "Services:", title: virtualCardIssuing),
                            Item(
                                label: "Opening balance (USD 3):",
                                title:
                                    "$nairaSign${moneyFormat.format(3225)}$decimalPlace"),
                            Item(
                              label: exchangeRate,
                              title:
                                  "1 USD = $nairaSign${moneyFormat.format(1075)}$decimalPlace",
                            ),
                            const LongDivider(),
                            SizedBox(
                              height: 20.h,
                            ),
                            Item(
                              label: total,
                              title:
                                  "$nairaSign${moneyFormat.format(3225)}$decimalPlace",
                              showSizedBox: false,
                            ),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 32.h,
                    ),
                    MainButton(
                      proceed,
                      () {
                        Navigator.pop(context);
                        showWherePaymentWillOccurModal(context);
                      },
                      border: 16,
                      color: const Color(0xFF0C0C0C),
                    ),
                  ],
                ));
          }));
    },
  );
}

class Item extends StatelessWidget {
  final String label;
  final String title;
  final bool showSizedBox;
  const Item(
      {Key? key,
      required this.label,
      required this.title,
      this.showSizedBox = true})
      : super(key: key);

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
              textColor: black,
            ),
            BodyTextPrimaryWithLineHeight(
              text: title,
              fontSize: 12,
              textColor: black,
              fontWeight: mediumFont,
            )
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
