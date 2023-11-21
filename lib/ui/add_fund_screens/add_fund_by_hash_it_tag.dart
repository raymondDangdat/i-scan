import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../Utils/functions.dart';
import '../../Widgets/custom_text.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';

class AddFundByHashITTagScreen extends StatefulWidget {
  const AddFundByHashITTagScreen({Key? key}) : super(key: key);

  @override
  State<AddFundByHashITTagScreen> createState() =>
      _AddFundByHashITTagScreenState();
}

class _AddFundByHashITTagScreenState extends State<AddFundByHashITTagScreen> {
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
                      text: addByHashItTag,
                      fontWeight: boldFont,
                      textColor: black,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                        width: 250.w,
                        child: CustomTextWithLineHeight(
                          text: receiveMoneyFromYourFriends,
                          fontWeight: mediumFont,
                          textColor:
                              Colors.black.withOpacity(0.5799999833106995),
                          fontSize: 12,
                        )),
                    SizedBox(
                      height: 28.h,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(13.r)),
                        padding: EdgeInsets.only(
                          top: 21.h,
                          left: 23.w,
                          right: 23.w,
                          bottom: 35.h,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 96.h,
                                      width: 210.h,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(fundWithHashItImg),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 34.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomTextWithLineHeight(
                                        text: "Hi, ",
                                        fontWeight: boldFont,
                                        textColor: black,
                                        fontSize: 24,
                                      ),
                                      SvgPicture.asset(hashSign),
                                      const CustomTextWithLineHeight(
                                        text: "nelson!",
                                        fontWeight: boldFont,
                                        textColor: Color(0xFF313235),
                                        fontSize: 24,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Center(
                                    child: SizedBox(
                                        width: 240.w,
                                        child: CustomTextWithLineHeight(
                                          alignCenter: true,
                                          text: receiveMoneyFromYourFriends,
                                          fontWeight: mediumFont,
                                          textColor: Colors.black
                                              .withOpacity(0.5799999833106995),
                                          fontSize: 13,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 32.h,
                                  ),
                                  CustomContainerButton(
                                    borderRadius: 10,
                                    bgColor: black,
                                    onTap: () {},
                                    title: "",
                                    widget: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CustomTextWithLineHeight(
                                              alignCenter: true,
                                              text: "Your Tag",
                                              fontWeight: mediumFont,
                                              textColor: Colors.white
                                                  .withOpacity(
                                                      0.5799999833106995),
                                              fontSize: 13,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  CustomTextWithLineHeight(
                                                    alignCenter: true,
                                                    text: "#",
                                                    fontWeight: mediumFont,
                                                    textColor: Colors.white
                                                        .withOpacity(
                                                            0.5799999833106995),
                                                    fontSize: 20,
                                                  ),
                                                  const CustomTextWithLineHeight(
                                                    text: "nelson",
                                                    fontWeight: boldFont,
                                                    textColor: white,
                                                    fontSize: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                debugPrint("Tapped!");
                                                copyToClipboard("Nelson");
                                              },
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Iconsax.document_copy,
                                                    color: white,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  const CustomTextWithLineHeight(
                                                    text: "Copy",
                                                    fontWeight: boldFont,
                                                    textColor: white,
                                                    fontSize: 13,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 178.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: MainButton(share, () {})),
                SizedBox(
                  width: 29.w,
                ),
                Expanded(
                  child: OutlineBtn(done, () {
                    Navigator.pop(context);
                  }),
                )
              ],
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
