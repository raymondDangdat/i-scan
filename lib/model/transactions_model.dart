import '../resources/constants/image_constant.dart';

class Transaction {
  final String title;
  final String time;
  final String amount;
  final bool isSwap;
  final String? transactionLogo;
  final String? firstCoinLogo;
  final String? secondCoinSign;
  final String? secondCoinLogo;
  final String? secondCoinValue;
  final bool isCredit;
  final String category;
  Transaction({
    required this.title,
    required this.time,
    required this.amount,
    this.isSwap = false,
    this.transactionLogo,
    this.firstCoinLogo,
    this.secondCoinSign,
    this.secondCoinLogo,
    this.isCredit = false,
    this.secondCoinValue,
    required this.category,
  });
}

final List<Transaction> transactionItems = [
  Transaction(
      title: "Payment fromAyobami Williams",
      time: "21 Oct. 2023, 08:00AM",
      amount: "+NGN20,900.00",
      isCredit: true,
      category: "Money in",
      transactionLogo: appleLogo),
  Transaction(
      title: "Apple Subscription",
      time: "21 Oct. 2023, 08:00AM",
      amount: "-NGN900.00",
      category: "Deposit",
      transactionLogo: zenithLogo),
  Transaction(
      title: "Naira converted to USD",
      time: "21 Oct. 2023, 08:00AM",
      amount: "+NGN20,900.00",
      category: "Money out",
      isCredit: true,
      transactionLogo: gtLogo),
  Transaction(
      title: "Payment fromAyobami Williams",
      time: "21 Oct. 2023, 08:00AM",
      amount: "+NGN20,900.00",
      isCredit: true,
      category: "Money in",
      transactionLogo: appleLogo),
  Transaction(
      title: "Apple Subscription",
      time: "21 Oct. 2023, 08:00AM",
      amount: "-NGN900.00",
      category: "Deposit",
      transactionLogo: zenithLogo),
];
