import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../providers/help_and_support_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';

class FaqDetailScreen extends StatelessWidget {
  const FaqDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faqProvider = context.watch<HelpAndSupportProvider>();
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        children: [
          const TopPadding(),
          IScanAppBar(
            title: faqProvider.selectedFaq!.title,
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
                        children: [
                          BodyTextPrimaryWithLineHeight(
                            text: faqProvider.selectedFaq!.title,
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
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              const BodyTextPrimaryWithLineHeight(
                                text: "Vanessa",
                                textColor: Color.fromRGBO(121, 118, 118, 1),
                                fontSize: 10,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Container(
                                width: 5.h,
                                height: 5.h,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(121, 118, 118, 1),
                                    borderRadius: BorderRadius.circular(100.r)),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              BodyTextPrimaryWithLineHeight(
                                text: faqProvider.selectedFaq!.dateAnswered,
                                textColor:
                                    const Color.fromRGBO(121, 118, 118, 1),
                                fontSize: 10,
                              ),
                            ],
                          )
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
