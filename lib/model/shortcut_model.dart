import 'dart:ui';

import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';

class ShortcutModel {
  final String title;
  final String icon;
  final String status;
  final Color statusColor;
  final double leftAlignment;
  final String smallIcon;
  final String newIcon;

  ShortcutModel({
    required this.status,
    required this.title,
    required this.icon,
    this.statusColor = const Color.fromRGBO(246, 7, 0, 1),
    this.leftAlignment = 8,
    required this.smallIcon,
    required this.newIcon,
  });
}

final List<ShortcutModel> shortcutsItems = [
  ShortcutModel(
      status: "Discounted",
      title: buyAirtime,
      icon: buyAirtimeIcon,
      statusColor: const Color.fromRGBO(72, 202, 242, 1),
      leftAlignment: 13,
      smallIcon: buyAirtimeSmallIcon,
      newIcon: buyAirtimeNewIcon),
  ShortcutModel(
      status: "Instant",
      title: sendMoney,
      icon: sendIcon,
      leftAlignment: 11,
      smallIcon: sendMoneySmallIconSvg,
      newIcon: sendMoneyNewIcon),
  ShortcutModel(
      status: "Affordable",
      title: buyData,
      icon: buyDataIcon,
      leftAlignment: 18,
      smallIcon: buyDataSmallIconSvg,
      newIcon: buyDataNewIcon),
  ShortcutModel(
      status: "Hot🔥",
      title: utilities,
      icon: utilitiesIcon,
      statusColor: const Color.fromRGBO(72, 202, 242, 1),
      leftAlignment: 18,
      smallIcon: utilitiesSmallIconSvg,
      newIcon: utilitiesNewIcon),
  ShortcutModel(
      status: "Interest 5%",
      title: save,
      icon: saveIcon,
      leftAlignment: 20,
      smallIcon: saveSmallIconSvg,
      newIcon: saveNewIcon),
  ShortcutModel(
      status: "Coming Soon",
      title: loan,
      icon: loanIcon,
      statusColor: const Color.fromRGBO(72, 202, 242, 1),
      leftAlignment: 20,
      smallIcon: loanSmallIconSvg,
      newIcon: loanNewIcon),
  ShortcutModel(
      status: "Earn Big",
      title: earn,
      icon: earnIcon,
      leftAlignment: 20,
      smallIcon: earnsSmallIconSvg,
      newIcon: earnNewIcon),
  ShortcutModel(
      status: "WAEC etc",
      title: crowdPool,
      icon: educationalIcon,
      statusColor: const Color.fromRGBO(72, 202, 242, 1),
      leftAlignment: 20,
      smallIcon: educationSmallIconSvg,
      newIcon: educationalIcon),
  ShortcutModel(
      status: "Grand 🎉",
      title: hashITSocial,
      icon: hashITSocialIcon,
      leftAlignment: 8,
      smallIcon: socialSmallIconSvg,
      newIcon: socialNewIcon),
  ShortcutModel(
      status: "Sell Fast",
      title: market,
      icon: marketplaceIcon,
      statusColor: const Color.fromRGBO(72, 202, 242, 1),
      smallIcon: marketSmallIconSvg,
      newIcon: marketNewIcon),
  ShortcutModel(
      status: "Start with N100",
      title: advert,
      icon: advertiseIcon,
      leftAlignment: 13,
      smallIcon: advertSmallIconSvg,
      newIcon: advertNewIcon),
  ShortcutModel(
      status: "Show Love ❤--",
      title: giveaway,
      icon: giveawayIcon,
      statusColor: const Color.fromRGBO(72, 202, 242, 1),
      leftAlignment: 15,
      smallIcon: giveAwaySmallIconSvg,
      newIcon: giveawayNewIcon),
];
