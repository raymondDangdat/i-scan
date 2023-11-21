import 'dart:async';

import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  bool _showEuroBalance = true;
  bool get showEuroBalance => _showEuroBalance;

  bool _showBalance = true;
  bool get showBalance => _showBalance;

  double _containerHeight = 64;
  double get containerHeight => _containerHeight;

  bool _completedCountdown = false;
  bool get completedCountdown => _completedCountdown;

  bool _wrappedApps = false;
  bool get wrappedApps => _wrappedApps;

  void toggleExpandApps() {
    if (!_completedCountdown) {
      _containerHeight = 536;
      notifyListeners();
    } else {
      _containerHeight = 64;
      notifyListeners();
    }
    _completedCountdown = !_completedCountdown;
    notifyListeners();
  }

  Timer? countdownTimer;
  Duration myDuration = const Duration(microseconds: 0);

  bool showOTPSent = false;
  bool showLoaderOnButton = false;

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    _wrappedApps = !_wrappedApps;
    if (_wrappedApps) {
      _containerHeight = 536;
      notifyListeners();
    } else {
      _containerHeight = 64;
      notifyListeners();
    }
    countdownTimer = Timer.periodic(
        const Duration(microseconds: 100000), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    _completedCountdown = !_completedCountdown;
    notifyListeners();
    countdownTimer!.cancel();
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    myDuration = const Duration(microseconds: 0);
  }

  // Step 6
  void setCountDown() {
    const increaseMicrosecondBy = 100000;
    final microsecond = myDuration.inMicroseconds + increaseMicrosecondBy;
    if (microsecond == 400000) {
      resetTimer();
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(microseconds: microsecond);
      debugPrint("Timer: ${myDuration.inMicroseconds}");
    }
  }

  String _resMessage = "";
  String get resMessage => _resMessage;

  void updateWalletBalanceToShow(bool newValue) {
    _showEuroBalance = newValue;
    notifyListeners();
  }

  void toggleShowBalance() {
    _showBalance = !_showBalance;
    notifyListeners();
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}
