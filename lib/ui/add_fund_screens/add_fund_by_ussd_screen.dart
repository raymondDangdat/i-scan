import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../Utils/functions.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/long_divider.dart';
import '../../Widgets/textfields.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';

class AddFundByUSSDScreen extends StatefulWidget {
  const AddFundByUSSDScreen({Key? key}) : super(key: key);

  @override
  State<AddFundByUSSDScreen> createState() => _AddFundByUSSDScreenState();
}

class _AddFundByUSSDScreenState extends State<AddFundByUSSDScreen> {
  final amountController = TextEditingController();
  String amount = "000";

  @override
  void initState() {
    // amountController.text = "000";
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopPadding(),
          const IScanAppBar(
            title: "",
          ),
          SizedBox(
            height: 26.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWithLineHeight(
                      text: addByUssd,
                      fontWeight: boldFont,
                      textColor: black,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextWithLineHeight(
                      text: typeInTheTheAmountYouWantToAdd,
                      fontWeight: mediumFont,
                      textColor: Colors.black.withOpacity(0.5799999833106995),
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    const CustomTextWithLineHeight(
                      text: amountToFund,
                      fontWeight: mediumFont,
                      textColor: Color(0xFF333333),
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomField(
                            "NGN 0.00",
                            amountController,
                            isCapitalizeSentence: false,
                            type: const TextInputType.numberWithOptions(
                                signed: true),
                            borderColor: white,
                            onChange: (value) {
                              setState(() {
                                if (value != null && value.isNotEmpty) {
                                  amount = value;
                                } else {
                                  amount = "000";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CustomContainerButton(
                      verticalPadding: 11,
                      horizontalPadding: 20,
                      borderRadius: 10,
                      bgColor: black,
                      onTap: () {},
                      title: "",
                      widget: Row(
                        children: [
                          CustomTextWithLineHeight(
                            alignCenter: true,
                            text: "Or copy account number",
                            fontWeight: mediumFont,
                            textColor:
                                Colors.white.withOpacity(0.9100000262260437),
                            fontSize: 13,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Icon(
                            Iconsax.document_copy,
                            color: white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const CustomTextWithLineHeight(
                            text: "0028462468",
                            fontWeight: boldFont,
                            textColor: white,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 41.h,
                    ),
                    OptionItem(
                      bankLogo: gtLogo,
                      bankName: "GTBank",
                      ussdCode: "737",
                      amount: amount,
                      onTap: () {
                        copyToClipboard("*737*$amount*0028462468#");
                      },
                    ),
                    OptionItem(
                        bankLogo: gtLogo,
                        bankName: "Zenith Bank",
                        ussdCode: "966",
                        amount: amount,
                        onTap: () {
                          copyToClipboard("*966*$amount*0028462468#");
                        }),
                    OptionItem(
                        bankLogo: gtLogo,
                        bankName: "Wema Bank",
                        ussdCode: "945",
                        amount: amount,
                        onTap: () {
                          copyToClipboard("*945*$amount*0028462468#");
                        }),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          )
        ],
      )),
    );
  }
}

class OptionItem extends StatelessWidget {
  final String bankLogo;
  final String bankName;
  final String ussdCode;
  final String amount;
  final VoidCallback onTap;
  const OptionItem(
      {Key? key,
      required this.bankLogo,
      required this.bankName,
      required this.ussdCode,
      required this.amount,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46.h,
                height: 46.h,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(bankLogo),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWithLineHeight(
                    text: bankName,
                    fontWeight: mediumFont,
                    textColor: const Color(0xFF718096),
                    fontSize: 11,
                  ),
                  CustomTextWithLineHeight(
                    text: "*$ussdCode*$amount*0028462468#",
                    fontWeight: boldFont,
                    textColor: const Color(0xFF1A202C),
                    fontSize: 18,
                  ),
                ],
              )),
              InkWell(
                  onTap: onTap,
                  child: const Icon(
                    Iconsax.document_copy,
                    color: black,
                    size: 20,
                  )),
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
          const LongDivider(),
          SizedBox(
            height: 23.h,
          ),
        ],
      ),
    );
  }
}
