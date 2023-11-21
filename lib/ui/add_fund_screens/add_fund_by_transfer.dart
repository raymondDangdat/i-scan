import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../Utils/functions.dart';
import '../../Widgets/custom_text.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';

class AddFundByBankTransferScreen extends StatefulWidget {
  const AddFundByBankTransferScreen({Key? key}) : super(key: key);

  @override
  State<AddFundByBankTransferScreen> createState() =>
      _AddFundByBankTransferScreenState();
}

class _AddFundByBankTransferScreenState
    extends State<AddFundByBankTransferScreen> {
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
                      text: "Add By Transfer",
                      fontWeight: boldFont,
                      textColor: black,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextWithLineHeight(
                      text: useTheDetailsBelowToSendMoney,
                      fontWeight: mediumFont,
                      textColor: Colors.black.withOpacity(0.5799999833106995),
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(13.r)),
                      padding: EdgeInsets.only(
                        top: 28.h,
                        left: 23.w,
                        right: 23.w,
                        bottom: 35.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 76.h,
                              width: 76.h,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(bankTransferIconRounded),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          InfoItem(
                              label: bank, text: "Hashit Bank", onTap: () {}),
                          SizedBox(
                            height: 18.h,
                          ),
                          InfoItem(
                              label: accountNumber,
                              text: "0028462468",
                              onTap: () {
                                copyToClipboard("0028462468");
                              }),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomTextWithLineHeight(
                                text: tapOnAccountNumberToCopy,
                                fontWeight: mediumFont,
                                textColor: Colors.black
                                    .withOpacity(0.47999998927116394),
                                fontSize: 12,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          InfoItem(
                              label: accountName,
                              text: "Nelson Steve",
                              onTap: () {}),
                        ],
                      ),
                    ),
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

class InfoItem extends StatelessWidget {
  final String label;
  final String text;
  final VoidCallback onTap;
  const InfoItem(
      {Key? key, required this.label, required this.text, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWithLineHeight(
          text: label,
          fontWeight: mediumFont,
          textColor: Color(0xFF9C9C9C),
          fontSize: 15,
        ),
        SizedBox(
          height: 5.h,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: Colors.black.withOpacity(0.029999999329447746)),
            padding: EdgeInsets.all(10.r),
            child: Row(
              children: [
                CustomTextWithLineHeight(
                  text: text,
                  fontWeight: boldFont,
                  textColor: Color(0xFF282828),
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
