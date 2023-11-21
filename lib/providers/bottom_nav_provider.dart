import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int newIndex) {
    debugPrint("The Selected Index before update is: $_selectedIndex");
    _selectedIndex = newIndex;
    debugPrint("The selected Index now is: $_selectedIndex");
    notifyListeners();
  }

  int _adminSelectedIndex = 0;
  int get adminSelectedIndex => _adminSelectedIndex;

  void updateAdminSelectedIndex(int newIndex) {
    debugPrint("The Selected Index before update is: $_selectedIndex");
    _adminSelectedIndex = newIndex;
    debugPrint("The selected Index now is: $_adminSelectedIndex");
    notifyListeners();
  }
}
