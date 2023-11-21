import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Utils/constants.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/long_divider.dart';
import '../../../Widgets/title_widget.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/card_provider.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/string_constants.dart';
import 'virtual_card_dashboard_screen.dart';

class AllRecentActivitiesScreen extends StatefulWidget {
  const AllRecentActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<AllRecentActivitiesScreen> createState() =>
      _AllRecentActivitiesScreenState();
}

class _AllRecentActivitiesScreenState extends State<AllRecentActivitiesScreen> {
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
                cardProvider.updateCardScreenStep(2);
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
                    title: recentCardActivities,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Column(
                  children: [
                    CustomContainerButton(
                      onTap: () {},
                      title: "",
                      borderRadius: 16,
                      verticalPadding: 15,
                      horizontalPadding: 24,
                      widget: Column(
                        children: [
                          ListView.builder(
                              itemCount: recentCardActivitiesList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final date = recentCardActivitiesList[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: index <
                                              recentCardActivitiesList.length -
                                                  1
                                          ? 32.h
                                          : 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleWidget(
                                        title: date.date,
                                        fontSize: 12,
                                      ),
                                      SizedBox(
                                        height: 21.h,
                                      ),
                                      ListView.builder(
                                          itemCount: date.activities.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            final activity =
                                                date.activities[index];
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: index <
                                                          date.activities
                                                                  .length -
                                                              1
                                                      ? 13.h
                                                      : 0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 32.h,
                                                    width: 32.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                activity
                                                                    .icon))),
                                                  ),
                                                  SizedBox(
                                                    width: 16.w,
                                                  ),
                                                  Expanded(
                                                      child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          TitleWidget(
                                                            title:
                                                                activity.title,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                mediumFont,
                                                          ),
                                                          BodyTextPrimaryWithLineHeight(
                                                            text: cardProvider
                                                                    .nairaCardSelected
                                                                ? "$nairaSign${moneyFormat.format(4000)}"
                                                                : "\$${activity.amount}",
                                                            textColor:
                                                                const Color(
                                                                    0xFF181C26),
                                                            fontSize: 12,
                                                          )
                                                        ],
                                                      ),
                                                      BodyTextPrimaryWithLineHeight(
                                                        text: activity.timme,
                                                        fontSize: 12,
                                                      ),
                                                      SizedBox(
                                                        height: 12.h,
                                                      ),
                                                      const LongDivider(),
                                                    ],
                                                  ))
                                                ],
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
