import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../Utils/go_router_route_names.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_text.dart';
import '../../../providers/bottom_nav_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class CardCreatedSuccessfullyScreen extends StatelessWidget {
  const CardCreatedSuccessfullyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlueTextColor,
      body: SafeArea(
          top: false,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 284.h,
              ),
              Center(
                child: SizedBox(
                    height: 174.h,
                    width: 158.h,
                    child: Image.asset(cardCreatedIcon)),
              ),
              SizedBox(
                height: 11.h,
              ),
              const BodyTextLightWithLineHeight(
                text: virtualCardCreated,
                textColor: white,
                fontWeight: boldFont,
                fontSize: 20,
              ),
              SizedBox(
                height: 11.h,
              ),
              const BodyTextLightWithLineHeight(
                text: nowProceed,
                textColor: white,
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Consumer<BottomNavProvider>(
                    builder: (ctx, bottomProvider, child) {
                  return MainButton(
                    proceed,
                    () {
                      bottomProvider.updateSelectedIndex(1);
                      context.go(iScanDrDashboardRoute);
                    },
                    color: white,
                    textColor: black,
                  );
                }),
              ),
              SizedBox(
                height: 29.h,
              )
            ],
          )),
    );
  }
}
