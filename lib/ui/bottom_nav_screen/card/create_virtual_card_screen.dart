import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/show_select_account_modal.dart';
import '../../../Widgets/textfields.dart';
import '../../../providers/card_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';
import 'card_created_successfully.dart';

class CreateVirtualCardScreen extends StatefulWidget {
  const CreateVirtualCardScreen({Key? key}) : super(key: key);

  @override
  State<CreateVirtualCardScreen> createState() =>
      _CreateVirtualCardScreenState();
}

class _CreateVirtualCardScreenState extends State<CreateVirtualCardScreen> {
  bool isScrolling = false;

  late ScrollController _mainScreenController;
  final userIdController = TextEditingController();
  final nameOnCardController = TextEditingController();

  @override
  void initState() {
    _mainScreenController = ScrollController();

    _mainScreenController.addListener(() {});
    super.initState();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _mainScreenController.animateTo(0,
        duration: const Duration(microseconds: 20), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        children: [
          const TopPadding(),
          const IScanAppBar(
            title: createVirtualCard,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 33.h,
                  ),
                  const BodyTextLightWithLineHeight(
                    text: chooseYourPreferredCardColor,
                    fontSize: 10,
                    textColor: Color.fromRGBO(99, 99, 99, 1),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  // Consumer<CardProvider>(
                  //     builder: (ctx, cardProvider, child) {
                  //     return SizedBox(
                  //       height: 279.h,
                  //       width: MediaQuery.of(context).size.width,
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left: 100),
                  //         child: CarouselSlider(
                  //           options: CarouselOptions(
                  //             height: 279.h,
                  //               padEnds: true,
                  //               // autoPlay: true,
                  //               reverse: false,
                  //               viewportFraction: 1/2,
                  //               onPageChanged: (index, reason) {
                  //                 setState(() {
                  //                   isScrolling = true;
                  //                   context
                  //                       .read<CardProvider>()
                  //                       .changeCurrentIndex(index);
                  //                   cardProvider.changeCurrentIndex(index);
                  //                 });
                  //               },
                  //               initialPage: cardProvider.currentIndex),
                  //           items: [
                  //             ...cardProvider.cards.map((card) {
                  //               return Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: cardProvider.currentIndex == 0? 50 : 18.w
                  //                 ),
                  //                 child: Container(
                  //                   width: 176.w,
                  //                   height: 279.h,
                  //                   decoration: BoxDecoration(
                  //                       color: card.color,
                  //                       borderRadius: BorderRadius.circular(10.r)
                  //                   ),
                  //                 ),
                  //               );
                  //             }),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   }
                  // ),

                  Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
                    return Padding(
                      padding: EdgeInsets.only(left: isScrolling ? 0 : 93.w),
                      child: SizedBox(
                        height: 279.h,
                        width: MediaQuery.of(context).size.width,
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (scrollNotification) {
                            if (scrollNotification is ScrollStartNotification) {
                              setState(() {
                                isScrolling = true;
                                // debugPrint("Is scrolling: $isScrolling");
                              });
                              // _onStartScroll(scrollNotification.metrics);
                            } else if (scrollNotification
                                is ScrollUpdateNotification) {
                              setState(() {
                                isScrolling = true;
                                // debugPrint("Is scrolling: $isScrolling");
                              });
                            } else if (scrollNotification
                                is ScrollEndNotification) {
                              setState(() {
                                isScrolling = false;
                                _scrollToTop();
                                // debugPrint("Is scrolling: $isScrolling");
                              });
                            }
                            return true;
                          },
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              controller: _mainScreenController,
                              itemCount: cardProvider.cards.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final card = cardProvider.cards[index];
                                return Padding(
                                  padding: EdgeInsets.only(right: 18.w),
                                  child: Container(
                                    width: 176.h,
                                    height: 279.w,
                                    decoration: card.isGradient
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  card.beginColor,
                                                  card.endColor
                                                ]))
                                        : BoxDecoration(
                                            color: card.color,
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 51.h,
                                        ),
                                        SizedBox(
                                          width: 55.w,
                                          height: 177.h,
                                          child: Image.asset(kavlrRotated),
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 6.w, bottom: 6.h),
                                              child: SvgPicture.asset(visaLogo),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    );
                  }),

                  SizedBox(
                    height: 33.h,
                  ),

                  Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            cardProvider.changeCurrentIndex(0);
                          },
                          child: Container(
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                                color: cardProvider.currentIndex == 0
                                    ? white
                                    : appBgColor,
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(
                                    color: cardProvider.currentIndex == 0
                                        ? lightBlueTextColor
                                        : Colors.transparent)),
                            child: Container(
                              padding: EdgeInsets.all(2.r),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(32, 86, 190, 1),
                                        Color.fromRGBO(135, 8, 190, 1),
                                      ]),
                                  borderRadius: BorderRadius.circular(100.r)),
                              height:
                                  cardProvider.currentIndex == 0 ? 30.h : 20.h,
                              width:
                                  cardProvider.currentIndex == 0 ? 30.h : 20.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        InkWell(
                          onTap: () {
                            cardProvider.changeCurrentIndex(1);
                          },
                          child: Container(
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                                color: cardProvider.currentIndex == 1
                                    ? white
                                    : appBgColor,
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(
                                    color: cardProvider.currentIndex == 1
                                        ? lightBlueTextColor
                                        : Colors.transparent)),
                            child: Container(
                              padding: EdgeInsets.all(2.r),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(123, 97, 255, 1),
                                  borderRadius: BorderRadius.circular(100.r)),
                              height:
                                  cardProvider.currentIndex == 1 ? 30.h : 20.h,
                              width:
                                  cardProvider.currentIndex == 1 ? 30.h : 20.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        InkWell(
                          onTap: () {
                            cardProvider.changeCurrentIndex(2);
                          },
                          child: Container(
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                                color: cardProvider.currentIndex == 2
                                    ? white
                                    : appBgColor,
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(
                                    color: cardProvider.currentIndex == 2
                                        ? lightBlueTextColor
                                        : Colors.transparent)),
                            child: Container(
                              padding: EdgeInsets.all(2.r),
                              decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(100.r)),
                              height:
                                  cardProvider.currentIndex == 2 ? 30.h : 20.h,
                              width:
                                  cardProvider.currentIndex == 2 ? 30.h : 20.h,
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                  SizedBox(
                    height: 38.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        CustomField(
                          userId,
                          userIdController,
                          type: TextInputType.text,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomField(
                          nameOnCard,
                          nameOnCardController,
                          type: TextInputType.text,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Consumer<CardProvider>(
                            builder: (ctx, cardProvider, child) {
                          return CustomDropdownButton(
                            onTap: () {
                              showSelectAccountModal(context);
                            },
                            title: cardProvider.selectedAccount == null
                                ? "Account to link card with"
                                : cardProvider.selectedAccount!.accountName,
                            textColor: cardProvider.selectedAccount == null
                                ? const Color.fromRGBO(113, 113, 113, 1)
                                : black,
                            fontWeight: regularFont,
                          );
                        }),
                        SizedBox(
                          height: 33.h,
                        ),
                        Consumer<CardProvider>(
                            builder: (ctx, cardProvider, child) {
                          return MainButton(
                            createVirtualCard,
                            () {
                              if (nameOnCardController.text
                                      .toString()
                                      .isEmpty ||
                                  cardProvider.selectedAccount == null) {
                              } else {
                                if (cardProvider.currentIndex == 0) {
                                  final newCard = UserCard(
                                    color: initialCards[0].color,
                                    isGradient: true,
                                    userId: userIdController.text,
                                    nameOnCard: nameOnCardController.text,
                                  );
                                  cardProvider.updateAddedCard(newCard);
                                } else if (cardProvider.currentIndex == 1) {
                                  final newCard = UserCard(
                                    color: purpleCardFirst[0].color,
                                    isGradient: false,
                                    userId: userIdController.text,
                                    nameOnCard: nameOnCardController.text,
                                  );
                                  cardProvider.updateAddedCard(newCard);
                                } else if (cardProvider.currentIndex == 2) {
                                  final newCard = UserCard(
                                    color: blackCardFirst[0].color,
                                    isGradient: false,
                                    userId: userIdController.text,
                                    nameOnCard: nameOnCardController.text,
                                  );
                                  cardProvider.updateAddedCard(newCard);
                                }
                              }
                              navToWithScreenName(
                                  context: context,
                                  screen:
                                      const CardCreatedSuccessfullyScreen());
                              // navTo(
                              //     context: context,
                              //     path: Routes.cardCreatedSuccessfullyScreen);
                            },
                            color: black,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
