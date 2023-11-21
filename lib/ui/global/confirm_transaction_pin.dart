import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/custom_keyboard/custom_keyboard.dart';
import '../../../Widgets/custom_snack_back.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/pin_filled.dart';
import '../../../providers/auth_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/string_constants.dart';
import '../../Utils/functions.dart';
import '../../Widgets/title_widget.dart';
import '../../resources/constants/image_constant.dart';

class ConfirmTransactionPINScreen extends StatefulWidget {
  const ConfirmTransactionPINScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmTransactionPINScreen> createState() =>
      _ConfirmTransactionPINScreenState();
}

class _ConfirmTransactionPINScreenState
    extends State<ConfirmTransactionPINScreen> {
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
              SizedBox(
                height: 19.h,
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
                  child: Column(
                    children: [
                      const TitleWidget(
                        title: "PIN",
                        fontSize: 22,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: const CustomTextWithLineHeight(
                            text: enterYourTransactionPinToConfirm,
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
                              fontSize: 12,
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
                        padding: EdgeInsets.symmetric(horizontal: 80.w),
                        child:
                            Consumer<AuthProvider>(builder: (ctx, auth, child) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (auth.resMessage != '') {
                              customSnackBar(context, auth.resMessage);

                              ///Clear the response message to avoid duplicate
                              auth.clear();
                              pin = [];
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
    if (pin.length < 4) {
      pin.add(myText);
      if (pin.length == 4) {
        final pinAsString = pin.join("");
        auth.updatePasscode(pinAsString);
        moveToNextScreen(pinAsString);
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

  void moveToNextScreen(String pinAsString) async {
    // Continue
    bool pinConfirmed =
        await auth.confirmTransactionPIN(pin: pinAsString, context: context);
    if (mounted) {
      //pop dialog
      popLoader(context: context);
    }
    if (mounted && pinConfirmed) {
      Navigator.pop(context, true);
    } else {}
  }
}
