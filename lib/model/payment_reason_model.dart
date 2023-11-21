class PaymentReasonModel {
  final String title;
  final String subtitle;

  PaymentReasonModel({
    required this.title,
    required this.subtitle,
  });
}

final List<PaymentReasonModel> paymntReasons = [
  PaymentReasonModel(
      title: "Pay a bill or invoice",
      subtitle: "For example, to pay a utility bill, plumber, or school fees"),
  PaymentReasonModel(
      title: "Pay an unexpected bill",
      subtitle: "For example, an out of the blue tax bill"),
  PaymentReasonModel(
      title: "Paying a wage or salary",
      subtitle:
          "Paying someone who works for you or an employee of a business you work for"),
  PaymentReasonModel(
      title: "Paying a fee to release funds or goods",
      subtitle:
          "For example, fees to unlock larger payments or auction commission"),
];
