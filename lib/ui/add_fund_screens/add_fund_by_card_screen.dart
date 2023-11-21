import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../Widgets/custom_text.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';

class AddByCardScreen extends StatefulWidget {
  const AddByCardScreen({Key? key}) : super(key: key);

  @override
  State<AddByCardScreen> createState() => _AddByCardScreenState();
}

class _AddByCardScreenState extends State<AddByCardScreen> {
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
                      text: addByCard,
                      fontWeight: boldFont,
                      textColor: black,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextWithLineHeight(
                      text: youWillBeChargeBy,
                      fontWeight: mediumFont,
                      textColor: Colors.black.withOpacity(0.5799999833106995),
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: const Color(0x47FDD873)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWithLineHeight(
                            text: "Naira card",
                            fontWeight: boldFont,
                            textColor:
                                Colors.black.withOpacity(0.47999998927116394),
                            fontSize: 12,
                          ),
                          const CustomTextWithLineHeight(
                            text: "NGN100 + 1.5% of Fund Added",
                            fontWeight: mediumFont,
                            textColor: black,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(13.r)),
                      padding: EdgeInsets.only(
                        top: 57.h,
                        left: 23.w,
                        right: 23.w,
                        bottom: 35.h,
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 122.h,
                              width: 122.h,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(cardEmptyState),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CustomTextWithLineHeight(
                            text: youHaveNotAddedAnyCard,
                            fontWeight: boldFont,
                            textColor: Color(0xFF1A202C),
                            fontSize: 18,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                              width: 250.w,
                              child: const CustomTextWithLineHeight(
                                alignCenter: true,
                                text: yourSaveCardsWillAppearHere,
                                fontWeight: mediumFont,
                                textColor: Color(0xFF676767),
                                fontSize: 13,
                              )),
                          SizedBox(
                            height: 52.h,
                          ),
                          SizedBox(
                            width: 130.w,
                            child: MainButton(
                              addNewCard,
                              () {},
                              color: Colors.black
                                  .withOpacity(0.029999999329447746),
                              textColor: black,
                              fontSize: 14,
                              height: 40,
                            ),
                          )
                        ],
                      ),
                    ),
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
