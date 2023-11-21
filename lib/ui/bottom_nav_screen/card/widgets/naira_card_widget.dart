import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../Utils/constants.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/long_divider.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../model/card_model.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/card_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';
import '../virtual_card_dashboard_screen.dart';
import 'modals/show_card_withdrawal_modal.dart';
import 'modals/show_fund_card_modal.dart';
import 'naira_virtual_card_card.dart';

class NairaCardWidget extends StatelessWidget {
  const NairaCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<CardProvider, AuthProvider>(
        builder: (ctx, cardProvider, authProvider, child) {
      CardModel card = cardProvider.cardList[0];
      return Column(
        children: [
          const NairaVirtualCardCard(),
          SizedBox(
            height: 24.h,
          ),
          CustomContainerButton(
            onTap: () {},
            title: "",
            borderRadius: 16,
            horizontalPadding: 16,
            widget: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BodyTextPrimaryWithLineHeight(
                      text: cardBalance,
                      fontSize: 10,
                    ),
                    TitleWidget(
                      title: "$nairaSign${moneyFormat.format(card.balance)}",
                      fontSize: 26,
                    )
                  ],
                )),
                SvgPicture.asset(
                  viewPinEyesImg,
                  color: const Color.fromRGBO(45, 91, 252, 1),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomContainerButton(
                onTap: () {
                  showFundCardModal(context);
                },
                title: "",
                borderRadius: 18,
                verticalPadding: 16,
                horizontalPadding: 16,
                borderColor: inputBorderColor,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      plusSign,
                      color: greenTextColor,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    const BodyTextPrimaryWithLineHeight(
                      text: errorTakingAttendance,
                      textColor: black,
                      fontSize: 12,
                      fontWeight: mediumFont,
                    )
                  ],
                ),
              )),
              SizedBox(
                width: 4.w,
              ),
              Expanded(
                  child: CustomContainerButton(
                onTap: () {
                  showCardWithdrawalModal(context);
                },
                title: "",
                borderRadius: 18,
                verticalPadding: 16,
                horizontalPadding: 16,
                borderColor: inputBorderColor,
                widget: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BodyTextPrimaryWithLineHeight(
                      text: withdraw,
                      textColor: black,
                      fontSize: 12,
                      fontWeight: mediumFont,
                    )
                  ],
                ),
              )),
            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleWidget(
                title: recentCardActivities,
                fontSize: 12,
              ),
              InkWell(
                onTap: () {
                  cardProvider.updateCardScreenStep(6);
                },
                child: const TitleWidget(
                  title: seeAll,
                  fontSize: 12,
                  textColor: Color(0xFF2D5AFC),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          CustomContainerButton(
            onTap: () {},
            title: "",
            borderRadius: 16,
            verticalPadding: 15,
            horizontalPadding: 24,
            widget: Column(
              children: [
                ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final date = recentCardActivitiesList[index];
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: index < recentCardActivitiesList.length - 1
                                ? 32.h
                                : 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final activity = date.activities[index];
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            index < date.activities.length - 1
                                                ? 13.h
                                                : 0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 32.h,
                                          width: 32.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      activity.icon))),
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TitleWidget(
                                                  title: activity.title,
                                                  fontSize: 14,
                                                  fontWeight: mediumFont,
                                                ),
                                                BodyTextPrimaryWithLineHeight(
                                                  text: cardProvider
                                                          .nairaCardSelected
                                                      ? "$nairaSign${moneyFormat.format(4000)}"
                                                      : "\$${activity.amount}",
                                                  textColor:
                                                      const Color(0xFF181C26),
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
      );
    });
  }
}
