import 'package:flutter/material.dart';

class WithdrawalProvider extends ChangeNotifier {
  final beneficiaryAccountController = TextEditingController();
  final beneficiaryAccountNameController = TextEditingController();
  final amountController = TextEditingController();
  final narrationController = TextEditingController();
}
