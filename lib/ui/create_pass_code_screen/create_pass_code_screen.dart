import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Utils/flush_bar_dialog.dart';
import '../../../Widgets/custom_keyboard/custom_keyboard.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/pin_filled.dart';
import '../../../providers/auth_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/string_constants.dart';
import '../../../resources/navigation_utils.dart';
import '../../Widgets/title_widget.dart';
import '../../resources/constants/image_constant.dart';
import '../confirm_pass_code_screen/confirm_passcode_screen.dart';

class CreatePassCodeScreen extends StatefulWidget {
  const CreatePassCodeScreen({Key? key}) : super(key: key);

  @override
  State<CreatePassCodeScreen> createState() => _CreatePassCodeScreenState();
}

class _CreatePassCodeScreenState extends State<CreatePassCodeScreen> {
  late AuthProvider auth;

  bool hasError = false;
  String currentText = "";
  List<String> pin = [];

  bool wrongPin = false;

  @override
  Widget build(BuildContext context) {
    auth = context.watch<AuthProvider>();
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // SizedBox(height: 25.h,),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      const TitleWidget(
                        title: createPasscode,
                        fontSize: 22,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: const CustomTextWithLineHeight(
                            text: signIntoYourAppWithPasscode,
                            fontSize: 14,
                            alignCenter: true,
                            textColor: black,
                            lineHeight: 1.5,
                            fontWeight: mediumFont),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: const CustomTextWithLineHeight(
                            text: pleaseDontShareWithAnyOne,
                            fontSize: 14,
                            alignCenter: true,
                            textColor: black,
                            lineHeight: 1.5,
                            fontWeight: mediumFont),
                      ),
                      SizedBox(
                        height: 44.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(greenPadlock),
                          SizedBox(
                            width: 3.w,
                          ),
                          const CustomTextWithLineHeight(
                              text: passcode,
                              fontSize: 14,
                              alignCenter: true,
                              textColor: black,
                              lineHeight: 1.5,
                              fontWeight: mediumFont),
                        ],
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child:
                            Consumer<AuthProvider>(builder: (ctx, auth, child) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (auth.resMessage != '') {
                              showFlushbar(
                                  context, "PIN error", auth.resMessage);

                              ///Clear the response message to avoid duplicate
                              auth.clear();
                            }
                          });
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              pin.isNotEmpty
                                  ? const PinFilled()
                                  : const PinUnfilled(),
                              pin.length >= 2
                                  ? const PinFilled()
                                  : const PinUnfilled(),
                              pin.length >= 3
                                  ? const PinFilled()
                                  : const PinUnfilled(),
                              pin.length >= 4
                                  ? const PinFilled()
                                  : const PinUnfilled(),
                              pin.length >= 5
                                  ? const PinFilled()
                                  : const PinUnfilled(),
                              pin.length >= 6
                                  ? const PinFilled()
                                  : const PinUnfilled(),
                            ],
                          );
                        }),
                      ),
                      SizedBox(height: 46.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 47.w),
                        child: CustomKeyboard(
                          isPlainText: true,
                          onTextInput: (myText) {
                            _insertPin(myText);
                            // _insertText(myText);
                          },
                          onBackspace: () {
                            _removePin();
                            // _backspace();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  void _insertPin(String myText) {
    if (pin.length < 6) {
      pin.add(myText);
      if (pin.length == 6) {
        final pinAsString = pin.join("");
        auth.updatePasscode(pinAsString);
        moveToConfirmPasscodeScreen(pinAsString);
      }
      setState(() {});
    }
  }

  void _removePin() {
    if (pin.isNotEmpty) {
      pin.removeLast();
      setState(() {});
    }
  }

  void moveToConfirmPasscodeScreen(String pinAsString) async {
    navToWithScreenName(
        context: context, screen: const ConfirmPasscodeScreen());
    // navTo(context: context, path: Routes.confirmPassCode);
  }
}
