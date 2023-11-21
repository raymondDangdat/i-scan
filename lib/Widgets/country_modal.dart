import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../providers/customer_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/string_constants.dart';
import 'components.dart';
import 'custom_text.dart';

Future showCountryModal(
  BuildContext context,
) {
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      return Container(
        constraints: BoxConstraints(minHeight: 100.h, maxHeight: 656.h),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child:
            Consumer<CustomerProvider>(builder: (ctx, customerProvider, child) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 18.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SemiBold16px(text: selectAnOption),
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                SizedBox(
                  // height: 200.h,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: dummyCountries.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final state = dummyCountries[index];
                        return Padding(
                          padding: EdgeInsets.only(top: 11.h),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 11.w),
                            decoration: BoxDecoration(
                                color: customerProvider.selectedCountry == state
                                    ? lightBlueTextColor
                                    : white,
                                borderRadius: BorderRadius.circular(9.r)),
                            child: InkWell(
                              onTap: () {
                                customerProvider.updateSelectedCountry(state);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          BodyTextPrimaryWithLineHeight(
                                            text: state,
                                            textColor: customerProvider
                                                        .selectedCountry ==
                                                    state
                                                ? white
                                                : black,
                                            fontSize: 13,
                                            fontWeight: semiBoldFont,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 18.h,
                                    width: 18.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        border: Border.all(
                                            width: state ==
                                                    customerProvider
                                                        .selectedCountry
                                                ? 2
                                                : 1,
                                            color: state ==
                                                    customerProvider
                                                        .selectedCountry
                                                ? white
                                                : const Color.fromRGBO(
                                                    0, 0, 0, 0.33))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 49.h,
                ),
                MainButton(
                  proceed,
                  () {
                    if (customerProvider.selectedCountry != null) {
                      Navigator.pop(context);
                    }
                  },
                  color: black,
                ),
                SizedBox(
                  height: 39.h,
                ),
              ],
            ),
          );
        }),
      );
    }),
  );
}
