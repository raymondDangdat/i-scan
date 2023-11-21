import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/textfields.dart';
import '../../../Widgets/title_widget.dart';
import '../../../providers/success_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';
import 'change_pin_and_password_verification_screen.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({Key? key}) : super(key: key);

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final oldPinController = TextEditingController();
  final newPinController = TextEditingController();

  bool obscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back)),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 37.h,
                      ),
                      const TitleWidget(
                        title: changePin,
                        textColor: Color.fromRGBO(65, 65, 65, 1),
                      ),
                      SizedBox(height: 14.h),
                      const CustomTextWithLineHeight(
                        text: "Old PIN",
                        textColor: Color.fromRGBO(139, 139, 139, 1),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      PwdField(
                        hint: password,
                        controller: oldPinController,
                        isObscured: obscure,
                        hasBorder: true,
                        // prefixIcon: const Icon(Iconsax.lock, color: mainColor,),
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const CustomTextWithLineHeight(
                        text: "New PIN",
                        textColor: Color.fromRGBO(139, 139, 139, 1),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      PwdField(
                        hint: password,
                        controller: newPinController,
                        isObscured: obscure,
                        hasBorder: true,
                        // prefixIcon: const Icon(Iconsax.lock, color: mainColor,),
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Consumer<SuccessProvider>(
                builder: (ctx, successProvider, child) {
              return MainButton(
                "Update PIN",
                () {
                  navToWithScreenName(
                      context: context,
                      screen: const ChangePinAndPasswordVerificationScreen());
                  // navTo(
                  //     context: context,
                  //     path: Routes.changePinAndPasswordVerificationScreen);
                },
                color: mainColor,
              );
            }),
          ),
        ],
      )),
    );
  }
}
