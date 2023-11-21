import 'package:flutter/material.dart';

import '../resources/constants/color_constants.dart';

class TxtStyles {
  static TextStyle title12() {
    return const TextStyle(
      color: Color(0xff121213),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle title24({Color color = black}) {
    return const TextStyle(
      color: black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle title12SemiboldFont({Color color = mainColor}) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle title14({Color color = black}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle title18({Color color = mainColor}) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle subtitle12(
      {Color color = black, FontWeight fontWeight = FontWeight.w600}) {
    return TextStyle(color: color, fontSize: 12, fontWeight: fontWeight);
  }

  static TextStyle subtitle14({Color color = subTitle14TextColor}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle title16() => const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
}
