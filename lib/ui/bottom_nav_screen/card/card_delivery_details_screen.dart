import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_snack_back.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/label_widget.dart';
import '../../../Widgets/modals/select_bank_modal.dart';
import '../../../Widgets/save_as_favourite_widget.dart';
import '../../../Widgets/textfields.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/banks_provider.dart';
import '../../../providers/send_money_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../Widgets/balance_left_widget.dart';

class CardDeliveryDetailScreen extends StatefulWidget {
  const CardDeliveryDetailScreen({Key? key}) : super(key: key);

  @override
  State<CardDeliveryDetailScreen> createState() =>
      _CardDeliveryDetailScreenState();
}

class _CardDeliveryDetailScreenState extends State<CardDeliveryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
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
                            text: sendMoney,
                            fontWeight: boldFont,
                            textColor: black,
                            fontSize: 18,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 130.w,
                                child: MainButton(
                                  accountNumber,
                                  () {
                                    sendMoneyProvider
                                        .updateIsSentToAccountNumber(true);
                                  },
                                  color: sendMoneyProvider.isSendToAccountNumber
                                      ? black
                                      : Colors.black
                                          .withOpacity(0.05000000074505806),
                                  textColor:
                                      sendMoneyProvider.isSendToAccountNumber
                                          ? white
                                          : black,
                                  fontSize: 12,
                                  border: 10,
                                  height: 35,
                                ),
                              ),
                              SizedBox(
                                width: 11.w,
                              ),
                              SizedBox(
                                width: 98.w,
                                child: MainButton(
                                  "#Username",
                                  () {
                                    sendMoneyProvider
                                        .updateIsSentToAccountNumber(false);
                                  },
                                  color:
                                      !sendMoneyProvider.isSendToAccountNumber
                                          ? black
                                          : Colors.black
                                              .withOpacity(0.05000000074505806),
                                  textColor:
                                      !sendMoneyProvider.isSendToAccountNumber
                                          ? white
                                          : black,
                                  fontSize: 12,
                                  border: 10,
                                  height: 35,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                          if (sendMoneyProvider.isSendToAccountNumber)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const LabelWidget(label: bank),
                                Consumer2<SendMoneyProvider, BanksProvider>(
                                    builder: (ctx, authProvider, bankProvider,
                                        child) {
                                  return CustomDropdownWithLabelButton(
                                      isRequired: false,
                                      text: bankProvider.selectedBank == null
                                          ? selectBank
                                          : bankProvider.selectedBank?.bankName,
                                      // : authProvider.selectedOccupation,
                                      label: bank,
                                      onTap: () {
                                        if (bankProvider
                                            .banksToDisplay.isEmpty) {
                                          bankProvider.getBanks();
                                        }
                                        showSelectBankBottomSheet(context);
                                      },
                                      textColor:
                                          bankProvider.selectedBank == null
                                              ? hintTextColor
                                              : mainColor
                                      // : black,
                                      );
                                }),
                                SizedBox(
                                  height: 20.h,
                                ),
                                const LabelWidget(label: accountNumber),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Consumer<BanksProvider>(
                                          builder: (ctx, bankProvider, child) {
                                        return CustomField(
                                          "1234567890",
                                          sendMoneyProvider
                                              .accountNumberController,
                                          enabled:
                                              bankProvider.selectedBank != null,
                                          isCapitalizeSentence: false,
                                          type: const TextInputType
                                              .numberWithOptions(signed: true),
                                          onChange: (value) {
                                            if (value != null &&
                                                value.isNotEmpty) {
                                              //  VALIDATE METER NUMBER
                                              if (value.length == 10) {
                                                bankProvider
                                                    .validateAccountNumber(
                                                        token: auth.hiveUserData
                                                                ?.token ??
                                                            "",
                                                        accountNumber: value);
                                              } else if (value.length < 10 ||
                                                  value.length > 10) {
                                                bankProvider
                                                    .resetAccountNameRetrieved();
                                              }
                                            } else {
                                              //  RESET PREVIOUS NAME
                                              bankProvider
                                                  .resetAccountNameRetrieved();
                                            }
                                          },
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                const LabelWidget(label: accountName),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomField(
                                        "John Doe",
                                        bankProvider.accountNameController,
                                        isCapitalizeSentence: false,
                                        enabled: false,
                                        type: const TextInputType
                                            .numberWithOptions(signed: true),
                                        borderColor: bankProvider
                                                .accountNameRetrieved.isNotEmpty
                                            ? const Color.fromRGBO(
                                                43, 147, 123, 1)
                                            : inputBorderColor,
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
                                        "1000",
                                        sendMoneyProvider.amountController,
                                        isCapitalizeSentence: false,
                                        type: const TextInputType
                                            .numberWithOptions(signed: true),
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
                          if (!sendMoneyProvider.isSendToAccountNumber)
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
                                        type: const TextInputType
                                            .numberWithOptions(signed: true),
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
                                        type: const TextInputType
                                            .numberWithOptions(signed: true),
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
