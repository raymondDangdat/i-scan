import 'package:flutter/material.dart';

import '../resources/constants/color_constants.dart';
import '../resources/constants/image_constant.dart';

class MoreProductsModel {
  final String title;
  final String subTitle;
  final String btnTitle;
  final String bgImg;
  final Color btnTextColor;
  final Color btnColor;
  final String itemLogo;
  final String img;
  final String cardShadow;
  final Color titleTextColor;
  final Color subTitleTextColor;
  final String cardLogo;
  final double titleWidth;
  final double imgWidth;
  final double rightPosition;

  MoreProductsModel({
    required this.title,
    required this.subTitle,
    required this.btnTextColor,
    required this.bgImg,
    required this.btnColor,
    required this.btnTitle,
    this.itemLogo = "",
    required this.img,
    this.cardShadow = "",
    this.subTitleTextColor = const Color.fromRGBO(255, 255, 255, 0.58),
    this.titleTextColor = Colors.white,
    this.cardLogo = "",
    this.titleWidth = 130,
    this.imgWidth = 83,
    this.rightPosition = 12,
  });
}

final List<MoreProductsModel> moreProductsList = [
  MoreProductsModel(
      title: "Get USD Virtual Card",
      subTitle: "Shop worldwide with HashIT USD Virtual Cards",
      btnTextColor: white,
      bgImg: usdCardBg,
      btnColor: const Color.fromRGBO(255, 161, 0, 1),
      btnTitle: "Get USD Card",
      img: "",
      cardLogo: usdLogo),
  MoreProductsModel(
      title: "Get Naira Card",
      subTitle: "Spend, withdraw with your naira card",
      btnTextColor: white,
      bgImg: nairaCardBg,
      btnColor: const Color.fromRGBO(255, 161, 0, 1),
      btnTitle: "Get Naira Card",
      img: "",
      cardLogo: nairaCardLogo),
  MoreProductsModel(
      title: "GET Gift Cards",
      subTitle: "Shop worldwide with HashIT USD Virtual Cards",
      btnTextColor: white,
      bgImg: giftCardBg,
      btnColor: const Color.fromRGBO(255, 161, 0, 1),
      btnTitle: "Get Gift Card",
      img: giftCardImg,
      titleTextColor: black,
      subTitleTextColor: const Color.fromRGBO(0, 0, 0, 0.78),
      imgWidth: 134,
      rightPosition: 10),
  // MoreProductsModel(title: "Earn Money Reselling Products", subTitle: "Earn up to N1,000,000 monthly in sales commissions ", btnTextColor: const Color.fromRGBO(151, 71, 255, 1), bgImg: earnOnResellingBg, btnColor: white, btnTitle: "Resell products", img: earnMoneyResellingImg, subTitleTextColor: const Color.fromRGBO(255, 255, 255, 0.78), titleWidth: 150, imgWidth: 130,
  // rightPosition: -5),
];
