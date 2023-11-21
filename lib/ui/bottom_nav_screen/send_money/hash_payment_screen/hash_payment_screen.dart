import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../Utils/functions.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/dimension_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class HashPaymentScreen extends StatefulWidget {
  const HashPaymentScreen({Key? key}) : super(key: key);

  @override
  State<HashPaymentScreen> createState() => _HashPaymentScreenState();
}

class _HashPaymentScreenState extends State<HashPaymentScreen> {
  bool showBalance = true;
  final searchController = TextEditingController();

  bool copyingTag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor2,
      body: SafeArea(
          // top: false,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IScanAppBar(
                title: "",
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(
                      title: hashPayment,
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 39.h,
              ),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 260.w,
                        padding: EdgeInsets.only(
                            top: 14.w, bottom: 14.h, left: 16.w, right: 16.w),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(17.r)),
                        child:
                            Consumer<AuthProvider>(builder: (ctx, auth, child) {
                          return Column(
                            children: [
                              SizedBox(
                                width: 150.h,
                                height: 150.h,
                                child: QrImageView(
                                  data: auth.hiveUserData?.userName ?? 'Guest',
                                  version: QrVersions.auto,
                                  size: 150.h,
                                ),
                              ),
                              TitleWidget(
                                title:
                                    "${auth.hiveUserData?.firstName} ${auth.hiveUserData?.lastName}",
                                fontSize: 20,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              BodyTextPrimaryWithLineHeight(
                                text:
                                    "Scan to pay #${auth.hiveUserData?.userName ?? 'Guest'}",
                                fontSize: 13,
                                fontWeight: mediumFont,
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    Consumer<AuthProvider>(builder: (ctx, auth, child) {
                      return CustomContainerButton(
                        bgColor: copyingTag ? const Color(0xFF2B937B) : black,
                        borderRadius: 10,
                        onTap: () {
                          setState(() {
                            if (!copyingTag) {
                              copyingTag = true;
                            }
                          });
                          Timer(const Duration(seconds: 2), () {
                            setState(() {
                              copyingTag = false;
                            });
                          });
                          copyToClipboard(
                              auth.hiveUserData?.userName ?? 'Guest');
                        },
                        title: "",
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyTextPrimaryWithLineHeight(
                                  text: "Your tag",
                                  fontSize: 13,
                                  fontWeight: mediumFont,
                                  textColor: copyingTag
                                      ? const Color.fromRGBO(
                                          255, 255, 255, 0.58)
                                      : const Color.fromRGBO(148, 148, 148, 1),
                                ),
                                Row(
                                  children: [
                                    BodyTextPrimaryWithLineHeight(
                                      text: "#",
                                      fontSize: 16,
                                      fontWeight: boldFont,
                                      textColor: copyingTag
                                          ? const Color.fromRGBO(
                                              255, 255, 255, 0.58)
                                          : const Color.fromRGBO(
                                              148, 148, 148, 1),
                                    ),
                                    BodyTextPrimaryWithLineHeight(
                                      text: auth.hiveUserData?.userName ??
                                          'Guest',
                                      fontSize: 16,
                                      fontWeight: boldFont,
                                      textColor: white,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  copyIconSmall,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  height: 24.h,
                                  width: 24.h,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                const BodyTextPrimaryWithLineHeight(
                                  text: copy,
                                  textColor: white,
                                  fontSize: 13,
                                  fontWeight: mediumFont,
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ))
            ],
          )),
    );
  }
}
