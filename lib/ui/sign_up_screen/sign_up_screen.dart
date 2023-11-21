import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:i_scan/Utils/constants.dart';
import 'package:i_scan/Utils/functions.dart';
import 'package:i_scan/Utils/go_router_route_names.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_snack_back.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/textfields.dart';
import '../../../model/first_step_account_creationl.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/state_and_city_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/string_constants.dart';
import '../../Widgets/title_widget.dart';
import '../../resources/constants/dimension_constants.dart';
import '../../resources/constants/image_constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final yearsOfExperienceController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final rankController = TextEditingController();

  bool obscure = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final auth = Provider.of<AuthProvider>(context, listen: false);
      //  Get the device ID information
      auth.getDeviceInfo();
    });
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
                height: topPadding.h,
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
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWidget(
                        title: signUp,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const CustomTextWithLineHeight(
                        text: openYourIScanAccount,
                        textColor: black,
                      ),
                      SizedBox(
                        height: 31.h,
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
                      SizedBox(
                        height: 19.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomField(
                              firstName,
                              firstNameController,
                              isCapitalizeSentence: false,
                              type: TextInputType.name,
                              prefixIcon: const Icon(
                                Iconsax.user,
                                color: mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomField(
                              lastName,
                              lastNameController,
                              isCapitalizeSentence: false,
                              type: TextInputType.name,
                              prefixIcon: const Icon(
                                Iconsax.user,
                                color: mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomField(
                              yearsOfExperience,
                              yearsOfExperienceController,
                              isCapitalizeSentence: false,
                              formatters: numbersOnlyFormat,
                              prefixIcon: const Icon(
                                Iconsax.add,
                                color: mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      const CustomTextWithLineHeight(
                        text: phoneNumber,
                        textColor: Color(0xFF333333),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Row(
                        children: [
                          Consumer<StateAndCityProvider>(
                              builder: (ctx, countryProvider, child) {
                            return InkWell(
                              onTap: () {
                                // showCountrySelectionModal(context);
                              },
                              child: Container(
                                height: 48.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 14.h),
                                decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(color: borderGrey),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Row(
                                  children: [
                                    // countryProvider.selectedCountry.logo.toString().endsWith(".svg") ?
                                    Container(
                                      height: 22.h,
                                      width: 22.h,
                                      decoration: BoxDecoration(
                                        // color: mainColor,
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        image: const DecorationImage(
                                            image: AssetImage(nigerianFlag),
                                            fit: BoxFit.cover),
                                        // borderRadius: BorderRadius.circular(100.r)
                                      ),
                                      // child: SvgPicture.network("https://img.uxwing.com/wp-content/themes/uxwing/download/flags-landmarks/nigeria-flag-icon.svg"),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    const BodyTextPrimaryWithLineHeight(
                                      text: "+234",
                                      fontSize: 12,
                                      fontWeight: mediumFont,
                                      textColor: black,
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                            child: CustomField(
                              phoneNumber,
                              phoneNumberController,
                              length: 11,
                              type: TextInputType.phone,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 19.h),
                      const CustomTextWithLineHeight(
                        text: password,
                        textColor: Color.fromRGBO(139, 139, 139, 1),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      PwdField(
                        hint: password,
                        controller: passwordController,
                        isObscured: obscure,
                        hasBorder: true,
                        prefixIcon: const Icon(
                          Iconsax.lock,
                          color: prefixIconColor,
                        ),
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      PwdField(
                        hint: confirmPassword,
                        controller: confirmPasswordController,
                        isObscured: obscure,
                        hasBorder: true,
                        prefixIcon: const Icon(
                          Iconsax.lock,
                          color: prefixIconColor,
                        ),
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomField(
                              "e.g Consultant",
                              rankController,
                              type: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Consumer2<AuthProvider, StateAndCityProvider>(
                          builder: (ctx, authProvider, countryProvider, child) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (authProvider.resMessage != '') {
                            customSnackBar(context, authProvider.resMessage);

                            ///Clear the response message to avoid duplicate
                            authProvider.clear();
                          }
                        });
                        return MainButton(
                          signUp,
                          () async {
                            if (emailController.text.length < 4) {
                              customSnackBar(
                                  context, "Please enter a valid email");
                            } else if (firstNameController.text.length < 2) {
                              customSnackBar(
                                  context, "Enter a valid first name");
                            } else if (lastNameController.text.length < 2) {
                              customSnackBar(
                                  context, "Enter a valid last name");
                            } else if (yearsOfExperienceController
                                .text.isEmpty) {
                              customSnackBar(
                                  context, "Enter a valid years of experience");
                            } else if (rankController.text.isEmpty) {
                              customSnackBar(context, "Enter a valid rank");
                            } else if (passwordController.text.trim().length <
                                8) {
                              customSnackBar(context,
                                  "Password must be at least 8 characters");
                            } else if (phoneNumberController.text
                                    .trim()
                                    .length <
                                9) {
                              customSnackBar(
                                  context, "Enter a valid phone number");
                            } else if (passwordController.text !=
                                confirmPasswordController.text) {
                              customSnackBar(context, "Password mismatch");
                            } else {
                              final createAccountInfo = FirstStepAccountCreation(
                                  rank: rankController.text.trim(),
                                  countryCode: "+234",
                                  phoneNumber: phoneNumberController.text
                                          .startsWith("0")
                                      ? phoneNumberController.text.trim()
                                      : "0${phoneNumberController.text.trim()}",
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  deviceId: authProvider.deviceId,
                                  yearsOfExperience:
                                      yearsOfExperienceController.text);

                              authProvider
                                  .updatedCreateAccountInfo(createAccountInfo);

                              User? user = await authProvider
                                  .firebaseSignUpWithEmailAndPassword(
                                      context: context);
                              if (context.mounted) {
                                popLoader(context: context);
                              }

                              if (mounted && user != null) {
                                debugPrint("Everything set!!!!!!!!");
                                customSnackBar(context, "Account Created!");
                                context.goNamed(loginRouteName);
                              }
                            }
                          },
                          color: black,
                        );
                      }),
                      SizedBox(
                        height: 79.h,
                      ),
                      const SizedBox(
                        width: 345,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'By tapping ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: '"Next"',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: ', you agree to our ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms &\nConditions and Policy Privacy',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
