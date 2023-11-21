import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../providers/card_provider.dart';
import '../providers/state_and_city_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/string_constants.dart';
import 'components.dart';
import 'country_selection_modal.dart';
import 'custom_text.dart';

Future showTerminateCardModal(
  BuildContext context,
) {
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        constraints: BoxConstraints(minHeight: 250.h, maxHeight: 335.h),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
        ),
        child: Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 11.h),
              Center(
                child: Container(
                  height: 6.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.26),
                      borderRadius: BorderRadius.circular(100.r)),
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SemiBold14pxNoOverFlow(
                    text: terminateCard,
                    textColor: Color.fromRGBO(65, 65, 65, 1),
                    fontSize: 20,
                    fontWeight: boldFont,
                  ),
                ],
              ),
              SizedBox(height: 11.h),
              const SemiBold14pxNoOverFlow(
                text: "Select the reason for card termination",
                textColor: Color.fromRGBO(0, 0, 0, 0.48),
                fontSize: 12,
                fontWeight: mediumFont,
              ),
              SizedBox(
                height: 32.h,
              ),
              const SemiBold14pxNoOverFlow(
                text: "Select a country",
                textColor: Color.fromRGBO(0, 0, 0, 0.48),
                fontSize: 12,
                fontWeight: mediumFont,
              ),
              SizedBox(height: 9.h),
              Consumer<StateAndCityProvider>(
                  builder: (ctx, countryProvider, child) {
                return CustomDropdownButton(
                  onTap: () {
                    showCountrySelectionModal(context);
                  },
                  title: countryProvider.selectedState == null
                      ? "Select a country"
                      : countryProvider.selectedState?.name,
                  textColor: black,
                  fontWeight: regularFont,
                );
              }),
              const Spacer(),
              MainButton(
                terminateCard,
                () {},
                color: const Color.fromRGBO(255, 120, 75, 1),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          );
        }),
      );
    }),
  );
}
