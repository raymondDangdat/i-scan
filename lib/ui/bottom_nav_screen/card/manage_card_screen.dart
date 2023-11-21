import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_scan/ui/bottom_nav_screen/card/widgets/modals/show_card_termination_warning_modal.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/components.dart';
import '../../../Widgets/custom_snack_back.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/title_widget.dart';
import '../../../model/card_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/card_provider.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class ManageCardScreen extends StatefulWidget {
  const ManageCardScreen({Key? key}) : super(key: key);

  @override
  State<ManageCardScreen> createState() => _ManageCardScreenState();
}

class _ManageCardScreenState extends State<ManageCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<CardProvider, AuthProvider>(
        builder: (ctx, cardProvider, auth, child) {
      CardModel card = cardProvider.selectedNairaCard!;
      bool isFrozen = cardProvider.cardFreezed;
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
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
              child: Column(
                children: [
                  //This only shows when user hasn't linked their card
                  if (!cardProvider.hasLinkedCard &&
                      cardProvider.createdCardFirstTime)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 22.h,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TitleWidget(
                              title: yayYourCardIsReadyToGo,
                              fontSize: 18,
                              fontWeight: regularFont,
                              textColor: Color(0xFF181C26),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        const TitleWidget(
                          title: oneMoreThingAndYouAreGood,
                          fontSize: 12,
                          textColor: Color(0xFF181C26),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const BodyTextPrimaryWithLineHeight(
                          text: youMustLinkYouAccount,
                          fontSize: 10,
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                      ],
                    ),

                  if (cardProvider.hasLinkedCard &&
                          !cardProvider.createdCardFirstTime ||
                      !cardProvider.hasLinkedCard &&
                          !cardProvider.createdCardFirstTime)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 21.h,
                        ),
                        const Row(
                          children: [
                            TitleWidget(
                              title: manage,
                              fontSize: 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainerButton(
                      onTap: () {
                        if (!card.linked) {
                          cardProvider.linkCard(
                            id: card.id,
                            accountId: auth.userProfile != null &&
                                    auth.userProfile!.data.accounts.isNotEmpty
                                ? auth.userProfile!.data.accounts[0].reference
                                    .toString()
                                : "",
                          );
                        } else {
                          cardProvider.unlinkCard(card.id);
                        }

                        // cardProvider.toggleHasLinkedCard();
                        // if (cardProvider.createdCardFirstTime) {
                        //   cardProvider.updateCreatedCardFirstTime(false);
                        //   //TAKE USER BACK TO DASHBOARD SCREEN
                        //   cardProvider.updateCardScreenStep(2);
                        // }
                      },
                      title: "",
                      verticalPadding: 16,
                      horizontalPadding: 16,
                      borderRadius: 8,
                      widget: Row(
                        children: [
                          SvgPicture.asset(linkCardToAccountIcon),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: TitleWidget(
                              title: cardProvider.hasLinkedCard
                                  ? unLinkCardFromAccount
                                  : linkCardToAccount,
                              fontSize: 14,
                              fontWeight: mediumFont,
                            ),
                          ),
                          SvgPicture.asset(cardProvider.hasLinkedCard
                              ? settingsToggleOn
                              : settingsToggleOff)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const BodyTextPrimaryWithLineHeight(
                        text: youMustLinkYourAccount),
                    SizedBox(
                      height: 16.h,
                    ),
                    if (!cardProvider.hasLinkedCard &&
                        cardProvider.createdCardFirstTime)
                      Image.asset(firstTimeCardNotLinkedImg),
                    // if (!cardProvider.createdCardFirstTime)
                    Column(
                      children: [
                        ItemWidget(
                          title: cardDetails,
                          leadingIcon: cardDetailsIcon,
                          onTap: () {
                            cardProvider.updateCardScreenStep(7);
                          },
                          trailingIcon: forwardIconSvg,
                          footerText: seeEveryInformationOnYourCard,
                        ),
                        ItemWidget(
                          title: changePIN,
                          leadingIcon: changeCardPinIcon,
                          onTap: () {
                            //SHOW THE CHANGE CARD PIN SCREEN
                            cardProvider.updateCardScreenStep(4);
                          },
                          trailingIcon: forwardIconSvg,
                          footerText: changeYourCardTransactionPIN,
                        ),
                        ItemWidget(
                          title: subscription,
                          leadingIcon: cardSubscriptionIcon,
                          onTap: () {
                            debugPrint("Tapped");
                            cardProvider.updateCardScreenStep(5);
                          },
                          trailingIcon: forwardIconSvg,
                          footerText: changeYourCardTransactionPIN,
                        ),
                        ItemWidget(
                          title: freezeCard,
                          leadingIcon: freezeCardIcon,
                          onTap: () async {
                            bool result = await cardProvider.manageCard(
                              id: card.id,
                              action: isFrozen ? "freeze" : "unfreeze",
                              reason: "",
                            );
                            if (result) {
                              customSnackBar(
                                  context,
                                  isFrozen
                                      ? "Card has been unfrozen"
                                      : "Card has been frozen");
                            }
                            cardProvider.toggleCardFreezed();
                          },
                          trailingIcon:
                              isFrozen ? settingsToggleOn : settingsToggleOff,
                          footerText: thisAutomaticallyTurnsOff,
                        ),
                        ItemWidget(
                          title: terminateCard,
                          leadingIcon: terminateCardIcon,
                          onTap: () {
                            showCardTerminationWarningModal(context);
                          },
                          trailingIcon: forwardIconSvg,
                          footerText: thisEnablesYouToStopUsingYourCard,
                        ),
                      ],
                    )
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

class ItemWidget extends StatelessWidget {
  final String leadingIcon;
  final String title;
  final String trailingIcon;
  final VoidCallback onTap;
  final String footerText;
  const ItemWidget(
      {Key? key,
      required this.title,
      required this.leadingIcon,
      required this.onTap,
      this.trailingIcon = forwardIconSvg,
      required this.footerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainerButton(
          onTap: onTap,
          title: "",
          borderRadius: 8,
          widget: Row(
            children: [
              if (leadingIcon.endsWith(".svg")) SvgPicture.asset(leadingIcon),
              if (leadingIcon.endsWith(".png"))
                Container(
                  height: 32.h,
                  width: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(image: AssetImage(leadingIcon)),
                  ),
                ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                  child: TitleWidget(
                title: title,
                fontSize: 14,
                fontWeight: mediumFont,
              )),
              SvgPicture.asset(trailingIcon)
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: BodyTextPrimaryWithLineHeight(
            text: footerText,
            fontSize: 10,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
