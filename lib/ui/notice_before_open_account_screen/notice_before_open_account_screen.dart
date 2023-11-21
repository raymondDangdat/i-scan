import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_snack_back.dart';
import '../../../Widgets/custom_text.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/state_and_city_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/string_constants.dart';
import '../../Widgets/title_widget.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/navigation_utils.dart';
import '../confirm_attendance_screen/confirm_attendance_screen.dart';

class NoticeBeforeOpenAccountScreen extends StatefulWidget {
  const NoticeBeforeOpenAccountScreen({Key? key}) : super(key: key);
  @override
  State<NoticeBeforeOpenAccountScreen> createState() =>
      _NoticeBeforeOpenAccountScreenState();
}

class _NoticeBeforeOpenAccountScreenState
    extends State<NoticeBeforeOpenAccountScreen> {
  bool isAgreed = false;

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
                height: 21.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(child: SvgPicture.asset(noticeFlag)),
                      const TitleWidget(
                        title: noticeBeforeYouOpenHashi,
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: const CustomTextWithLineHeight(
                          text: noticeNote,
                          textColor: black,
                          lineHeight: 1.87,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomContainerButton(
                        onTap: () {
                          setState(() {
                            isAgreed = true;
                          });
                        },
                        title: "",
                        borderRadius: 9,
                        bgColor:
                            isAgreed ? Colors.green : const Color(0x11282828),
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 18.h,
                                width: 18.h,
                                child: SvgPicture.asset(isAgreed
                                    ? checkboxChecked
                                    : checkboxUnchecked)),
                            SizedBox(
                              width: 11.w,
                            ),
                            CustomTextWithLineHeight(
                              text: iAgreeAndWishToProceed,
                              textColor: isAgreed ? white : black,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
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
                          authProvider.isLoading ? "Creating account..." : next,
                          () async {
                            navToWithScreenName(
                                context: context,
                                screen: const ConfirmAttendanceScreen());
                            // navTo(
                            //     context: context,
                            //     path: Routes.welcomeToHashITScreen);
                          },
                          color: black,
                        );
                      }),
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
            ],
          )),
    );
  }
}
