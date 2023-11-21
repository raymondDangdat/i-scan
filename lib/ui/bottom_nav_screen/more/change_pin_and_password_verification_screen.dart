import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/success_screen.dart';
import '../../../Widgets/textfields.dart';
import '../../../providers/success_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';

class ChangePinAndPasswordVerificationScreen extends StatefulWidget {
  const ChangePinAndPasswordVerificationScreen({Key? key}) : super(key: key);

  @override
  State<ChangePinAndPasswordVerificationScreen> createState() =>
      _ChangePinAndPasswordVerificationScreenState();
}

class _ChangePinAndPasswordVerificationScreenState
    extends State<ChangePinAndPasswordVerificationScreen> {
  final verificationCodeController = TextEditingController();

  @override
  void initState() {
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
          const IScanAppBar(
            title: verification,
            showWidget: true,
            showBackButton: false,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  const BodyTextLightWithLineHeight(
                    text: weHaveSentYouAUnique,
                    textColor: Color.fromRGBO(14, 14, 14, 1),
                    fontSize: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 28.h,
                      ),
                      CustomField(
                        "Email Verification Code",
                        verificationCodeController,
                        type: TextInputType.number,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      const BodyTextLightWithLineHeight(
                        text:
                            "Enter the 6-digit code sent to nelson***@gmai.com",
                        textColor: Color.fromRGBO(14, 14, 14, 1),
                        fontSize: 12,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const BodyTextLightWithLineHeight(
                        text: resend,
                        textColor: lightBlueTextColor,
                        fontSize: 12,
                        fontWeight: boldFont,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Consumer<SuccessProvider>(
                builder: (ctx, successProvider, child) {
              return MainButton(
                verify,
                () {
                  // navToWithScreenName(
                  //     context: context, screen: SuccessScreen());
                  // navTo(context: context, path: Routes.successScreen);
                },
                color: black,
              );
            }),
          )
        ],
      )),
    );
  }
}
