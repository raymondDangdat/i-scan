import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Utils/functions.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class WebHashPaymentCreatedScreenScreen extends StatefulWidget {
  const WebHashPaymentCreatedScreenScreen({Key? key}) : super(key: key);

  @override
  State<WebHashPaymentCreatedScreenScreen> createState() =>
      _WebHashPaymentCreatedScreenScreenState();
}

class _WebHashPaymentCreatedScreenScreenState
    extends State<WebHashPaymentCreatedScreenScreen> {
  bool showBalance = true;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          // top: false,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IScanAppBar(
                title: "",
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleWidget(
                      title: hashPayment,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const BodyTextPrimaryWithLineHeight(
                      text: payWithoutADebitCardOnAnuLocalPAymentGateway,
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(13.r)),
                  child: Column(
                    children: [
                      Container(
                        height: 120.h,
                        width: 120.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(moneySentImg),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TitleWidget(
                        title: yourPayIdIsReady,
                        fontSize: 18,
                      ),
                      const BodyTextPrimaryWithLineHeight(
                        text: itWillExpireIn1oMinutes,
                        fontSize: 13,
                        fontWeight: mediumFont,
                        textColor: Color(0xFF676767),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      CustomContainerButton(
                        onTap: () {},
                        title: "",
                        bgColor: const Color(0x47FDD873),
                        widget: Row(
                          children: [
                            SvgPicture.asset(smallFlagIcon),
                            SizedBox(
                              width: 13.w,
                            ),
                            const BodyTextPrimaryWithLineHeight(
                              text: weWillNeverAskYouForYourPayId,
                              fontSize: 12,
                              fontWeight: mediumFont,
                              textColor: black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      CustomContainerButton(
                        onTap: () {},
                        title: "",
                        bgColor: black,
                        borderRadius: 12,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BodyTextPrimaryWithLineHeight(
                              text: yourHashPayId,
                              fontSize: 13,
                              fontWeight: mediumFont,
                              textColor: white,
                            ),
                            InkWell(
                              onTap: () {
                                copyToClipboard("657284");
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Iconsax.document_copy,
                                    color: white,
                                    size: 24.h,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  const BodyTextPrimaryWithLineHeight(
                                    text: "657284",
                                    fontSize: 16,
                                    fontWeight: boldFont,
                                    textColor: white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: MainButton(done, () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
              ),
              SizedBox(
                height: bottomPadding.h,
              ),
            ],
          )),
    );
  }
}
