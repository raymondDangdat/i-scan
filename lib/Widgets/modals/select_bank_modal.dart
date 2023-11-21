import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../../Widgets/pull_down_indicator.dart';
import '../../../../../resources/constants/color_constants.dart';
import '../../providers/banks_provider.dart';
import '../../resources/constants/dimension_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/styles_manager.dart';
import '../custom_text.dart';

Future showSelectBankBottomSheet(BuildContext importedContext,
    {bool isTarget = true}) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    context: importedContext,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(modalRadius.r),
          topRight: Radius.circular(modalRadius.r)),
    ),
    builder: (BuildContext context) {
      final searchController = TextEditingController();
      return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Consumer<BanksProvider>(builder: (ctx, bankProvider, child) {
            return Container(
                margin: EdgeInsets.only(bottom: bottomPadding.h, top: 14.h),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(modalRadius.r),
                      topRight: Radius.circular(modalRadius.r)),
                ),
                child: Wrap(
                  children: <Widget>[
                    SizedBox(height: 14.h),
                    const Center(child: PullDownIndicator()),
                    SizedBox(
                      height: 19.h,
                    ),
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
                                offset:
                                    Offset(1, 1), // changes position of shadow
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
                                    bankProvider.searchForBank(value);
                                  } else {
                                    bankProvider.resetBankList();
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
                    bankProvider.gettingBanks
                        ? Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: 100.h, bottom: 100.h),
                              child: const CupertinoActivityIndicator(),
                            ),
                          )
                        : bankProvider.banksToDisplay.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 100.h, bottom: 100.h),
                                  child: const CustomTextWithLineHeight(
                                    text: "No Banks",
                                    textColor: Color(0xFF181C26),
                                    fontWeight: boldFont,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            : Container(
                                constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.7,
                                    minHeight:
                                        MediaQuery.of(context).size.height *
                                            0.2),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount:
                                          bankProvider.banksToDisplay.length,
                                      // physics: const NeverScrollableScrollPhysics(),
                                      // shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        final bank =
                                            bankProvider.banksToDisplay[index];
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: 11.h,
                                              left: horizontalPadding.w,
                                              right: horizontalPadding.w),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h,
                                                horizontal: 11.w),
                                            decoration: BoxDecoration(
                                                color: bankProvider.selectedBank
                                                            ?.bankName
                                                            .toString() ==
                                                        bank.bankName.toString()
                                                    ? mainColor
                                                    : white,
                                                borderRadius:
                                                    BorderRadius.circular(9.r)),
                                            child: InkWell(
                                              onTap: () {
                                                bankProvider
                                                    .updateSelectedBank(bank);
                                                bankProvider.resetBankList();
                                                Navigator.pop(context);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          BodyTextPrimaryWithLineHeight(
                                                            text: bank.bankName,
                                                            textColor: bankProvider
                                                                        .selectedBank ==
                                                                    bank
                                                                ? white
                                                                : black,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                semiBoldFont,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                        //   Padding(
                                        //   padding: EdgeInsets.only(
                                        //       bottom: 10.h,
                                        //     left: horizontalPadding.w
                                        //   ),
                                        //   child: InkWell(
                                        //     onTap: (){
                                        //       bankProvider.updateSelectedBank(bank);
                                        //       Navigator.pop(context, true);
                                        //     },
                                        //     child: Row(
                                        //       children: [
                                        //         CustomTextWithLineHeight(text: bank.bankName,
                                        //           textColor: const Color(0xFF181C26),
                                        //           fontWeight: boldFont, fontSize: 14,),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // );
                                      }),
                                ),
                              ),
                    SizedBox(
                      height: bottomPadding.h,
                    ),
                  ],
                ));
          }));
    },
  );
}
