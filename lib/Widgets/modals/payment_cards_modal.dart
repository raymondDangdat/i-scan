import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../../../../resources/constants/color_constants.dart';
import '../../../../../Widgets/pull_down_indicator.dart';
import '../../model/dummy_card_model.dart';
import '../../providers/card_provider.dart';
import '../../resources/constants/dimension_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';
import '../add_debit_card_modal.dart';
import '../components.dart';
import '../custom_radio_button_widget.dart';
import '../custom_text.dart';
import '../long_divider.dart';
import '../title_widget.dart';

class OptionItem extends StatelessWidget {
  final String title;
  final String subText;
  final VoidCallback onTap;
  final bool showDivider;
  final bool isSelected;
  final bool isFromBankCard;
  const OptionItem(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.subText,
      this.showDivider = false,
      this.isSelected = false,
      this.isFromBankCard = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWithLineHeight(
                      text: title,
                      fontSize: 12,
                      fontWeight: boldFont,
                      textColor: const Color(0xFF1A202C),
                      alignCenter: true,
                    ),
                    CustomTextWithLineHeight(
                      text: subText,
                      fontSize: 10,
                      textColor: const Color.fromRGBO(145, 147, 155, 1),
                      alignCenter: true,
                    ),
                  ],
                ),
              ),
              isFromBankCard
                  ? SvgPicture.asset(
                      forwardIconSvg,
                      height: 18.h,
                    )
                  : Container(
                      width: 24.h,
                      height: 24.h,
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                            color: isSelected
                                ? const Color.fromRGBO(255, 28, 137, 1)
                                : inputBorderColor,
                          )),
                      child: Container(
                        width: 20.h,
                        height: 20.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: isSelected
                                ? const Color.fromRGBO(255, 28, 137, 1)
                                : white),
                      ),
                    )
            ],
          ),
          if (showDivider)
            SizedBox(
              height: 16.h,
            ),
          if (showDivider) const LongDivider(),
        ],
      ),
    );
  }
}

Future showPaymentCardsModal(BuildContext importedContext) {
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
          child: Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
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
                    const PullDownIndicator(),
                    SizedBox(
                      height: 49.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                      child: Column(
                        children: [
                          CustomContainerButton(
                            onTap: () {
                              showAddDebitCardModal(context);
                            },
                            title: "",
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(addCardPlusIcon),
                                SizedBox(
                                  width: 8.w,
                                ),
                                const BodyTextPrimaryWithLineHeight(
                                  text: addDebitCard,
                                  fontWeight: mediumFont,
                                  fontSize: 12,
                                  textColor: Color(0xFF212529),
                                ),
                              ],
                            ),
                            borderColor: inputBorderColor,
                            verticalPadding: 16,
                            borderRadius: 16,
                          ),
                          SizedBox(
                            height: 48.h,
                          ),
                          ListView.builder(
                              itemCount: dummyCardList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final card = dummyCardList[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: index < dummyCardList.length - 1
                                          ? 24.h
                                          : 0),
                                  child: InkWell(
                                    onTap: () {
                                      cardProvider.updateSelectedCard(card);
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                if (card ==
                                                    cardProvider
                                                        .selectedDummyCard)
                                                  const CustomRadioButtonWidget(
                                                    isSelected: true,
                                                  ),
                                                if (card ==
                                                    cardProvider
                                                        .selectedDummyCard)
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                SizedBox(
                                                    height: 32.h,
                                                    width: 32.h,
                                                    child: Image.asset(
                                                        card.bankLogo)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 16.w,
                                            ),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TitleWidget(
                                                    title: card.cardNumber),
                                                BodyTextPrimaryWithLineHeight(
                                                    text: card.bankName),
                                              ],
                                            )),
                                            SvgPicture.asset(card.cardType),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 24.h,
                                        ),
                                        if (index < dummyCardList.length - 1)
                                          const LongDivider(),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 48.h,
                          ),
                          MainButton(proceed, () {
                            Navigator.pop(
                                context,
                                cardProvider.selectedDummyCard == null
                                    ? false
                                    : true);
                          })
                        ],
                      ),
                    ),
                  ],
                ));
          }));
    },
  );
}
