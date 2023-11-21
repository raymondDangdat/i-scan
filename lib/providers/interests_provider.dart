import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Utils/go_router_route_names.dart';
import '../Widgets/custom_snack_back.dart';
import '../resources/constants/image_constant.dart';

class InterestsProvider extends ChangeNotifier {
  String _resMessage = "";
  String get resMessage => _resMessage;

  final List<InterestData> _interests = interestList;
  List<InterestData> get listOfInterests => _interests;

  void updateSelectedInterest(
      {required InterestData interest, required int index}) {
    final interestToUpdate = InterestData(
        title: interest.title,
        img: interest.img,
        isSelected: interest.isSelected ? false : true);
    _interests[index] = interestToUpdate;
    notifyListeners();
  }

  void uploadInterest({required BuildContext context}) {
    int selectedInterests = 0;
    for (int i = 0; i < _interests.length; i++) {
      if (_interests[i].isSelected) {
        selectedInterests++;
      }
    }

    if (selectedInterests < 3) {
      customSnackBar(context, "Select at least 3 Interests");
    } else {
      context.push(context.namedLocation(noticeBeforeLoginRouteName));
    }
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}

class InterestData {
  final String img;
  final String title;
  final bool isSelected;

  InterestData({
    required this.title,
    this.isSelected = false,
    required this.img,
  });
}

List<InterestData> interestList = [
  InterestData(title: "Music", img: musicUrl),
  InterestData(title: "Entertainment", img: entertainmentUrl),
  InterestData(title: "Sport", img: sportUrl),
  InterestData(title: "Gaming", img: gamingUrl),
  InterestData(title: "Fashion & Beauty", img: fashionAndBeautyURL),
  InterestData(title: "Food", img: foodCategoryUrl),
  InterestData(title: "Business & finance", img: businessAndFinanceURL),
  InterestData(title: "Arts & culture", img: artsAndCultureURL),
  InterestData(title: "Politics", img: politicsUrl),
  InterestData(title: "News", img: newsUrl),
  InterestData(title: "Technology", img: technologyUrl),
  InterestData(title: "Travel", img: travelUrl),
];
