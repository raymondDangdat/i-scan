import '../resources/constants/image_constant.dart';

class DummyCard {
  final String cardNumber;
  final String bankName;
  final String bankLogo;
  final String cardType;

  DummyCard(
      {required this.cardNumber,
      required this.bankName,
      required this.bankLogo,
      required this.cardType});
}

final List<DummyCard> dummyCardList = [
  DummyCard(
      cardNumber: "5268 4275 1893 2200",
      bankName: "Zenith bank",
      bankLogo: zenithCardLogo,
      cardType: masterCardLogo),
  DummyCard(
      cardNumber: "4683 7120 0006 6399",
      bankName: "Guarantee trust bank",
      bankLogo: gtCardLogo,
      cardType: visaCardLogo),
];
