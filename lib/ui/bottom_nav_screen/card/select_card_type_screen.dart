import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_card.dart';
import '../../../Widgets/custom_text.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';
import 'create_virtual_card_screen.dart';

class SelectCardTypeScreen extends StatelessWidget {
  const SelectCardTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        children: [
          const TopPadding(),
          const IScanAppBar(
            title: kavlrCard,
          ),
          SizedBox(
            height: 76.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 232.h,
                    width: 255.w,
                    child: Image.asset(createCardCard),
                  ),
                  SizedBox(
                    height: 91.h,
                  ),
                  const BodyTextPrimaryWithLineHeight(
                    text: createANewCard,
                    fontWeight: boldFont,
                    textColor: black,
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  const BodyTextPrimaryWithLineHeight(
                    text: chooseCardType,
                    fontSize: 10,
                    textColor: Color.fromRGBO(99, 99, 99, 1),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  CustomListTile(
                    leadingIcon: debitCardIcon,
                    titleColor: white,
                    title: virtualCard,
                    subTitle: createAndTopUpYour,
                    bgColor: const Color.fromRGBO(0, 87, 255, 1),
                    onTap: () {
                      navToWithScreenName(
                          context: context,
                          screen: const CreateVirtualCardScreen());
                      // navTo(context: context, path: Routes.createVirtualScreen);
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomListTile(
                    title: physicalCard,
                    subTitle: createAndTopUpYourCardWithCash,
                    bgColor: const Color.fromRGBO(123, 97, 255, 1),
                    onTap: () {},
                    titleColor: white,
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
