import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../model/account_model.dart';
import '../providers/card_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/string_constants.dart';
import 'custom_text.dart';

Future showSelectAccountModal(
  BuildContext context,
) {
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      return Container(
        constraints: BoxConstraints(minHeight: 240.h, maxHeight: 300.h),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 18.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SemiBold16px(text: selectAnAccount),
                ],
              ),
              SizedBox(height: 31.h),
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      final account = accounts[index];
                      return InkWell(
                        onTap: () {
                          cardProvider.updateSelectedAccount(account);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 33.w),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BodyTextPrimaryWithLineHeight(
                                    text: account.accountName,
                                    textColor: black,
                                    fontWeight: boldFont,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  BodyTextPrimaryWithLineHeight(
                                    text: account.accountId,
                                    textColor: black,
                                    fontSize: 11,
                                  )
                                ],
                              )),
                              SizedBox(
                                width: 25.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                account.currencyLogo))),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  BodyTextLightWithLineHeight(
                                    text: account.currencyName,
                                    textColor:
                                        const Color.fromRGBO(18, 19, 19, 1),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          );
        }),
      );
    }),
  );
}
