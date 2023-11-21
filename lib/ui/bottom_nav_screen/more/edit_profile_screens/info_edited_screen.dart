import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class InfoEditedScreen extends StatefulWidget {
  const InfoEditedScreen({Key? key}) : super(key: key);

  @override
  State<InfoEditedScreen> createState() => _InfoEditedScreenState();
}

class _InfoEditedScreenState extends State<InfoEditedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          bottom: false,
          child: Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 217.h,
                ),
                Center(
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
                        height: 14.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWithLineHeight(
                              text: authProvider.profileEditedMessage,
                              fontSize: 16,
                              alignCenter: true,
                              textColor: const Color(0xFF282828),
                              fontWeight: boldFont),
                          SizedBox(
                            width: 6.w,
                          ),
                          SizedBox(
                            height: 30.h,
                            width: 30.h,
                            child: Image.asset(congratulationsImgPng),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: MainButton(continueTo, () {
                    Navigator.pop(context);
                  }),
                ),
                SizedBox(
                  height: bottomPadding.h,
                ),
              ],
            );
          })),
    );
  }
}
