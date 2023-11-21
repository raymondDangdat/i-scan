import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../Utils/go_router_route_names.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class VerificationNotificationWidget extends StatelessWidget {
  const VerificationNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
      child: Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
        return authProvider.fetchingProfile
            ? Center(
                child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: const CupertinoActivityIndicator(),
              ))
            : authProvider.userProfile != null ||
                    authProvider.userProfile!.data.kycTier == null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomContainerButton(
                        onTap: () {
                          debugPrint("Tapped");
                          context.goNamed(accountSetupHomeRoute);

                          // navTo(
                          //     context: context, path: Routes.accountSetupHome);
                        },
                        title: "",
                        borderRadius: 16,
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w,
                                  top: 34.h,
                                  right: 10.w,
                                  bottom: 33.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CustomTextWithLineHeight(
                                              text: completeVerification,
                                              textColor: black,
                                              fontWeight: boldFont,
                                              fontSize: 18,
                                            ),
                                            CustomTextWithLineHeight(
                                              text:
                                                  "It’s important you complete the KYC so you can enjoy unlimited offers ",
                                              textColor: Colors.black
                                                  .withOpacity(
                                                      0.3799999952316284),
                                              fontWeight: boldFont,
                                              fontSize: 10,
                                            ),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 152.w,
                                              child: MainButton(
                                                completeNow,
                                                () {
                                                  context.goNamed(
                                                      accountSetupHomeRoute);
                                                },
                                                color: const Color.fromRGBO(
                                                    45, 91, 252, 1),
                                                fontSize: 12,
                                                height: 40.h,
                                                border: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 14.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 69.h,
                                              width: 94.h,
                                              child: Image.asset(
                                                  completeVerificationImg)),
                                          CustomTextWithLineHeight(
                                            text:
                                                "${authProvider.kycStep + 1} of 5 Completed",
                                            textColor: Colors.black.withOpacity(
                                                0.3799999952316284),
                                            fontWeight: boldFont,
                                            fontSize: 12,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        bgColor: const Color.fromRGBO(234, 238, 255, 1),
                      ),
                    ],
                  )
                : Container();
      }),
    );
  }
}
