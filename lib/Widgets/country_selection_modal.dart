import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../providers/state_and_city_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';
import 'country_flag_widget.dart';
import 'custom_text.dart';
import 'long_divider.dart';
import 'textfields.dart';

Future showCountrySelectionModal(
  BuildContext context,
) {
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      final searchController = TextEditingController();
      return Container(
        constraints: BoxConstraints(minHeight: 400.h, maxHeight: 656.h),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Consumer<StateAndCityProvider>(
            builder: (ctx, countryProvider, child) {
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
                SizedBox(height: 23.h),
                CustomField2(
                  search,
                  searchController,
                  type: TextInputType.text,
                  showBorder: false,
                  isSearchField: true,
                  bgColor: const Color.fromRGBO(250, 248, 248, 1),
                  contentPaddingHorizontal: 15,
                  onChange: (value) {
                    // countryProvider.searchCountry(value);
                  },
                  contentPaddingVertical: 15,
                ),
                SizedBox(
                  height: 35.h,
                ),
                SizedBox(
                  // height: 200.h,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: countryProvider.statesToDisplay.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final country = countryProvider.statesToDisplay[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 21.h),
                          child: InkWell(
                            onTap: () {
                              countryProvider.changeSelectedState(country);
                              Navigator.pop(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const CountryFlagWidget(
                                          flagUrl: nigerianFlagURL,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        BodyTextPrimaryWithLineHeight(
                                          text: country.name,
                                          textColor: black,
                                          fontSize: 13,
                                          fontWeight: semiBoldFont,
                                        ),
                                      ],
                                    ),
                                    const BodyTextPrimaryWithLineHeight(
                                      text: "+234",
                                      textColor: Color.fromRGBO(18, 19, 19, 1),
                                      fontSize: 13,
                                      fontWeight: semiBoldFont,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 21.h,
                                ),
                                const LongDivider(
                                  color: Color.fromRGBO(0, 0, 0, 0.07),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        }),
      );
    }),
  );
}
