import '../resources/constants/image_constant.dart';

class MarketPlaceModel {
  final String coinName;
  final String coinSign;
  final String coinLogo;
  final String coinCurrentPrice;
  final String coinPrice;

  MarketPlaceModel({
    required this.coinName,
    required this.coinCurrentPrice,
    required this.coinLogo,
    required this.coinSign,
    required this.coinPrice,
  });
}

final List<MarketPlaceModel> marketPlacePrices = [
  MarketPlaceModel(
      coinName: "Bitcoin",
      coinCurrentPrice: "€120.73 (0.86%)",
      coinLogo: btcIconSmall,
      coinSign: "BTC",
      coinPrice: "€13,981.25"),
  MarketPlaceModel(
      coinName: "Ethereum",
      coinCurrentPrice: "€120.73 (0.86%)",
      coinLogo: ethIcon,
      coinSign: "ETH",
      coinPrice: "€13,981.25"),
  MarketPlaceModel(
      coinName: "Tether",
      coinCurrentPrice: "€120.73 (0.86%)",
      coinLogo: btcIconSmall,
      coinSign: "USDT",
      coinPrice: "€13,981.25"),
  MarketPlaceModel(
      coinName: "BNB",
      coinCurrentPrice: "€120.73 (0.86%)",
      coinLogo: btcIconSmall,
      coinSign: "BNB",
      coinPrice: "€13,981.25"),
];
