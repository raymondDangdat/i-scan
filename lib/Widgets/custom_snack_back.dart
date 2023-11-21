import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../resources/constants/color_constants.dart';

void customSnackBar(BuildContext context, String message) {
  return showTopSnackBar(
    context,
    CustomSnackBar.info(
      message: message,
      icon: Container(),
      backgroundColor: mainColor,
    ),
  );
}
