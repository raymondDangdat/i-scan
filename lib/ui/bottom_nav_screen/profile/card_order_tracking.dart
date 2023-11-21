import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/arrow_back_icon.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../providers/history_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class CardOrderTrackingScreen extends StatefulWidget {
  const CardOrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<CardOrderTrackingScreen> createState() =>
      _CardOrderTrackingScreenState();
}

class _CardOrderTrackingScreenState extends State<CardOrderTrackingScreen> {
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
            const ArrowBackWidget(),
            SizedBox(
              height: 38.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SemiBold14px(
                    text: cardOrderTracking,
                    textColor: black,
                    fontSize: 20,
                    fontWeight: boldFont,
                  ),
                  SizedBox(
                    height: 28.h,
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
                    itemCount: trackingStagesList.length,
                    itemBuilder: (context, index) {
                      final category = trackingStagesList[index];
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
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120.h,
                      ),
                      Container(
                        height: 89.h,
                        width: 89.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(trackingEmptyStateIcon),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      const CustomText(
                        fontWeight: mediumFont,
                        text: "You have no recent orders",
                        textColor: Color.fromRGBO(65, 68, 74, 0.51),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      })),
    );
  }
}
