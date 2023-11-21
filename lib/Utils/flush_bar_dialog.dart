import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../Widgets/custom_text.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';

Future showFlushbar(BuildContext context, String title, String message,
    {Color bgColor = cardColor, Color textColor = lightBlueTextColor}) {
  return Flushbar(
    backgroundColor: bgColor,
    borderRadius: BorderRadius.circular(6),
    titleText: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: 24,
        child: CustomText(
          text: title,
          fontSize: 16,
          textColor: textColor,
          fontWeight: mediumFont,
        ),
      ),
    ),
    messageText: SizedBox(
      height: 22,
      child: CustomText(text: message, fontSize: 14, fontWeight: regularFont),
    ),
    duration: const Duration(seconds: 5),
    flushbarPosition: FlushbarPosition.TOP,
    maxWidth: 328,
    margin: const EdgeInsets.only(top: 10),
  ).show(context);
}
