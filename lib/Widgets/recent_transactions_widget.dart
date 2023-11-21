import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../model/transactions_model.dart';
import '../providers/history_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';
import 'custom_text.dart';
import 'long_divider.dart';

class RecentTransactionWidget extends StatelessWidget {
  const RecentTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(builder: (ctx, historyProvider, child) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: historyProvider.transactionHistoriesDisplay.isEmpty
                ? 103
                : 18.h),
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(7.r)),
        child:
            Consumer<HistoryProvider>(builder: (ctx, historyProvider, child) {
          return historyProvider.transactionHistoriesDisplay.isEmpty
              ? Column(
                  children: [
                    Container(
                      height: 90.h,
                      width: 130.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(emptyCardIcon),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const SemiBold14px(
                      text: youHaventPerformAnyTransaction,
                      textColor: Color.fromRGBO(29, 29, 29, 0.59),
                      fontSize: 12,
                      fontWeight: mediumFont,
                    ),
                  ],
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: historyProvider.transactionHistoriesDisplay.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final transaction =
                        historyProvider.transactionHistoriesDisplay[index];
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 3 : 16.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                transaction.isSwap
                                    ? Iconsax.arrow_down
                                    : Icons.arrow_upward,
                                size: 17,
                                color: transaction.isCredit
                                    ? greenColor
                                    : const Color.fromRGBO(255, 120, 75, 1),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BodyTextPrimaryWithLineHeight(
                                    text: transaction.title,
                                    textColor:
                                        const Color.fromRGBO(26, 32, 44, 1),
                                    fontWeight: mediumFont,
                                    fontSize: 12,
                                    lineHeight: 1.5,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  BodyTextPrimaryWithLineHeight(
                                    text: transaction.time,
                                    textColor:
                                        const Color.fromRGBO(113, 128, 150, 1),
                                    fontWeight: mediumFont,
                                    fontSize: 10,
                                    lineHeight: 1.5,
                                  ),
                                ],
                              )),
                              SemiBold12px(
                                text: transaction.amount,
                                textColor: transaction.isCredit
                                    ? greenColor
                                    : const Color.fromRGBO(255, 120, 75, 1),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          if (index < transactionItems.length - 1)
                            const LongDivider()
                        ],
                      ),
                    );
                  });
        }),
      );
    });
  }
}
