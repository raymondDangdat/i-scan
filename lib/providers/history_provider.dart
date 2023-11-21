import 'package:flutter/material.dart';

import '../model/transactions_model.dart';

class HistoryProvider extends ChangeNotifier {
  int _selectedCategoryIndex = 0;
  int get selectedCategoryIndex => _selectedCategoryIndex;

  List<Transaction> _transactionHistoryDisplay = transactionItems;
  List<Transaction> get transactionHistoriesDisplay =>
      _transactionHistoryDisplay;

  String _resMessage = "";
  String get resMessage => _resMessage;

  String _selectedCategory = "All";
  String get selectedCategory => _selectedCategory;

  void updateSelectedCategoryIndex(int newValue) {
    _selectedCategoryIndex = newValue;
    notifyListeners();
  }

  void updateSelectedCategory(String newValue) {
    _selectedCategory = newValue;
    notifyListeners();
  }

  void filterHistory(String category) {
    if (category == "All") {
      _transactionHistoryDisplay.addAll(transactionItems);
      notifyListeners();
    } else {
      _transactionHistoryDisplay = transactionItems
          .where((transaction) => transaction.category == category)
          .toList();
      notifyListeners();
    }
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}

List<String> historyCategories = [
  "All",
  "Money in",
  "Money out",
];

List<String> trackingStagesList = [
  "All",
  "Pending",
  "Delivered",
  "Canceled",
];
