import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/card_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/string_constants.dart';

class ConfirmCardCreationScreen extends StatefulWidget {
  const ConfirmCardCreationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmCardCreationScreen> createState() =>
      _ConfirmCardCreationScreenState();
}

class _ConfirmCardCreationScreenState extends State<ConfirmCardCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor2,
      body: SafeArea(
          bottom: false,
          child: Consumer2<CardProvider, AuthProvider>(
              builder: (ctx, cardProvider, authProvider, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {});
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopPadding(),
                const IScanAppBar(
                  title: "",
                ),
                SizedBox(
                  height: 26.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWithLineHeight(
                            text: requestDeviceUpdate,
                            fontWeight: boldFont,
                            textColor: black,
                            fontSize: 18,
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          CustomContainerButton(
                            onTap: () {},
                            title: "",
                            borderRadius: 9,
                            verticalPadding: 18,
                            horizontalPadding: 16,
                            widget: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const BodyTextLightWithLineHeight(
                                      text: services,
                                      fontSize: 12,
                                      fontWeight: mediumFont,
                                      textColor: black,
                                    ),
                                    BodyTextLightWithLineHeight(
                                      text: cardProvider.currentIndex == 0
                                          ? virtualCardIssuing
                                          : physicalCardIssuing,
                                      fontWeight: mediumFont,
                                      textColor: const Color(0xFF1A202C),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 19.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const BodyTextLightWithLineHeight(
                                      text: from,
                                      fontSize: 12,
                                      fontWeight: mediumFont,
                                      textColor: black,
                                    ),
                                    BodyTextLightWithLineHeight(
                                      text: authProvider.userProfile == null ||
                                              authProvider.userProfile!.data
                                                  .accounts.isEmpty
                                          ? "0000000000"
                                          : authProvider.userProfile!.data
                                              .accounts[0].accountNumber,
                                      fontWeight: mediumFont,
                                      textColor: const Color(0xFF1A202C),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 19.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const BodyTextLightWithLineHeight(
                                      text: amount,
                                      fontSize: 12,
                                      fontWeight: mediumFont,
                                      textColor: black,
                                    ),
                                    BodyTextLightWithLineHeight(
                                      text: cardProvider.currentIndex == 0
                                          ? "$nairaSign${0}.00"
                                          : physicalCardIssuing,
                                      fontWeight: mediumFont,
                                      textColor: const Color(0xFF1A202C),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: MainButton(next, () {}),
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
