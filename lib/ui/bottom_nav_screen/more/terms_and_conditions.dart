import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/string_constants.dart';

class TermsAndConditionsScreen2 extends StatelessWidget {
  const TermsAndConditionsScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        children: [
          const TopPadding(),
          const IScanAppBar(
            title: termsAndConditions,
            titleFontSize: 16,
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(11.r)),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BodyTextPrimaryWithLineHeight(
                            text: termsAndConditions,
                            textColor: black,
                            fontWeight: boldFont,
                            fontSize: 20,
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          const CustomTextNoOverFlow(
                            text:
                                "Lorem ipsum dolor sit amet consectetur. Purus pellentesque sit non nec mattis. Aliquet ornare turpis pharetra bibendum nec arcu. Nulla in bibendum adipiscing eros. Massa pharetra vulputate orci aliquam dictumst. Elementum sit euismod eleifend convallis elementum. Hendrerit et placerat pharetra eu quisque aenean vitae in. Ac vitae ipsum in ligula. Tincidunt sed dolor in sit elit tellus venenatis non montes. Vulputate massa quis gravida mi gravida est. Nunc turpis sed gravida vitae nec pellentesque lacinia vulputate tristique. Lorem ipsum dolor sit amet consectetur. Purus pellentesque sit non nec mattis. Aliquet ornare turpis pharetra bibendum nec arcu. Nulla in bibendum adipiscing eros. Massa pharetra vulputate orci aliquam dictumst. Elementum sit euismod eleifend convallis elementum. Hendrerit et placerat pharetra eu quisque aenean vitae in. Ac vitae ipsum in ligula. Tincidunt sed dolor in sit elit tellus venenatis non montes. Vulputate massa quis gravida mi gravida est. Nunc turpis sed gravida vitae nec pellentesque lacinia vulputate tristique.",
                            textColor: black,
                            lineHeight: 1.9,
                            fontSize: 12,
                            fontWeight: lightFont,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
