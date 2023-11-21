import 'package:flutter/material.dart';

import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';

class GiveawayProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  int _giveawayNumberOfWinners = 1;
  int get giveawayNumberOfWinners => _giveawayNumberOfWinners;

  incrementOrDecrementNumberOfWinners({bool isIncrement = true}) {
    if (isIncrement) {
      _giveawayNumberOfWinners++;
      notifyListeners();
    } else {
      if (_giveawayNumberOfWinners > 1) {
        _giveawayNumberOfWinners--;
        notifyListeners();
      }
    }
  }

  final titleOfGiveawayController = TextEditingController();
  final priceOfGiveawayController = TextEditingController();
  final socialMediaProfileController = TextEditingController();
  final postLinkController = TextEditingController();
  final durationController = TextEditingController();

  List<String> giveawaySocialMediaPlatforms = [
    "Hashit",
    "Twitter",
    "Instagram",
    "Facebook",
    "TikTok"
  ];

  List<String> giveawayCategories = [
    "Social media giveaway",
    "Quiz giveaway",
    "Ordinary giveaway",
  ];

  List<String> giveawayActivitiesTypes = [
    "Comment",
    "Like",
    "Share",
    "Follow",
  ];

  List<String> giveawayMethodOfWinnersSelectionTypes = [
    "Automatic",
    "Manual",
  ];

  List<String> giveawayDurationList = [
    "Days",
    "Weeks",
  ];

  List<String> giveawayPrizeTypes = [
    "Utility bills",
    "Data",
    "Airtime",
    "Cash",
  ];

  String? _selectedSocialMediaPlatform;
  String? get selectedSocialMediaPlatform => _selectedSocialMediaPlatform;
  updateSelectedSocialMediaPlatform(String? platform) {
    _selectedSocialMediaPlatform = platform;
    debugPrint("Platform Selected: $_selectedSocialMediaPlatform");
    notifyListeners();
  }

  String? _selectedGiveawayActivity;
  String? get selectedGiveawayActivity => _selectedGiveawayActivity;
  updateSelectedGiveawayActivity(String? platform) {
    _selectedGiveawayActivity = platform;
    notifyListeners();
  }

  String? _selectedGiveawayPrizeTypeActivity;
  String? get selectedGiveawayPrizeTypeActivity =>
      _selectedGiveawayPrizeTypeActivity;
  updateSelectedGiveawayPrizeActivityType(String? prize) {
    _selectedGiveawayPrizeTypeActivity = prize;
    notifyListeners();
  }

  String? _selectedGiveawayPrizeType;
  String? get selectedGiveawayPrizeType => _selectedGiveawayPrizeType;
  updateSelectedGiveawayPrizeType(String? prizeType) {
    _selectedGiveawayPrizeType = prizeType;
    notifyListeners();
  }

  String? _selectedGiveawayDurationType = "Days";
  String? get selectedGiveawayDuration => _selectedGiveawayDurationType;
  updateSelectedGiveawayDurationType(String? duration) {
    _selectedGiveawayDurationType = duration;
    notifyListeners();
  }

  String? _selectedGiveawayModeOfWinnersSelection = "Automatic";
  String? get selectedGiveawayModeOfWinnersSelection =>
      _selectedGiveawayModeOfWinnersSelection;
  updateSelectedModeOfWinnersSelection(String? mode) {
    _selectedGiveawayModeOfWinnersSelection = mode;
    notifyListeners();
  }

  String? _selectedGiveawayType;
  String? get selectedGiveawayType => _selectedGiveawayType;

  final List<GiveawayTypeModel> _listOfGiveawayTypes = giveawayTypes;
  List<GiveawayTypeModel> get listOfGiveawayTypes => _listOfGiveawayTypes;

  void updateSelectedGiveawayType(String? type) {
    _selectedGiveawayType = type;
    notifyListeners();
  }

  void updateSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }

  void resetSocialMediaGiveawayFields() {
    titleOfGiveawayController.text = "";
    _selectedSocialMediaPlatform = null;
    _selectedGiveawayActivity = null;
    postLinkController.text = "";
    priceOfGiveawayController.text = "";
    durationController.text = "";
    _selectedGiveawayPrizeType = null;
    socialMediaProfileController.text = "";
    _giveawayNumberOfWinners = 1;
    notifyListeners();
  }
}

class GiveawayTypeModel {
  final String image;
  final String title;
  final String subTitle;
  final Color headerColor;
  final Color bottomColor;
  final String buttonText;
  final bool isComingSoon;

  GiveawayTypeModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.bottomColor,
    required this.headerColor,
    this.buttonText = "Create Giveaway",
    this.isComingSoon = false,
  });
}

final List<GiveawayTypeModel> giveawayTypes = [
  GiveawayTypeModel(
      image: socialGiveAwayImg,
      title: socialGiveAway,
      subTitle:
          "Earn Daily by posting adverts of various businesses and performing tasks on your social media pages.",
      bottomColor: const Color.fromRGBO(242, 234, 254, 1),
      headerColor: const Color.fromRGBO(99, 45, 252, 1)),
  GiveawayTypeModel(
    image: quizGiveAwayImg,
    title: "Quiz Giveaway",
    subTitle:
        "Earn Daily by posting adverts of various businesses and performing tasks on your social media pages.",
    bottomColor: const Color.fromRGBO(255, 234, 239, 1),
    headerColor: const Color.fromRGBO(252, 45, 95, 1),
    isComingSoon: true,
  ),
  GiveawayTypeModel(
      image: ordinaryGiveAwayImg,
      title: "Ordinary Giveaway",
      subTitle:
          "Earn Daily by posting adverts of various businesses and performing tasks on your social media pages.",
      bottomColor: const Color.fromRGBO(254, 248, 234, 1),
      headerColor: const Color.fromRGBO(200, 146, 42, 1)),
];
