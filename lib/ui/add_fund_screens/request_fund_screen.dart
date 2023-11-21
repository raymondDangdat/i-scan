import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/modals/show_device_changed_modal.dart';
import '../../Widgets/textfields.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/image_constant.dart';
import '../../resources/constants/string_constants.dart';

class RequestFundScreen extends StatefulWidget {
  const RequestFundScreen({Key? key}) : super(key: key);

  @override
  State<RequestFundScreen> createState() => _RequestFundScreenState();
}

class _RequestFundScreenState extends State<RequestFundScreen> {
  bool showContacts = true;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopPadding(),
              const IScanAppBar(
                title: "",
              ),
              SizedBox(
                height: 21.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextWithLineHeight(
                          text: deviceChanged,
                          fontWeight: boldFont,
                          textColor: black,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextWithLineHeight(
                          text: "Balance: NGN0.00",
                          fontWeight: mediumFont,
                          textColor:
                              Colors.black.withOpacity(0.5799999833106995),
                          fontSize: 12,
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: MainButton(
                                "Contacts",
                                () {
                                  showContacts = true;
                                  setState(() {});
                                },
                                color: showContacts
                                    ? black
                                    : Colors.black
                                        .withOpacity(0.05000000074505806),
                                textColor: showContacts ? white : black,
                                fontSize: 12,
                                border: 10,
                                height: 35,
                              ),
                            ),
                            SizedBox(
                              width: 11.w,
                            ),
                            SizedBox(
                              width: 100.w,
                              child: MainButton(
                                "Payment link",
                                () {
                                  showContacts = false;
                                  setState(() {});
                                },
                                color: !showContacts
                                    ? black
                                    : Colors.black
                                        .withOpacity(0.05000000074505806),
                                textColor: !showContacts ? white : black,
                                fontSize: 12,
                                border: 10,
                                height: 35,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                        if (showContacts)
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomField(
                                      "search",
                                      searchController,
                                      isCapitalizeSentence: false,
                                      type: TextInputType.emailAddress,
                                      prefixIcon: const Icon(
                                        Iconsax.search_normal,
                                        color: Color.fromRGBO(41, 45, 50, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if (!showContacts)
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(23.r),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(13.r),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 250.w,
                                      child: const CustomTextWithLineHeight(
                                        alignCenter: true,
                                        text: shareYourPaymentLink,
                                        fontWeight: mediumFont,
                                        textColor: Color(0xFF676767),
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 19.h,
                                    ),
                                    QrImageView(
                                      data: 'https://pay.hashit.io/0028462468',
                                      version: QrVersions.auto,
                                      size: 172.h,
                                    ),
                                    SizedBox(
                                      height: 17.h,
                                    ),
                                    const CustomTextWithLineHeight(
                                      text: "Nelson Steve",
                                      fontWeight: boldFont,
                                      textColor: Color(0xFF1F1F1F),
                                      fontSize: 20,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    const CustomTextWithLineHeight(
                                      text: "https://pay.hashit.io/0028462468",
                                      fontWeight: mediumFont,
                                      textColor: Color(0xFF676767),
                                      fontSize: 15,
                                    ),
                                    SizedBox(
                                      height: 29.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(scanQRCodeIcon),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              const CustomTextWithLineHeight(
                                                text: shareQR,
                                                fontWeight: boldFont,
                                                textColor: Color(0xFF676767),
                                                fontSize: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 52.w,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(shareLinkIcon),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              const CustomTextWithLineHeight(
                                                text: shareLink,
                                                fontWeight: boldFont,
                                                textColor: Color(0xFF676767),
                                                fontSize: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              MainButton(addYourAmount, () {
                                showDeviceChangedModal(context);
                              })
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              )
            ],
          )),
    );
  }
}
