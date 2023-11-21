import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_snack_back.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/label_widget.dart';
import '../../../../Widgets/textfields.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/state_and_city_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/string_constants.dart';
import '../../../../resources/navigation_utils.dart';
import 'confirm_email_to_edit_screen.dart';

class EditEmailScreen extends StatefulWidget {
  const EditEmailScreen({Key? key}) : super(key: key);
  @override
  State<EditEmailScreen> createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  final emailController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final auth = Provider.of<AuthProvider>(context, listen: false);
      emailController.text = auth.userProfile?.data.email ?? "";
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                  ),
                ],
              ),
              SizedBox(
                height: 31.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleWidget(
                      title: editEmail,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const CustomTextWithLineHeight(
                      text: wellSendACodeToTheEmail,
                      textColor: black,
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelWidget(
                        label: emailAddress,
                        textColor: black,
                        fontWeight: boldFont,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomField(
                              email,
                              emailController,
                              isCapitalizeSentence: false,
                              type: TextInputType.emailAddress,
                              prefixIcon: const Icon(
                                Iconsax.sms,
                                color: mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Consumer2<AuthProvider, StateAndCityProvider>(
                    builder: (ctx, authProvider, countryProvider, child) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (authProvider.resMessage != '') {
                      customSnackBar(context, authProvider.resMessage);

                      ///Clear the response message to avoid duplicate
                      authProvider.clear();
                    }
                  });
                  return MainButton(
                    authProvider.isLoading ? "Updating..." : updateEmailAddress,
                    () async {
                      if (emailController.text.trim().length < 3) {
                        customSnackBar(context, "Enter a valid email");
                      } else {
                        authProvider.updatePhoneNumberOrEmailToEdit(
                            emailController.text);
                        authProvider.requestOtpForUpdateOrReset(
                            isRequestOtp: true, isEmail: true);
                        navToWithScreenName(
                            context: context,
                            screen: const ConfirmEmailToEditScreen());
                        // navTo(
                        //     context: context,
                        //     path: Routes.confirmEmailToEditScreen);
                      }
                    },
                  );
                }),
              ),
              SizedBox(
                height: bottomPadding.h,
              )
            ],
          )),
    );
  }
}
