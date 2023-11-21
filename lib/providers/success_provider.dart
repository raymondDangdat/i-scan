import 'package:flutter/material.dart';

class SuccessProvider extends ChangeNotifier {
  String _title = "";
  String get title => _title;

  String _buttonText = "Proceed";
  String get buttonText => _buttonText;

  String _subTitle = "";
  String get subTitle => _subTitle;

  double _successTitleWidth = 267;
  double get successTitleWidth => _successTitleWidth;

  double _successSubTitleWidth = 228;
  double get successSubTitleWidth => _successSubTitleWidth;

  void updateTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void updateButtonText(String title) {
    _buttonText = title;
    notifyListeners();
  }

  void updateSuccessTitleWidth(double value) {
    _successTitleWidth = value;
    notifyListeners();
  }

  void updateSuccessSubtitleWidth(double value) {
    _successSubTitleWidth = value;
    notifyListeners();
  }

  void updateSubTitle(String title) {
    _subTitle = title;
    notifyListeners();
  }
}
