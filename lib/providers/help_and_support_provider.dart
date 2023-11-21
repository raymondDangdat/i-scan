import 'package:flutter/material.dart';

import '../model/chat_model.dart';
import '../model/faq_model.dart';

class HelpAndSupportProvider extends ChangeNotifier {
  FaqModel? _selectedFaq;
  FaqModel? get selectedFaq => _selectedFaq;

  final List<ChatModel> _chats = chatss;
  List<ChatModel> get chats => _chats;

  void addChat(ChatModel chat) {
    _chats.add(chat);
    notifyListeners();
  }

  void updateFaq(FaqModel? faq) {
    _selectedFaq = faq;
    notifyListeners();
  }
}
