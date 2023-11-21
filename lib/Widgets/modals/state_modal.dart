import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;
import 'package:provider/provider.dart';
import '../../../../../Widgets/pull_down_indicator.dart';
import '../../../../../resources/constants/color_constants.dart';
import '../../../../../resources/constants/dimension_constants.dart';
import '../../../../../resources/constants/font_constants.dart';
import '../../../../../resources/styles_manager.dart';
import '../../providers/state_and_city_provider.dart';
import '../../resources/constants/image_constant.dart';
import '../custom_text.dart';
import '../long_divider.dart';
import '../modal_header_with_close_icon_widget.dart';

Future showStateSelectionModal(BuildContext importContext) {
  return modal.showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: importContext,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      final searchController = TextEditingController();
      return Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(modalRadius.r),
                topRight: Radius.circular(modalRadius.r)),
          ),
          constraints: BoxConstraints(
            minHeight: 300.h,
            maxHeight: 700.h,
          ),
          child: Consumer<StateAndCityProvider>(
              builder: (ctx, stateAndCityProvider, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 14.h),
                const PullDownIndicator(),
                SizedBox(height: 41.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(3, 31, 76, 0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 16.w,
                          ),
                          SvgPicture.asset(searchIcon),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: TextField(
                            controller: searchController,
                            autofocus: false,
                            autocorrect: false,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                stateAndCityProvider.searchForState(value);
                              } else {
                                stateAndCityProvider.resetSearch();
                              }
                            },
                            cursorColor: mainColor,
                            textInputAction: TextInputAction.search,
                            decoration: const InputDecoration(
                              hintText: "Search",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: textInputStyle(),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: stateAndCityProvider.statesToDisplay.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final state =
                            stateAndCityProvider.statesToDisplay[index];
                        return InkWell(
                          onTap: () {
                            stateAndCityProvider.changeSelectedState(state);
                            stateAndCityProvider.resetSearch();
                            Navigator.pop(context, true);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BodyTextPrimaryWithLineHeight(
                                    text: state.name,
                                    textColor: const Color(0xFF181C26),
                                    fontSize: 14,
                                    fontWeight: boldFont,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                      child: LongDivider(
                                          color:
                                              Color.fromRGBO(232, 233, 235, 1),
                                          height: 0.5)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          }));
    }),
  );
}

Future showStateSelectionModalWithAllOption(BuildContext importContext) {
  return modal.showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: importContext,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      final searchController = TextEditingController();
      return Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(modalRadius.r),
                topRight: Radius.circular(modalRadius.r)),
          ),
          constraints: BoxConstraints(
            minHeight: 300.h,
            maxHeight: 700.h,
          ),
          child: Consumer<StateAndCityProvider>(
              builder: (ctx, stateAndCityProvider, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 14.h),
                const PullDownIndicator(),
                SizedBox(height: 41.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(3, 31, 76, 0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 16.w,
                          ),
                          SvgPicture.asset(searchIcon),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: TextField(
                            controller: searchController,
                            autofocus: false,
                            autocorrect: false,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                stateAndCityProvider.searchForState(value);
                              } else {
                                stateAndCityProvider.resetSearch();
                              }
                            },
                            cursorColor: mainColor,
                            textInputAction: TextInputAction.search,
                            decoration: const InputDecoration(
                              hintText: "Search",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: textInputStyle(),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: stateAndCityProvider
                          .statesToDisplayWithAllOption.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final state = stateAndCityProvider
                            .statesToDisplayWithAllOption[index];
                        return InkWell(
                          onTap: () {
                            stateAndCityProvider.changeSelectedState(state);
                            Navigator.pop(context, true);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BodyTextPrimaryWithLineHeight(
                                    text: state.name,
                                    textColor: const Color(0xFF181C26),
                                    fontSize: 14,
                                    fontWeight: boldFont,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                      child: LongDivider(
                                          color:
                                              Color.fromRGBO(232, 233, 235, 1),
                                          height: 0.5)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: bottomPadding.h,
                ),
              ],
            );
          }));
    }),
  );
}
