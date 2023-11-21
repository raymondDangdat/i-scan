import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactToDisplay {
  final dynamic phoneNumber;
  final dynamic boldTag;
  final dynamic displayName;
  final dynamic status;
  final dynamic isRewarded;
  final dynamic userId;
  final dynamic hasShared;

  ContactToDisplay({
    required this.phoneNumber,
    this.boldTag = "No Tag",
    required this.displayName,
    this.userId = "",
    required this.status,
    this.isRewarded = false,
    this.hasShared,
  });
}

class ContactProvider extends ChangeNotifier {
  ///Setter
  final bool _isLoading = false;
  String _resMessage = '';

  List<String> phoneNumbers = [];

  final searchContactController = TextEditingController();

  List<ContactToDisplay> _newContactsToDisplay = [];
  List<ContactToDisplay> get newContactsToDisplay => _newContactsToDisplay;

  final List<ContactToDisplay> _reservedContacts = [];
  List<ContactToDisplay> get reservedContacts => _reservedContacts;

  bool _showRecentSent = true;
  bool get showRecentSent => _showRecentSent;

  void updateShowRecentSent(bool option) {
    _showRecentSent = option;
    notifyListeners();
  }

  List<Contact> screenedContacts = [];

  ContactToDisplay? _selectedBoldContact;
  ContactToDisplay get selectedBoldContact => _selectedBoldContact!;

  //Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  Contact? _selectedContact;
  Contact? get selectedContact => _selectedContact;

  List<Contact> _contactsToDisplay = [];
  List<Contact> get contactsToDisplay => _contactsToDisplay;

  int _bCrValue = 0;
  int get bCrValue => _bCrValue;

  set bCrValue(int newValue) {
    _bCrValue = newValue;
    notifyListeners();
  }

  bool _loadingContacts = false;
  bool get loadingContacts => _loadingContacts;

  Future<void> getContacts() async {
    _loadingContacts = true;
    notifyListeners();
    _contacts = [];
    notifyListeners();
    if (await FlutterContacts.requestPermission()) {
      _contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: false);

      _contactsToDisplay.addAll(_contacts);
      debugPrint("============");
      notifyListeners();
    }

    _loadingContacts = false;
    notifyListeners();
  }

  Future<void> screenContacts() async {
    for (int i = 0; i < _contacts.length; i++) {
      if (_contacts[i].phones.isEmpty) {
        // Skip
        debugPrint(
            "===========Contact to be removed: ${_contacts[i]}==================");
        _contacts.removeAt(i);
      } else {
        debugPrint("Good contact to add: ${_contacts[i]}==================");
        screenedContacts.add(_contacts[i]);
      }
    }
    notifyListeners();
    debugPrint("Screened contacts: ${_contacts.length}");
  }

  void updateSelectedBoldContact(ContactToDisplay selection) {
    _selectedBoldContact = selection;
    notifyListeners();
  }

  void updateSelectedContact(Contact contact) {
    _selectedContact = contact;
    notifyListeners();
  }

  void searchContacts(String name) {
    debugPrint("Searching Contacts:::: $name");
    _newContactsToDisplay = _reservedContacts
        .where((contact) =>
            contact.displayName.toLowerCase().contains(name.toLowerCase()) ||
            contact.boldTag.toLowerCase().contains(name.toLowerCase()))
        .toList();

    _contactsToDisplay = _contacts
        .where((contact) =>
            contact.displayName.toLowerCase().contains(name.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void resetContacts() {
    _contactsToDisplay = [];
    _contactsToDisplay.addAll(_contacts);
    searchContactController.text = "";
    notifyListeners();
  }

  void clear() {
    _resMessage = "";
    // _isLoading = false;
    notifyListeners();
  }
}
