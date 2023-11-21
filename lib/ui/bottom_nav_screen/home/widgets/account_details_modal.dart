import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/country_flag_widget.dart';
import '../../../../providers/card_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';
import '../../../../Widgets/custom_text.dart';

Future showAccountDetailsModal(
  BuildContext context,
) {
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        constraints: BoxConstraints(minHeight: 200.h, maxHeight: 290.h),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
        ),
        child: Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 11.h),
              Center(
                child: Container(
                  height: 6.h,
                  width: 91.w,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.06),
                      borderRadius: BorderRadius.circular(100.r)),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SemiBold14pxNoOverFlow(
                        text: seeAccountDetails,
                        textColor: Color.fromRGBO(13, 13, 13, 1),
                        fontWeight: boldFont,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const SemiBold14pxNoOverFlow(
                        text: yourBankAccountShowsHere,
                        textColor: Color.fromRGBO(46, 47, 48, 0.62),
                        fontWeight: mediumFont,
                      ),
                    ],
                  ),
                  SvgPicture.asset(arrowUpIconSvg),
                ],
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SemiBold14pxNoOverFlow(
                    text: "My Account details",
                    textColor: Color.fromRGBO(13, 13, 13, 1),
                    fontWeight: boldFont,
                  ),
                  SizedBox(
                      width: 90.w,
                      height: 32.h,
                      child: OutlineBtn(
                        "",
                        () {},
                        widget: Row(
                          children: [
                            const CustomTextWithLineHeight(
                              text: "NGN",
                              fontSize: 12,
                              fontWeight: boldFont,
                              textColor: Color.fromRGBO(48, 80, 130, 1),
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            const CountryFlagWidget(
                                showBorder: false,
                                dimension: 22,
                                flagUrl: ngnFlag)
                          ],
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              AccountItemWidget(
                title: bankName,
                subTitle: "Providus Bank ",
                tapToCopy: () {},
              ),
              SizedBox(
                height: 24.h,
              ),
              AccountItemWidget(
                title: accountName,
                subTitle: "Nelson Mojolaoluwa",
                tapToCopy: () {},
              ),
              SizedBox(
                height: 24.h,
              ),
              AccountItemWidget(
                title: accountNumber,
                subTitle: "1111110009",
                tapToCopy: () {},
                showCopyIcon: true,
              ),
            ],
          );
        }),
      );
    }),
  );
}

class AccountItemWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback tapToCopy;
  final bool showCopyIcon;
  const AccountItemWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.tapToCopy,
    this.showCopyIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BodyTextLightWithLineHeight(
          text: title,
          fontWeight: semiBoldFont,
          fontSize: 14,
          textColor: const Color.fromRGBO(0, 0, 0, 0.63),
        ),
        Row(
          children: [
            BodyTextLightWithLineHeight(
              text: subTitle,
              fontWeight: boldFont,
              fontSize: 14,
              textColor: const Color.fromRGBO(43, 43, 43, 1),
            ),
            if (showCopyIcon)
              Row(
                children: [
                  SizedBox(
                    width: 19.w,
                  ),
                  InkWell(
                    onTap: tapToCopy,
                    child: SvgPicture.asset(
                      copyIcon,
                      color: mainColor,
                    ),
                  ),
                ],
              )
          ],
        ),
      ],
    );
  }
}
