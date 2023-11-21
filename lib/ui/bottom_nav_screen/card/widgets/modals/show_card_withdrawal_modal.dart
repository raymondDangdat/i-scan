import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/ui/bottom_nav_screen/card/widgets/modals/show_card_withdrawal_successful_modal.dart';
import 'package:provider/provider.dart';
import '../../../../../../Widgets/components.dart';
import '../../../../../../resources/constants/color_constants.dart';
import '../../../../../../resources/constants/dimension_constants.dart';
import '../../../../../../resources/constants/font_constants.dart';
import '../../../../../../resources/constants/string_constants.dart';
import '../../../../../Utils/constants.dart';
import '../../../../../Widgets/custom_snack_back.dart';
import '../../../../../Widgets/custom_text.dart';
import '../../../../../Widgets/modal_header_with_close_icon_widget.dart';
import '../../../../../Widgets/textfields.dart';
import '../../../../../Widgets/title_widget.dart';
import '../../../../../model/card_model.dart';
import '../../../../../providers/auth_provider.dart';
import '../../../../../providers/card_provider.dart';

Future showCardWithdrawalModal(BuildContext importedContext,
    {bool isTarget = true}) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    context: importedContext,
    backgroundColor: white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(modalRadius.r),
        topRight: Radius.circular(modalRadius.r),
      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 14.h),
                    const ModalHeaderWithCloseIconWidget(),
                    SizedBox(
                      height: 49.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            TitleWidget(
                              title: withdraw,
                              fontSize: 24,
                            ),
                            BodyTextPrimaryWithLineHeight(
                              text: howMuchWouldYouWithdraw,
                              fontSize: 12,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    const TitleWidget(
                      title: howMuch,
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomField(
                            amount,
                            cardProvider.amountController,
                            isCapitalizeSentence: false,
                            formatters: numbersOnlyFormat,
                            type: const TextInputType.numberWithOptions(
                                signed: true),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 17.w, top: 14.h, right: 6.w),
                              child: const CustomTextWithLineHeight(
                                text: nairaSign,
                                fontWeight: boldFont,
                                textColor: Color(0xFF1F1F1F),
                                fontSize: 12,
                              ),
                            ),
                            fontSize: 12,
                            borderRadius: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    MainButton(okay, () async {
                      if (double.parse(cardProvider.amountController.text) >
                          1000) {
                        CardModel card = cardProvider.cardList[0];
                        (bool, String) result =
                            await cardProvider.fundOrWithdrawCard(
                          cardId: card.id,
                          amount: cardProvider.amountController.text,
                          isFunding: false,
                          accountID: authProvider
                              .userProfile!.data.accounts[0].reference
                              .toString(),
                        );
                        if (result.$1) {
                          Navigator.pop(context);
                          showCardWithdrawalSuccessfulModal(context);
                        } else {
                          customSnackBar(context, result.$2);
                        }
                      } else {
                        customSnackBar(context,
                            "Amount must be at least $nairaSign${1000}");
                      }
                    })
                  ],
                ));
          }));
    },
  );
}
