import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;
import 'package:provider/provider.dart';
import '../../Utils/constants.dart';
import '../../providers/airtime_and_data_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/dimension_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/styles_manager.dart';
import '../custom_text.dart';
import '../pull_down_indicator.dart';

Future dataPackageModal(
  BuildContext importContext,
) {
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
          child: Consumer<AirtimeAndDataProvider>(
              builder: (ctx, airtimeAndDataProvider, child) {
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
                        borderRadius: BorderRadius.circular(50.r),
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
                                airtimeAndDataProvider
                                    .searchForDataPackages(value);
                              } else {
                                airtimeAndDataProvider.resetDataPackages();
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
                SizedBox(
                  height: 48.h,
                ),
                airtimeAndDataProvider.gettingProducts
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : airtimeAndDataProvider.dataPackagesToDisplay.isEmpty
                        ? const CustomTextWithLineHeight(
                            text: "No Data Plans",
                            textColor: Color(0xFF181C26),
                            fontWeight: boldFont,
                            fontSize: 14,
                          )
                        : Expanded(
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: airtimeAndDataProvider
                                    .dataPackagesToDisplay.length,
                                // physics: const NeverScrollableScrollPhysics(),
                                // shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final dataPlan = airtimeAndDataProvider
                                      .dataPackagesToDisplay[index];
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 32.h),
                                    child: InkWell(
                                      onTap: () {
                                        airtimeAndDataProvider
                                            .updateSelectedPackage(dataPlan);
                                        Navigator.pop(context, true);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomTextWithLineHeight(
                                            text:
                                                "${dataPlan.meta.currency}${moneyFormat.format(double.parse(dataPlan.meta.fee ?? "0000"))} for ${dataPlan.meta.dataValue} ${dataPlan.meta.dataExpiry}",
                                            textColor: const Color(0xFF181C26),
                                            fontWeight: boldFont,
                                            fontSize: 14,
                                          ),
                                        ],
                                      ),
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
