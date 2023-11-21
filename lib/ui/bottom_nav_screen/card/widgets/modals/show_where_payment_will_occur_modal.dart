import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_scan/ui/bottom_nav_screen/card/widgets/modals/show_virtual_card_payment_validated_modal.dart';
import 'package:provider/provider.dart';
import '../../../../../Widgets/components.dart';
import '../../../../../Widgets/custom_snack_back.dart';
import '../../../../../Widgets/modal_header_with_close_icon_widget.dart';
import '../../../../../Widgets/title_widget.dart';
import '../../../../../providers/auth_provider.dart';
import '../../../../../providers/card_provider.dart';
import '../../../../../resources/constants/color_constants.dart';
import '../../../../../resources/constants/dimension_constants.dart';
import '../../../../../resources/constants/font_constants.dart';
import '../../../../../resources/constants/image_constant.dart';
import '../../../../../resources/constants/string_constants.dart';
import '../../../../../resources/styles_manager.dart';

Future showWherePaymentWillOccurModal(BuildContext importedContext,
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
                    SvgPicture.asset(solarCardBrokenIcon),
                    SizedBox(
                      height: 46.h,
                    ),
                    const TitleWidget(
                      title: paymentWillBeFromMainWallet,
                      fontSize: 24,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "This will take you to the ",
                        style: getRichTextStyle(
                            fontSize: 10,
                            textColor: const Color(0xFF2B2C34),
                            fontWeight: regularFont),
                        children: <TextSpan>[
                          TextSpan(
                              style: getCustomTextStyle(
                                  fontSize: 10,
                                  textColor: black,
                                  fontWeight: boldFont),
                              text: "next step"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    MainButton(
                      cardProvider.isCreatingCard ? 'Processing...' : pay,
                      () async {
                        // return;
                        String message = await cardProvider.createCard(
                          isNairaCard: cardProvider.nairaCardSelected,
                        );
                        if (message.isNotEmpty) {
                          customSnackBar(context, message);
                        } else {
                          Navigator.pop(context);
                          if (cardProvider.userHasCardCreated) {
                            showVirtualCardPaymentValidatedModal(context);
                          }
                        }
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
