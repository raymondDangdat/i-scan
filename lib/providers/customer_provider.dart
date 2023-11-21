import 'package:flutter/material.dart';

import '../model/customer_model.dart';

class CustomerProvider extends ChangeNotifier {
  final List<CustomerModel> _customerList = [];
  List<CustomerModel> get customerList => _customerList;

  CustomerModel? _selectedCustomerModel;
  CustomerModel? get selectedCustomerModel => _selectedCustomerModel;

  String _resMessage = "";
  String get resMessage => _resMessage;

  String? _selectedState;
  String? get selectedState => _selectedState;

  String? _selectedCountry;
  String? get selectedCountry => _selectedCountry;

  void addCustomer(CustomerModel customer) {
    _customerList.add(customer);
    notifyListeners();
  }

  void updateSelectedCustomer(CustomerModel customer) {
    _selectedCustomerModel = customer;
    notifyListeners();
  }

  void updateSelectedCountry(String country) {
    _selectedCountry = country;
    notifyListeners();
  }

  void updateSelectedState(String state) {
    _selectedState = state;
    notifyListeners();
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}

List<String> dummyCountries = [
  "UK",
];

List<String> dummyStates = [
  "England",
  "Scotland",
  "Wales",
  "Northern Ireland",
];
