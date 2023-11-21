import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/functions.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_snack_back.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/modal_header_with_close_icon_widget.dart';
import '../../../Widgets/textfields.dart';
import '../../../Widgets/title_widget.dart';
import '../../../providers/ai_provider.dart';
import '../../../providers/auth_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/string_constants.dart';

class OfferWidget extends StatelessWidget {
  final String? offer;
  final String amount;
  final String credits;
  final String extra;
  const OfferWidget({
    super.key,
    this.offer,
    required this.amount,
    required this.credits,
    required this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          backgroundColor: const Color(0xFF181C26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(modalRadius.r),
                topRight: Radius.circular(modalRadius.r)),
          ),
          builder: (BuildContext context) {
            final controller = TextEditingController(
              text: amount,
            );
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Consumer2<AiProvider, AuthProvider>(
                builder: (ctx, aiProvider, auth, child) {
                  return Container(
                    margin: EdgeInsets.only(
                        bottom: bottomPadding.h,
                        top: 14.h,
                        left: horizontalPadding.w,
                        right: horizontalPadding.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(modalRadius.r),
                          topRight: Radius.circular(modalRadius.r)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 14.h),
                        const ModalHeaderWithCloseIconWidget(),
                        SizedBox(
                          height: 49.h,
                        ),
                        const TitleWidget(
                          title: "Purchase hash credits",
                          fontSize: 24,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Input",
                            style: TextStyle(color: textGreyColor),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomField(
                          amount,
                          controller,
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
                              textColor: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          fontSize: 12,
                          borderRadius: 16,
                          enabled: false,
                          textColor: Colors.white,
                          fillColor: Colors.transparent,
                          borderColor: Colors.white,
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        MainButton(
                          "Buy Hash credits",
                          () async {
                            if (double.parse(controller.text) > 1000) {
                              final result =
                                  await aiProvider.buyCredits(controller.text);
                              if (result) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                auth.getProfile();
                                customSnackBar(
                                    context, "Hash credits purchased");
                              } else {
                                customSnackBar(context, "Could not purchase");
                              }
                            } else {
                              // customSnackBar(context,
                              //     "Amount must be at least $nairaSign${1000}");
                            }
                          },
                          color: Colors.transparent,
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Colors.black.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (offer != null)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  offer!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#$credits',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.64,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Extra $extra credits',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 33),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formatCurrency(double.parse(amount)),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
