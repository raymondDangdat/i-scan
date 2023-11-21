import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../resources/constants/color_constants.dart';
import '../resources/constants/string_constants.dart';

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}

var moneyFormat = NumberFormat('#,###,000');
final DateFormat formatter = DateFormat.yMMMd();

String returnAmount({required String amount}) {
  String trimmedAmount = amount.replaceAll(".00", "");
  return double.parse(trimmedAmount) < 100
      ? trimmedAmount
      : moneyFormat.format(double.parse(trimmedAmount));
}

String returnAmountWithoutDecimals({required String amount}) {
  return double.parse(amount.replaceAll(".00", "")).toString();
}

String returnTransactionTitle({required String subType, required String type}) {
  return subType == telcoSubType
      ? "You made top up"
      : subType == televisionSubType
          ? "Television subscription"
          : subType == electricityTransactionSubType
              ? "Electricity bills"
              : subType == interAccountSubType
                  ? "Inter Account Transfer"
                  : "Not specified";
}

Color returnTransactionStatusColor({required String status}) {
  return status == "success"
      ? savingsDeepGreenColor
      : const Color.fromRGBO(250, 183, 53, 1);
}

final numbersOnlyFormat = [
  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
];

final noSpecialCharacters = [
  FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9]")),
];
