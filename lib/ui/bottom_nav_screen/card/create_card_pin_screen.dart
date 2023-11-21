import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_scan/ui/bottom_nav_screen/card/widgets/card_pin_input_fied_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_snack_back.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/title_widget.dart';
import '../../../providers/card_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';
import 'widgets/modals/preview_payment_for_virtual_card_modal.dart';
import 'widgets/virtual_card_gradient_widget.dart';

class CreateCardPINScreen extends StatefulWidget {
  const CreateCardPINScreen({Key? key}) : super(key: key);

  @override
  State<CreateCardPINScreen> createState() => _CreateCardPINScreenState();
}

class _CreateCardPINScreenState extends State<CreateCardPINScreen> {
  late StreamController<ErrorAnimationType> pinErrorController;
  final TextEditingController pinTextEditingController =
      TextEditingController();
  final TextEditingController confirmPinTextEditingController =
      TextEditingController();
  late TapGestureRecognizer pinOnTapRecognizer;

  late StreamController<ErrorAnimationType> confirmPinErrorController;

  late TapGestureRecognizer confirmPinOnTapRecognizer;

  @override
  void initState() {
    pinOnTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        // Navigator.pop(context);
      };

    confirmPinOnTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        // Navigator.pop(context);
      };

    confirmPinErrorController = StreamController<ErrorAnimationType>();
    pinErrorController = StreamController<ErrorAnimationType>();

    super.initState();
  }

  @override
  void dispose() {
    pinErrorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
      return Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(16.r),
                      image: const DecorationImage(
                          image: NetworkImage(cardEmptyStateBgUrl),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 58.h, bottom: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const VirtualCardGradientWidget(
                          gradientColors: [
                            Color.fromRGBO(255, 120, 193, 1),
                            Color.fromRGBO(252, 219, 45, 1)
                          ],
                          verticalPadding: 4,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        const TitleWidget(
                          title: createAPIN,
                          textColor: Color.fromRGBO(211, 212, 215, 1),
                          fontSize: 32,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        BodyTextLightWithLineHeight(
                          text: makeSureItsASequenceYouWillRemember,
                          textColor: Colors.white.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        const TitleWidget(
                          title: "****",
                          fontSize: 32,
                          textColor: white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 42.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyTextPrimaryWithLineHeight(
                      text: "Create Card 4-digit PIN",
                      fontSize: 12,
                      fontWeight: mediumFont,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CardPINInputFieldWidget(
                      textEditingController: pinTextEditingController,
                      errorController: pinErrorController,
                      obscureText: cardProvider.obscurePIN,
                    ),
                    InkWell(
                      onTap: () {
                        cardProvider.toggleObscurePIN();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(viewPinEyesImg),
                          SizedBox(
                            width: 5.w,
                          ),
                          BodyTextLightWithLineHeight(
                            text: !cardProvider.obscurePIN
                                ? tapToHideNumbers
                                : tapToSeeNumbers,
                            textColor: const Color(0xFF2D5AFC),
                            fontSize: 12,
                            fontWeight: mediumFont,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const BodyTextPrimaryWithLineHeight(
                      text: "Confirm Card 4-digit PIN",
                      fontSize: 12,
                      fontWeight: mediumFont,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CardPINInputFieldWidget(
                      textEditingController: confirmPinTextEditingController,
                      errorController: confirmPinErrorController,
                      obscureText: cardProvider.obscureConfirmPIN,
                    ),
                    InkWell(
                      onTap: () {
                        cardProvider.toggleObscurePIN(isPIN: false);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(viewPinEyesImg),
                          SizedBox(
                            width: 5.w,
                          ),
                          BodyTextLightWithLineHeight(
                            text: !cardProvider.obscureConfirmPIN
                                ? tapToHideNumbers
                                : tapToSeeNumbers,
                            textColor: const Color(0xFF2D5AFC),
                            fontSize: 12,
                            fontWeight: mediumFont,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: MainButton(
                  proceedAndPay,
                  () {
                    if (pinTextEditingController.text.length == 4 &&
                        pinTextEditingController.text ==
                            confirmPinTextEditingController.text) {
                      showPreviewPaymentForVirtualCardModal(context);
                    } else {
                      customSnackBar(
                          context, "Enter a valid PIN and confirm it");
                    }
                  },
                  border: 18,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
