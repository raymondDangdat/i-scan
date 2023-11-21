import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';

class AdsBenefitModel {
  final String icon;
  final String title;
  final String mainText;

  AdsBenefitModel(
      {required this.title, required this.icon, required this.mainText});
}

final List<AdsBenefitModel> adBenefitsList = [
  AdsBenefitModel(
      title: advertDuration,
      icon: advertDurationIcon,
      mainText: pleaseNoteThatYourAdvertWillBeVisible),
  AdsBenefitModel(
      title: highAdvertView,
      icon: highAdvertViewIcon,
      mainText: weHaveAtLeast10MillionMonthlyVisits),
  AdsBenefitModel(
      title: interactDirectlyWithYourBuyers,
      icon: interactDirectlyWithBuyersIcon,
      mainText: youCanContactYourBuyersOrClientsDirectly),
  AdsBenefitModel(
      title: socialMediaAds,
      icon: socialMediaAdvertsIcon,
      mainText: weDoNotOnlyLeverageOnOurWebsite),
  AdsBenefitModel(
      title: lowAdvertCost,
      icon: lowAdvertCostIcon,
      mainText: youWillBeCharged),
];
