import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/components.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/long_divider.dart';
import '../../../Widgets/title_widget.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/card_provider.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class CardSubscriptionScreen extends StatefulWidget {
  const CardSubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<CardSubscriptionScreen> createState() => _CardSubscriptionScreenState();
}

class _CardSubscriptionScreenState extends State<CardSubscriptionScreen> {
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
            IScanAppBar(
              title: "",
              onTap: () {
                //Show car Dashboard
                cardProvider.updateCardScreenStep(3);
              },
            ),
            SizedBox(
              height: 21.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
              child: const Row(
                children: [
                  TitleWidget(
                    title: subscription,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
              child: Column(
                children: [
                  CustomContainerButton(
                    onTap: () {},
                    title: "",
                    borderRadius: 16,
                    horizontalPadding: 24,
                    verticalPadding: 24,
                    widget: ListView.builder(
                        itemCount: subscriptionsList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final subscription = subscriptionsList[index];
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: index < subscriptionsList.length - 1
                                    ? 13.h
                                    : 0),
                            child: Row(
                              children: [
                                Container(
                                  height: 32.h,
                                  width: 32.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      image: DecorationImage(
                                          image:
                                              AssetImage(subscription.logo))),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TitleWidget(
                                          title: subscription.title,
                                          fontSize: 14,
                                          fontWeight: mediumFont,
                                        ),
                                      ],
                                    ),
                                    BodyTextPrimaryWithLineHeight(
                                      text:
                                          "\$${subscription.amountPerMonth}/month",
                                      fontSize: 12,
                                      fontWeight: boldFont,
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    if (index < subscriptionsList.length - 1)
                                      const LongDivider(),
                                  ],
                                )),
                                SvgPicture.asset(settingsToggleOn)
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class SubscriptionsModel {
  final String logo;
  final String title;
  final String amountPerMonth;
  final bool status;

  SubscriptionsModel(
      {required this.logo,
      required this.title,
      required this.amountPerMonth,
      required this.status});
}

final List<SubscriptionsModel> subscriptionsList = [
  SubscriptionsModel(
      logo: netflixIcon, title: "Netflix", amountPerMonth: "10", status: true),
  SubscriptionsModel(
      logo: netflixIcon, title: "Netflix", amountPerMonth: "10", status: true),
  SubscriptionsModel(
      logo: netflixIcon, title: "Netflix", amountPerMonth: "10", status: false),
  SubscriptionsModel(
      logo: netflixIcon, title: "Netflix", amountPerMonth: "10", status: true),
  SubscriptionsModel(
      logo: netflixIcon, title: "Netflix", amountPerMonth: "10", status: false),
  SubscriptionsModel(
      logo: showmaxIcon, title: "Showmax", amountPerMonth: "100", status: true),
  SubscriptionsModel(
      logo: dstvIcon, title: "DSTV", amountPerMonth: "50", status: false),
];
