import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/ui/bottom_nav_screen/send_money/hash_payment_screen/web_hash_payment_id_created_screeb.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/string_constants.dart';
import '../../../../resources/navigation_utils.dart';
import '../../../global/confirm_transaction_pin.dart';

class WebHashPaymentSummaryScreen extends StatefulWidget {
  const WebHashPaymentSummaryScreen({Key? key}) : super(key: key);

  @override
  State<WebHashPaymentSummaryScreen> createState() =>
      _WebHashPaymentSummaryScreenState();
}

class _WebHashPaymentSummaryScreenState
    extends State<WebHashPaymentSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          // top: false,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IScanAppBar(
                title: "",
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleWidget(
                      title: hashPayment,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const BodyTextPrimaryWithLineHeight(
                      text: payWithoutADebitCardOnAnuLocalPAymentGateway,
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.only(left: 16.w, right: 16.h, top: 18.h),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(13.r)),
                      child: Column(
                        children: [
                          const ItemWidget(label: "From:", value: "0028462468"),
                          SizedBox(
                            height: 18.h,
                          ),
                          const ItemWidget(
                              label: "Transaction Fee:",
                              value: "$nairaSign 0.0"),
                          SizedBox(
                            height: 18.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.only(left: 16.w, right: 16.h, top: 18.h),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(13.r)),
                      child: Column(
                        children: [
                          const ItemWidget(
                              label: "Description:", value: "Web Payment"),
                          SizedBox(
                            height: 18.h,
                          ),
                          const ItemWidget(label: "For:", value: "Pay ID"),
                          SizedBox(
                            height: 18.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: MainButton(continueTo, () async {
                  bool confirmPin = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ConfirmTransactionPINScreen()));
                  debugPrint("PIN CONFIRMED: $confirmPin");
                  if (mounted && confirmPin) {
                    navToWithScreenName(
                        context: context,
                        screen: const WebHashPaymentCreatedScreenScreen());
                    // navTo(
                    //     context: context,
                    //     path: Routes.webHashPaymentIdCreatedScreen);
                  }
                }),
              ),
              SizedBox(
                height: bottomPadding.h,
              ),
            ],
          )),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String label;
  final String value;
  const ItemWidget({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BodyTextPrimaryWithLineHeight(
          text: label,
          fontSize: 12,
          textColor: faintTextColor,
        ),
        BodyTextPrimaryWithLineHeight(
          text: value,
          fontSize: 14,
          fontWeight: boldFont,
          textColor: black,
        ),
      ],
    );
  }
}
