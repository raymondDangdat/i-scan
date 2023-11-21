import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/functions.dart';
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
import '../../../../resources/navigation_utils.dart';
import 'info_edited_screen.dart';

class EditUsernameScreen extends StatefulWidget {
  const EditUsernameScreen({Key? key}) : super(key: key);
  @override
  State<EditUsernameScreen> createState() => _EditUsernameScreenState();
}

class _EditUsernameScreenState extends State<EditUsernameScreen> {
  final usernameController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final auth = Provider.of<AuthProvider>(context, listen: false);
      usernameController.text = auth.userProfile?.data.username ?? "";
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
          child: Consumer2<AuthProvider, StateAndCityProvider>(
              builder: (ctx, authProvider, countryProvider, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (authProvider.resMessage != '') {
                customSnackBar(context, authProvider.resMessage);

                ///Clear the response message to avoid duplicate
                authProvider.clear();
              }
            });
            return Column(
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
                          title: editUsername,
                          fontSize: 16,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const CustomTextWithLineHeight(
                          text: youCanSendAndReceiveMoney,
                          textColor: black,
                        ),
                        SizedBox(
                          height: 27.h,
                        ),
                        const LabelWidget(
                          label: username,
                          textColor: black,
                          fontWeight: boldFont,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomField(
                                "Username",
                                usernameController,
                                isCapitalizeSentence: false,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      top: 11.h, right: 2.w, left: 16.w),
                                  child: const CustomTextWithLineHeight(
                                    text: "#",
                                    lineHeight: 1.7,
                                    textColor: Color.fromRGBO(13, 13, 13, 0.54),
                                    fontWeight: boldFont,
                                    fontSize: 12,
                                  ),
                                ),
                                onChange: (value) {
                                  if (value != null &&
                                      value.isNotEmpty &&
                                      value.length > 3) {
                                    authProvider.validateUsername(
                                        username: value, context: context);
                                    // if (!authProvider
                                    //     .searchingForUsername) {
                                    //   authProvider
                                    //       .validateUsername(
                                    //       username: value);
                                    // }
                                  } else {
                                    authProvider.updateUsername("");
                                    // usernameController.text =
                                    //     "";
                                    setState(() {});
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        if (authProvider.username.isNotEmpty ||
                            authProvider.searchingForUsername)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (authProvider.username.isNotEmpty)
                                SvgPicture.asset(verifyUsernameIcon),
                              SizedBox(
                                width: 5.w,
                              ),
                              authProvider.searchingForUsername
                                  ? const CustomTextWithLineHeight(
                                      alignCenter: true,
                                      text: "Checking availability...",
                                      fontWeight: mediumFont,
                                      textColor: black,
                                      fontSize: 12,
                                    )
                                  : const CustomTextWithLineHeight(
                                      alignCenter: true,
                                      text: "Username available",
                                      fontWeight: mediumFont,
                                      textColor: Color(0xFF2B937B),
                                      fontSize: 12,
                                    )
                            ],
                          ),
                        SizedBox(
                          height: 19.h,
                        ),
                        SizedBox(
                          height: 79.h,
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Consumer2<AuthProvider, StateAndCityProvider>(
                      builder: (ctx, authProvider, countryProvider, child) {
                    return MainButton(
                      authProvider.settingUsername
                          ? "Updating..."
                          : updateUsername,
                      () async {
                        if (usernameController.text.length < 2 &&
                            authProvider.username.isNotEmpty) {
                          authProvider.updateUsername("");
                          authProvider
                              .updateProfileEditedMessage(usernameUpdated);
                          customSnackBar(context, "Enter a valid username");
                        } else {
                          if (!authProvider.settingUsername) {
                            bool usernameSetup =
                                await authProvider.setupUsername(
                                    username: usernameController.text,
                                    context: context);
                            if (mounted) {
                              popLoader(context: context);
                            }
                            if (mounted && usernameSetup) {
                              usernameController.text = "";
                              authProvider.updateUsername("");
                              setState(() {});
                              Navigator.pop(context);
                              navToWithScreenName(
                                  context: context,
                                  screen: const InfoEditedScreen());
                              //  navTo(
                              //   context: context,
                              //   path: Routes.profileUpdatedScreen);
                            }
                          }
                        }
                      },
                      color: black,
                    );
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
