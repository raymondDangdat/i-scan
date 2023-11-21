import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Widgets/arrow_back_icon.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/textfields.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final dobController = TextEditingController();

  @override
  void initState() {
    firstNameController.text = "Nelson";
    lastNameController.text = "Mojolaoluwa";
    emailController.text = "nelson@gmail.com";
    mobileNumberController.text = "7373446346346";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopPadding(),
          const ArrowBackWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 38.h,
                ),
                const SemiBold14px(
                  text: profile,
                  textColor: Color.fromRGBO(65, 65, 65, 1),
                  fontWeight: boldFont,
                  fontSize: 20,
                ),
                SizedBox(
                  height: 9.h,
                ),
                const SemiBold14px(
                  text: "Select currency below to view history",
                  textColor: Color.fromRGBO(52, 52, 52, 1),
                  fontWeight: mediumFont,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 29.h,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SemiBold14px(
                    text: firstName,
                    textColor: Color.fromRGBO(139, 139, 139, 1),
                    fontWeight: mediumFont,
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  CustomField(
                    "",
                    firstNameController,
                    labelText: "",
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  const SemiBold14px(
                    text: lastName,
                    textColor: Color.fromRGBO(139, 139, 139, 1),
                    fontWeight: mediumFont,
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  CustomField(
                    "",
                    lastNameController,
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  const SemiBold14px(
                    text: phoneNumber,
                    textColor: Color.fromRGBO(139, 139, 139, 1),
                    fontWeight: mediumFont,
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  CustomField(
                    "",
                    mobileNumberController,
                    suffixText: "verified",
                    suffixTextColor: const Color.fromRGBO(13, 203, 142, 1),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  const SemiBold14px(
                    text: emailAddress,
                    textColor: Color.fromRGBO(139, 139, 139, 1),
                    fontWeight: mediumFont,
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  CustomField("", emailController,
                      suffixText: "verified",
                      suffixTextColor: const Color.fromRGBO(13, 203, 142, 1)),
                  SizedBox(
                    height: 23.h,
                  ),
                  const SemiBold14px(
                    text: dateOfBirth,
                    textColor: Color.fromRGBO(139, 139, 139, 1),
                    fontWeight: mediumFont,
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  CustomField(
                    "",
                    dobController,
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(editCalenderIcon),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      )),
    );
  }
}
