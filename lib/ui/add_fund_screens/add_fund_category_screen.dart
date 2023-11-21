import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/ui/add_fund_screens/request_fund_screen.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../Widgets/custom_text.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';
import '../../resources/navigation_utils.dart';
import 'add_fund_by_card_screen.dart';
import 'add_fund_by_hash_it_tag.dart';
import 'add_fund_by_transfer.dart';
import 'add_fund_by_ussd_screen.dart';

class AddFundCategoryScreen extends StatefulWidget {
  const AddFundCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddFundCategoryScreen> createState() => _AddFundCategoryScreenState();
}

class _AddFundCategoryScreenState extends State<AddFundCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopPadding(),
          const IScanAppBar(
            title: "",
          ),
          SizedBox(
            height: 26.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWithLineHeight(
                      text: "Add Fund",
                      fontWeight: boldFont,
                      textColor: black,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextWithLineHeight(
                      text: chooseAnOptionToAddMoney,
                      fontWeight: mediumFont,
                      textColor: Colors.black.withOpacity(0.5799999833106995),
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    AddFundItemWidget(
                        title: bankTransfer,
                        icon: bankTransferIconPng,
                        subTitle: fromBankApp,
                        onTap: () {
                          navToWithScreenName(
                              context: context,
                              screen: const AddFundByBankTransferScreen());
                          // navTo(
                          //     context: context,
                          //     path: Routes.addFundByBankTransferScreen);
                        }),
                    SizedBox(
                      height: 18.h,
                    ),
                    AddFundItemWidget(
                        title: hashItWithYourUsername,
                        icon: hashItSmall,
                        subTitle: receiveMoneyFromOtherHashITUsers,
                        onTap: () {
                          navToWithScreenName(
                              context: context,
                              screen: const AddFundByHashITTagScreen());
                          // navTo(
                          //     context: context,
                          //     path: Routes.addFundByHashItTag);
                        }),
                    SizedBox(
                      height: 18.h,
                    ),
                    AddFundItemWidget(
                        title: ussd,
                        icon: ussdIcon,
                        subTitle: withOtherBanksUssd,
                        onTap: () {
                          navToWithScreenName(
                              context: context,
                              screen: const AddFundByUSSDScreen());
                          // navTo(
                          //     context: context,
                          //     path: Routes.addFundByUSSDScreen);
                        }),
                    SizedBox(
                      height: 18.h,
                    ),
                    AddFundItemWidget(
                        title: deviceChanged,
                        icon: requestMoneyIcon,
                        subTitle: addMoneyWithADebitCard,
                        onTap: () {
                          navToWithScreenName(
                              context: context,
                              screen: const RequestFundScreen());
                        }),
                    SizedBox(
                      height: 18.h,
                    ),
                    AddFundItemWidget(
                        title: card,
                        icon: cardIcon,
                        subTitle: requestMoneyFromFriends,
                        onTap: () {
                          navToWithScreenName(
                              context: context,
                              screen: const AddByCardScreen());
                          // navTo(
                          //     context: context,
                          //     path: Routes.addFundByCardScreen);
                        }),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          )
        ],
      )),
    );
  }
}

class AddFundItemWidget extends StatelessWidget {
  final String title;
  final String icon;
  final String subTitle;
  final VoidCallback onTap;
  const AddFundItemWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.subTitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(10.r)),
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 13.h,
        ),
        child: Row(
          children: [
            Container(
              height: 46.h,
              width: 46.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(icon), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 11.w,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWithLineHeight(
                  text: title,
                  fontWeight: boldFont,
                  textColor: black,
                  fontSize: 14,
                ),
                CustomTextWithLineHeight(
                  text: subTitle,
                  fontWeight: mediumFont,
                  textColor: const Color(0x93282828),
                  fontSize: 12,
                ),
              ],
            )),
            Icon(
              Icons.arrow_forward_ios,
              size: 15.h,
              color: const Color.fromRGBO(41, 45, 50, 1),
            )
          ],
        ),
      ),
    );
  }
}
