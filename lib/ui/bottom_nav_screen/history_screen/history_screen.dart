import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/recent_transactions_widget.dart';
import '../../../providers/history_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(child:
          Consumer<HistoryProvider>(builder: (ctx, historyProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopPadding(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SemiBold14px(
                    text: "Transaction history ",
                    textColor: black,
                    fontSize: 20,
                    fontWeight: boldFont,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  const SemiBold14px(
                    text: "Select currency below to view history ",
                    textColor: Color.fromRGBO(52, 52, 52, 1),
                    fontSize: 12,
                    fontWeight: mediumFont,
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(6.r)),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 8.w),
                        child: Row(
                          children: [
                            Container(
                              height: 23.h,
                              width: 23.h,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(ngFlag),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(100.r)),
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            const SemiBold14px(
                              text: "NGN",
                              textColor: mainColor,
                              fontSize: 12,
                              fontWeight: boldFont,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(6.r)),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 8.w),
                        child: Row(
                          children: [
                            Container(
                              height: 23.h,
                              width: 23.h,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: NetworkImage(usFlag),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(100.r)),
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            const SemiBold14px(
                              text: "USD",
                              textColor: mainColor,
                              fontSize: 12,
                              fontWeight: boldFont,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(238, 238, 238, 1)),
              child: SizedBox(
                height: 30.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: historyCategories.length,
                    itemBuilder: (context, index) {
                      final category = historyCategories[index];
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 24.w : 0,
                            right: index == historyCategories.length - 1
                                ? 24.w
                                : 6.w),
                        child: InkWell(
                          onTap: () {
                            historyProvider.updateSelectedCategoryIndex(index);
                            historyProvider.filterHistory(category);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 9.w, vertical: 7.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: index ==
                                        historyProvider.selectedCategoryIndex
                                    ? lightBlueTextColor
                                    : const Color.fromRGBO(238, 238, 238, 1),
                                borderRadius: BorderRadius.circular(5.r)),
                            constraints: BoxConstraints(minWidth: 80.w),
                            child: Row(
                              children: [
                                CustomText(
                                  fontWeight: mediumFont,
                                  text: category,
                                  textColor: index ==
                                          historyProvider.selectedCategoryIndex
                                      ? white
                                      : const Color.fromRGBO(65, 68, 74, 0.51),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const RecentTransactionWidget(),
              ),
            ),
          ],
        );
      })),
    );
  }
}
