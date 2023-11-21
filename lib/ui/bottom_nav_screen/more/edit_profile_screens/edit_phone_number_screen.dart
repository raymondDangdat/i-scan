import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../Utils/go_router_route_names.dart';
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
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class EditPhoneNumberScreen extends StatefulWidget {
  const EditPhoneNumberScreen({Key? key}) : super(key: key);
  @override
  State<EditPhoneNumberScreen> createState() => _EditPhoneNumberScreenState();
}

class _EditPhoneNumberScreenState extends State<EditPhoneNumberScreen> {
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final auth = Provider.of<AuthProvider>(context, listen: false);
      phoneNumberController.text = auth.userProfile?.data.phoneNumber ?? "";
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
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWidget(
                        title: editPhoneNumber,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      // const CustomTextWithLineHeight(text: openAHashitAccount,
                      //   textColor: black,
                      // ),
                      SizedBox(
                        height: 31.h,
                      ),
                      const LabelWidget(
                        label: phoneNumber,
                        textColor: black,
                        fontWeight: boldFont,
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
                                    //     : Container(
                                    //   height: 22.h,
                                    //   width: 22.h,
                                    //   decoration: BoxDecoration(
                                    //     // color: mainColor,
                                    //     borderRadius: BorderRadius.circular(30.r),
                                    //     image:  DecorationImage(image: NetworkImage(countryProvider.selectedCountry.logo ?? "")),
                                    //     // borderRadius: BorderRadius.circular(100.r)
                                    //   ),
                                    // ),
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
                    authProvider.isLoading ? "Updating..." : updatePhoneNumber,
                    () async {
                      if (phoneNumberController.text.trim().length < 9) {
                        customSnackBar(context, "Enter a valid phone number");
                      } else {
                        authProvider.updatePhoneNumberOrEmailToEdit(
                            phoneNumberController.text
                                    .toString()
                                    .startsWith("0")
                                ? phoneNumberController.text
                                : '0${phoneNumberController.text}');
                        authProvider.requestOtpForUpdateOrReset(
                            isRequestOtp: true, isEmail: false);
                        context.goNamed(confirmPhoneNumberRouteName);
                        //   navToWithScreenName(
                        // context: context, screen: const ConfirmYourPhoneNumberScreen());
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
