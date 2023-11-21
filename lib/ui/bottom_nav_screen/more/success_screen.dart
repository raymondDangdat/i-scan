import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../Utils/go_router_route_names.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_text.dart';
import '../../../providers/success_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);
  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlueTextColor,
      body: SafeArea(
          bottom: false,
          child:
              Consumer<SuccessProvider>(builder: (ctx, successProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 300,
                ),
                SvgPicture.asset(shieldLogo),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: successProvider.successTitleWidth.w,
                  child: CustomTextNoOverFlow(
                    text: successProvider.title,
                    fontSize: 20,
                    alignment: "center",
                    fontWeight: boldFont,
                    textColor: white,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Center(
                  child: SizedBox(
                    width: successProvider.successSubTitleWidth.w,
                    child: CustomTextNoOverFlow(
                      text: successProvider.subTitle,
                      fontSize: 12,
                      alignment: "center",
                      textColor: white,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      MainButton(
                        successProvider.buttonText,
                        () {
                          if (successProvider.buttonText == goToHome) {
                            context.go(iScanDrDashboardRoute);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        color: white,
                        textColor: black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            );
          })),
    );
  }
}
