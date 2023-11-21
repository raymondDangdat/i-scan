import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_scan/ui/bottom_nav_screen/card/widgets/card_type_toggle.dart';
import 'package:i_scan/ui/bottom_nav_screen/card/widgets/dollar_card_widget.dart';
import 'package:i_scan/ui/bottom_nav_screen/card/widgets/naira_card_widget.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/title_widget.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/card_provider.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class CardDashboardScreen extends StatefulWidget {
  const CardDashboardScreen({Key? key}) : super(key: key);

  @override
  State<CardDashboardScreen> createState() => _CardDashboardScreenState();
}

class _CardDashboardScreenState extends State<CardDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<CardProvider, AuthProvider>(
        builder: (ctx, cardProvider, authProvider, child) {
      return Expanded(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleWidget(
                        title: cardDashboard,
                        fontSize: 12,
                      ),
                      InkWell(
                        onTap: () {
                          cardProvider.updateCardScreenStep(3);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(manageCardIconSvg),
                            SizedBox(
                              width: 4.w,
                            ),
                            const TitleWidget(
                              title: manageCard,
                              fontSize: 12,
                              fontWeight: mediumFont,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const CardTypeToggle(),
            SizedBox(
              height: 8.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: cardProvider.selectedDollarCard == null &&
                          !cardProvider.nairaCardSelected
                      ? 0
                      : horizontalPadding.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cardProvider.nairaCardSelected
                        ? const NairaCardWidget()
                        : const DollarCardWidget(),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

class RecentCardActivityItem {
  final String icon;
  final String title;
  final String timme;
  final String amount;

  RecentCardActivityItem(
      {required this.icon,
      required this.title,
      required this.amount,
      required this.timme});
}

class RecentCardActivity {
  final String date;
  final List<RecentCardActivityItem> activities;
  RecentCardActivity({required this.date, required this.activities});
}

final List<RecentCardActivity> recentCardActivitiesList = [
  RecentCardActivity(date: "Today", activities: [
    RecentCardActivityItem(
        icon: netflixIcon, title: "Netflix", amount: "10", timme: "09:52 PM")
  ]),
  RecentCardActivity(date: "Yesterday", activities: [
    RecentCardActivityItem(
        icon: showmaxIcon, title: "Showmax", amount: "10", timme: "09:52 PM"),
    RecentCardActivityItem(
        icon: dstvIcon, title: "DSTV", amount: "10", timme: "09:52 PM"),
  ]),
  RecentCardActivity(date: "October 9, 2023", activities: [
    RecentCardActivityItem(
        icon: showmaxIcon, title: "Showmax", amount: "10", timme: "09:52 PM"),
    RecentCardActivityItem(
        icon: dstvIcon, title: "DSTV", amount: "10", timme: "09:52 PM"),
  ]),
  RecentCardActivity(date: "October 8, 2023", activities: [
    RecentCardActivityItem(
        icon: showmaxIcon, title: "Showmax", amount: "10", timme: "09:52 PM"),
    RecentCardActivityItem(
        icon: dstvIcon, title: "DSTV", amount: "10", timme: "09:52 PM"),
    RecentCardActivityItem(
        icon: showmaxIcon, title: "Showmax", amount: "10", timme: "09:52 PM"),
    RecentCardActivityItem(
        icon: dstvIcon, title: "DSTV", amount: "10", timme: "09:52 PM"),
    RecentCardActivityItem(
        icon: showmaxIcon, title: "Showmax", amount: "10", timme: "09:52 PM"),
    RecentCardActivityItem(
        icon: dstvIcon, title: "DSTV", amount: "10", timme: "09:52 PM"),
  ]),
];
