import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;
import 'package:provider/provider.dart';
import '../../../../providers/bill_payment_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../Widgets/pull_down_indicator.dart';
import '../../providers/auth_provider.dart';
import '../../resources/constants/image_constant.dart';
import '../custom_text.dart';

Future billPlanModal(
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
          child: Consumer<BillPaymentProvider>(
              builder: (ctx, billPaymentProvider, child) {
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
                                billPaymentProvider
                                    .searchForBillProvider(value);
                              } else {
                                billPaymentProvider.resetBillProviders();
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
                billPaymentProvider.gettingProducts
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : billPaymentProvider.billProducts.isEmpty
                        ? const CustomTextWithLineHeight(
                            text: "No Data Plans",
                            textColor: Color(0xFF181C26),
                            fontWeight: boldFont,
                            fontSize: 14,
                          )
                        : Expanded(
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount:
                                    billPaymentProvider.billProducts.length,
                                // physics: const NeverScrollableScrollPhysics(),
                                // shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final provider =
                                      billPaymentProvider.billProducts[index];
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 32.h),
                                    child: Consumer<AuthProvider>(
                                        builder: (ctx, authProvider, child) {
                                      return InkWell(
                                        onTap: () {
                                          billPaymentProvider
                                              .updateSelectedBillPlan(provider);
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 16.w,
                                            ),
                                            CustomTextWithLineHeight(
                                              text: provider.name,
                                              textColor:
                                                  const Color(0xFF181C26),
                                              fontWeight: boldFont,
                                              fontSize: 14,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
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
