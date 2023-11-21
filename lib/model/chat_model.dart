import 'dart:io';

class ChatModel {
  final String message;
  final bool isReply;
  final String dateSent;
  final bool isImage;
  final File? file;

  ChatModel(
      {required this.message,
      this.isReply = false,
      this.isImage = false,
      this.file,
      required this.dateSent});
}

List<ChatModel> chatss = [
  ChatModel(
      message:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Venenatis nisl enim quam curabitur faucibus amet magnis.",
      dateSent: "12:36AM"),
  ChatModel(
      message:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Venenatis nisl enim quam curabitur faucibus amet magnis.",
      dateSent: "12:36AM",
      isReply: true)
];
