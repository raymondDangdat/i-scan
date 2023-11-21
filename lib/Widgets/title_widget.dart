import 'package:flutter/material.dart';
import '../../../Widgets/custom_text.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  const TitleWidget(
      {Key? key,
      required this.title,
      this.textColor = black,
      this.fontSize = 18,
      this.fontWeight = boldFont})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SemiBold20px(
      text: title,
      fontSize: fontSize,
      fontWeight: fontWeight,
      textColor: textColor,
    );
  }
}
