import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/balance_left_widget.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/constant_widgets.dart';
import '../../../../Widgets/custom_snack_back.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/label_widget.dart';
import '../../../../Widgets/save_as_favourite_widget.dart';
import '../../../../Widgets/textfields.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/banks_provider.dart';
import '../../../../providers/send_money_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class ScanPayScreen extends StatefulWidget {
  const ScanPayScreen({Key? key}) : super(key: key);

  @override
  State<ScanPayScreen> createState() => _ScanPayScreenState();
}

class _ScanPayScreenState extends State<ScanPayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor2,
      body: SafeArea(
          bottom: false,
          child: Consumer3<SendMoneyProvider, AuthProvider, BanksProvider>(
              builder: (ctx, sendMoneyProvider, auth, bankProvider, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (bankProvider.resMessage != '') {
                customSnackBar(context, bankProvider.resMessage);

                ///Clear the response message to avoid duplicate
                bankProvider.clear();
              }
            });
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopPadding(),
                const IScanAppBar(
                  title: "",
                ),
                SizedBox(
                  height: 21.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWithLineHeight(
                            text: scanPay,
                            fontWeight: boldFont,
                            textColor: black,
                            fontSize: 18,
                          ),
                          SizedBox(
                            height: 26.h,
                          ),
                          CustomContainerButton(
                            onTap: () {},
                            title: "",
                            borderRadius: 13,
                            verticalPadding: 20.h,
                            widget: Column(
                              children: [
                                SizedBox(
                                  height: 65.w,
                                  width: 145.w,
                                  child: Image.asset(scanPayImg),
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const TitleWidget(
                                      title: "Pay, ",
                                      fontSize: 20,
                                    ),
                                    const TitleWidget(
                                      title: "#",
                                      fontSize: 20,
                                      textColor:
                                          Color.fromRGBO(50, 51, 53, 0.29),
                                    ),
                                    TitleWidget(
                                      title: sendMoneyProvider
                                          .usernameController.text,
                                      fontSize: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const LabelWidget(label: "Username"),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomField(
                                      "#",
                                      sendMoneyProvider.usernameController,
                                      isCapitalizeSentence: false,
                                      enabled: false,
                                      type:
                                          const TextInputType.numberWithOptions(
                                              signed: true),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                          left: 16.w,
                                          top: 10.h,
                                        ),
                                        child:
                                            const BodyTextPrimaryWithLineHeight(
                                                text: "#"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LabelWidget(label: "Amount"),
                                  BalanceLeftWidget(),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomField(
                                      "",
                                      sendMoneyProvider.amountController,
                                      isCapitalizeSentence: false,
                                      type:
                                          const TextInputType.numberWithOptions(
                                              signed: true),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const LabelWidget(label: paymentNarration),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomField(
                                      "",
                                      sendMoneyProvider
                                          .paymentNarrationController,
                                      type: TextInputType.text,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SaveAsFavouriteWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: MainButton(next, () {
                    if (sendMoneyProvider.isSendToAccountNumber) {
                      //  validate send to account number
                      if (bankProvider.selectedBank == null) {
                        customSnackBar(context, "Select a bank");
                      } else if (sendMoneyProvider
                              .accountNumberController.text.length <
                          10) {
                        customSnackBar(context, "Enter a valid account number");
                      } else if (bankProvider
                          .accountNameController.text.isEmpty) {
                        customSnackBar(
                            context, "Could not validate this account number");
                      } else if (sendMoneyProvider
                              .amountController.text.isEmpty ||
                          double.parse(
                                  sendMoneyProvider.amountController.text) <
                              1) {
                        customSnackBar(context, "Enter a valid amount");
                      } else {}
                    } else {
                      if (sendMoneyProvider.usernameController.text.length <
                          3) {
                        customSnackBar(context, "Enter a valid username");
                      } else if (sendMoneyProvider
                              .amountController.text.isEmpty ||
                          double.parse(
                                  sendMoneyProvider.amountController.text) <
                              1) {
                        customSnackBar(context, "Enter a valid amount");
                      } else if (sendMoneyProvider
                              .paymentNarrationController.text.length <
                          3) {
                        customSnackBar(
                            context, "Enter a valid payment narration");
                      } else {}
                    }
                  }),
                ),
                SizedBox(
                  height: bottomPadding.h,
                ),
              ],
            );
          })),
    );
  }
}
