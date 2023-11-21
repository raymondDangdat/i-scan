import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  /*
  0. Main Dashboard
  1. Mobile top up screen
  2. Send Money
  3. Pay A Bill screen
  4. Earning Screen
  5. Marketplace screen
  6. Advert Screen
  7. Giveaway screen
   */

  int _homeScreenCurrentIndex = 0;
  int get homeScreenCurrentIndex => _homeScreenCurrentIndex;

  void updateHomeScreenCurrentIndex(int value) {
    _homeScreenCurrentIndex = value;
    notifyListeners();
  }

  String _resMessage = "";
  String get resMessage => _resMessage;

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}
