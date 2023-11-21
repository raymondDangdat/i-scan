import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/styles_manager.dart';

class CardPINInputFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool obscureText;
  final StreamController<ErrorAnimationType> errorController;
  const CardPINInputFieldWidget(
      {Key? key,
      required this.textEditingController,
      required this.errorController,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      obscureText: obscureText,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      cursorColor: mainColor,
      obscuringCharacter: "•",
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        inactiveColor: const Color.fromRGBO(211, 212, 215, 1),
        errorBorderColor: red,
        activeColor: const Color.fromRGBO(211, 212, 215, 1),
        selectedColor: const Color.fromRGBO(211, 212, 215, 1),
        selectedFillColor: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        fieldHeight: 50.h,
        fieldWidth: 80.w,
        inactiveFillColor: Colors.transparent,
        activeFillColor: Colors.transparent,
      ),
      textStyle: getCustomTextStyle(
          fontSize: 24,
          textColor: const Color.fromRGBO(100, 103, 115, 1),
          fontWeight: boldFont),
      animationDuration: const Duration(milliseconds: 300),
      errorAnimationController: errorController,
      controller: textEditingController,
      onCompleted: (v) async {},
      onChanged: (value) {},
      beforeTextPaste: (text) {
        // print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      appContext: context,
    );
  }
}
