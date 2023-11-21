import 'dart:ui';

import '../resources/constants/image_constant.dart';

class WaysToEarnModel {
  final String title;
  final String subTitle;
  final Color bgColor;
  final String bgImage;
  final String btnText;
  final String smallIcon;
  final String taskMessage;
  final String ctaMessage;
  WaysToEarnModel(
      {required this.title,
      required this.subTitle,
      required this.bgColor,
      required this.bgImage,
      this.btnText = "Activate now",
      this.smallIcon = "",
      this.ctaMessage = "",
      this.taskMessage = ""});
}

final List<WaysToEarnModel> waysToEarnList = [
  WaysToEarnModel(
      title: "Earn by performing tasks",
      subTitle:
          "Earn steady daily income by performing social media tasks such as following, liking, commenting, sharing, retweeting etc.",
      bgColor: const Color.fromRGBO(124, 45, 252, 1),
      bgImage: earnDailyDashboardBgImg),
  WaysToEarnModel(
      title: "Advertise",
      subTitle:
          "Get people to repost your adverts on their social media on your behalf or advertise directly on the hashIT platform.",
      bgColor: const Color.fromRGBO(252, 45, 95, 1),
      bgImage: advertiseBg),
  WaysToEarnModel(
      title: "Earn Reselling Products",
      subTitle: "Earn up to N1,000,000 monthly in sales commissions ",
      bgColor: const Color.fromRGBO(252, 45, 95, 1),
      bgImage: earnOnResellingBg,
      btnText: "Resell products")
  // MoreProductsModel(title: "Earn Money Reselling Products", subTitle: "Earn up to N1,000,000 monthly in sales commissions ", btnTextColor: const Color.fromRGBO(151, 71, 255, 1), bgImg: earnOnResellingBg, btnColor: white, btnTitle: "Resell products", img: earnMoneyResellingImg, subTitleTextColor: const Color.fromRGBO(255, 255, 255, 0.78), titleWidth: 150, imgWidth: 130,
  //     rightPosition: -5),
];

final List<WaysToEarnModel> earningList = [
  WaysToEarnModel(
      title: "Earning",
      subTitle:
          "Earn steady daily income by performing social media tasks such as following, liking, commenting, sharing, retweeting etc.",
      bgColor: const Color.fromRGBO(124, 45, 252, 1),
      bgImage: earnDailyDashboardBgImg,
      taskMessage: '124 total tasks for you to perform',
      ctaMessage: "Earn Dashboard",
      smallIcon: totalTaskIcon),
  WaysToEarnModel(
      title: "Advertisement",
      subTitle:
          "Get people to repost your adverts on their social media on your behalf or advertise directly on the hashIT platform.",
      bgColor: const Color.fromRGBO(252, 45, 95, 1),
      bgImage: advertiseBg,
      taskMessage: "2 adverts running",
      ctaMessage: "Advertise",
      smallIcon: advertRunningIcon),
  WaysToEarnModel(
      title: "Earn Reselling Products",
      subTitle: "Earn up to N1,000,000 monthly in sales commissions ",
      bgColor: const Color.fromRGBO(252, 45, 95, 1),
      bgImage: earnOnResellingBg,
      btnText: "Resell products")
  // MoreProductsModel(title: "Earn Money Reselling Products", subTitle: "Earn up to N1,000,000 monthly in sales commissions ", btnTextColor: const Color.fromRGBO(151, 71, 255, 1), bgImg: earnOnResellingBg, btnColor: white, btnTitle: "Resell products", img: earnMoneyResellingImg, subTitleTextColor: const Color.fromRGBO(255, 255, 255, 0.78), titleWidth: 150, imgWidth: 130,
  //     rightPosition: -5),
];
