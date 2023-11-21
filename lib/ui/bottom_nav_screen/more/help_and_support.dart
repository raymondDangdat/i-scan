import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_scan/ui/bottom_nav_screen/more/terms_and_conditions.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';
import 'faq_screen.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        children: [
          const TopPadding(),
          const IScanAppBar(
            title: helpAndSupport,
          ),
          SizedBox(
            height: 38.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 122.h,
                    width: 122.w,
                    child: Image.asset(chatBubble),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  SizedBox(
                    width: 162.w,
                    child: const CustomTextNoOverFlow(
                      text: "How can we help you, Nelson?",
                      alignment: 'center',
                      fontSize: 18,
                      textColor: black,
                      fontWeight: boldFont,
                    ),
                  ),
                  SizedBox(
                    height: 83.h,
                  ),
                  CustomContainerButton(
                    onTap: () {},
                    title: "",
                    bgColor: const Color.fromRGBO(0, 0, 0, 0.05),
                    verticalPadding: 15.h,
                    widget: const BodyTextLightWithLineHeight(
                      text: possibleHelpTopics,
                      textColor: Color.fromRGBO(141, 141, 141, 1),
                      fontSize: 12,
                      fontWeight: mediumFont,
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  ItemWidget(
                    title: chatWithUs,
                    iconName: chatWithUsIcon,
                    showTrailingIcon: true,
                    onTap: () {
                      // navToWithScreenName(
                      //     context: context, screen: const ChatWith());
                      // navTo(context: context, path: Routes.chatWithUsScreen);
                    },
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  ItemWidget(
                    title: faqs,
                    iconName: helpIcon,
                    subTitle: getAnswersToFaq,
                    onTap: () {
                      navToWithScreenName(
                          context: context, screen: const FaqScreen());
                      // navTo(context: context, path: Routes.faqScreen);
                    },
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  ItemWidget(
                    title: termsAndConditions,
                    iconName: termsAndConditionIcon,
                    subTitle: getAnswersToFaq,
                    onTap: () {
                      navToWithScreenName(
                          context: context,
                          screen: const TermsAndConditionsScreen2());
                      // navTo(
                      //     context: context,
                      //     path: Routes.termsAndConditionsScreen2);
                    },
                  )
                ],
              ),
            ),
          )
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
