import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/long_divider.dart';
import '../../../model/faq_model.dart';
import '../../../providers/help_and_support_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';
import 'faq_screen_details.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  List<String> faqTitles = [];
  List<String> uniqFaqTitles = [];
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < faqsList.length; i++) {
      if (faqTitles.contains(faqsList[i].category)) {
        // SKIP
      } else {
        faqTitles.add(faqsList[i].category);
      }

      uniqFaqTitles = faqTitles.toSet().toList();
      setState(() {});
    }
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
            title: possibleHelpTopics,
          ),
          SizedBox(
            height: 38.h,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      itemCount: uniqFaqTitles.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final category = uniqFaqTitles[index];
                        final faqsHere = faqsList
                            .where((faq) => faq.category == category)
                            .toList();
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            padding: EdgeInsets.all(15.r),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(11.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyTextPrimaryWithLineHeight(
                                  text: category,
                                  fontSize: 14,
                                  fontWeight: boldFont,
                                  textColor: black,
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                ListView.builder(
                                    itemCount: faqsHere.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final faq = faqsHere[index];
                                      return Consumer<HelpAndSupportProvider>(
                                          builder: (ctx, helpAndSupportProvider,
                                              child) {
                                        return InkWell(
                                          onTap: () {
                                            helpAndSupportProvider
                                                .updateFaq(faq);
                                            navToWithScreenName(
                                                context: context,
                                                screen:
                                                    const FaqDetailScreen());
                                            // navTo(
                                            //     context: context,
                                            //     path: Routes.faqDetailScreen);
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              BodyTextPrimaryWithLineHeight(
                                                text: faq.title,
                                                fontSize: 13,
                                                fontWeight: mediumFont,
                                                textColor: black,
                                              ),
                                              SizedBox(
                                                height: 14.h,
                                              ),
                                              if (index < faqsHere.length - 1)
                                                const LongDivider(),
                                              if (index < faqsHere.length - 1)
                                                SizedBox(
                                                  height: 14.h,
                                                ),
                                            ],
                                          ),
                                        );
                                      });
                                    })
                              ],
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: lightBlueTextColor,
                        borderRadius: BorderRadius.circular(14.r)),
                    padding: EdgeInsets.all(17.r),
                    child: Column(
                      children: [
                        const BodyTextPrimaryWithLineHeight(
                          text: stillCantFindWhatYouAreLookingFor,
                          fontSize: 13,
                          fontWeight: mediumFont,
                          textColor: white,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Consumer<HelpAndSupportProvider>(
                            builder: (ctx, successProvider, child) {
                          return MainButton(
                            color: white,
                            chatWithUs,
                            () {},
                            textColor: lightBlueTextColor,
                          );
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        ],
      )),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String iconName;
  final bool showTrailingIcon;
  final VoidCallback onTap;
  const ItemWidget(
      {Key? key,
      required this.title,
      this.subTitle = "",
      this.showTrailingIcon = false,
      required this.onTap,
      required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerButton(
        onTap: onTap,
        title: "",
        bgColor: white,
        verticalPadding: 8.h,
        horizontalPadding: 11.w,
        widget: Row(
          children: [
            Container(
              height: 33.h,
              width: 33.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(iconName), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 14.w,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BodyTextLightWithLineHeight(
                  text: title,
                  textColor: black,
                  fontWeight: mediumFont,
                ),
                if (subTitle.isNotEmpty)
                  BodyTextLightWithLineHeight(
                    text: subTitle,
                    fontSize: 10,
                    textColor: const Color.fromRGBO(40, 40, 40, 0.58),
                    fontWeight: mediumFont,
                  ),
              ],
            )),
            if (showTrailingIcon)
              SizedBox(
                height: 28.h,
                width: 22.w,
                child: SvgPicture.asset(forwardArrow),
              )
          ],
        ));
  }
}
