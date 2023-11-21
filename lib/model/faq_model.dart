class FaqModel {
  final String category;
  final String title;
  final String answer;
  final String dateAnswered;

  FaqModel({
    required this.category,
    required this.title,
    required this.answer,
    required this.dateAnswered,
  });
}

List<FaqModel> faqsList = [
  FaqModel(
      category: "Resolving Common Errors",
      title: "Creating and Upgrading Account",
      answer: "",
      dateAnswered: "17th December 2022"),
  FaqModel(
      category: "Resolving Common Errors",
      title: "Failed Face Verification",
      answer: "",
      dateAnswered: "17th December 2022"),
  FaqModel(
      category: "Resolving Common Errors",
      title: "OTP Difficulties in setting up account",
      answer: "",
      dateAnswered: "17th December 2022"),
  FaqModel(
      category: "Resolving Common Errors",
      title: "I’m having issues verifying my IDs",
      answer: "I’m having issues verifying my IDs",
      dateAnswered: "17th December 2022"),
  FaqModel(
      category: "Failed Transfer",
      title: "Transfer Failure",
      answer: "I’m having issues verifying my IDs",
      dateAnswered: "17th December 2022"),
  FaqModel(
      category: "How-To",
      title: "Contact Support",
      answer: "",
      dateAnswered: "17th December 2022"),
  FaqModel(
      category: "How-To",
      title: "Fund Account",
      answer: "",
      dateAnswered: "17th December 2022"),
  FaqModel(
      category: "Concerning Your Account",
      title: "What’s my account number?",
      answer: "",
      dateAnswered: "17th December 2022"),
  FaqModel(
      category: "Concerning Your Account",
      title: "Why was my account frozen?",
      answer: "",
      dateAnswered: "17th December 2022"),
  FaqModel(
      category: "Concerning Your Account",
      title: "What to do if I forgot my login passcode?",
      answer: "",
      dateAnswered: "17th December 2022"),
  FaqModel(
      category: "Concerning Your Account",
      title: "Can I have multiple Tryba accounts?",
      answer: "",
      dateAnswered: "17th December 2022"),
];
