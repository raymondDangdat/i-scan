import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/functions.dart';
import '../../../../Utils/go_router_route_names.dart';
import '../../../../Widgets/components.dart';
import '../../../../Widgets/constant_widgets.dart';
import '../../../../Widgets/custom_snack_back.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/label_widget.dart';
import '../../../../Widgets/textfields.dart';
import '../../../../Widgets/title_widget.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/success_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/string_constants.dart';
import '../../../../resources/navigation_utils.dart';
import '../edit_profile_screens/info_edited_screen.dart';

class ResetPINScreen extends StatefulWidget {
  const ResetPINScreen({Key? key}) : super(key: key);

  @override
  State<ResetPINScreen> createState() => _ResetPINScreenState();
}

class _ResetPINScreenState extends State<ResetPINScreen> {
  final oldPINController = TextEditingController();
  final newPINController = TextEditingController();
  final confirmPINController = TextEditingController();

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
          const TopPadding(),
          const IScanAppBar(
            title: "",
            showWidget: true,
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const TitleWidget(
              title: changeTransactionPIN,
            ),
          ),
          SizedBox(
            height: 21.h,
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
                    children: [
                      SizedBox(
                        height: 28.h,
                      ),
                      const LabelWidget(
                        label: oldPin,
                        textColor: black,
                        fontWeight: boldFont,
                      ),
                      PwdField(
                        hint: "********",
                        controller: oldPINController,
                        isObscured: obscure,
                        maxLength: 4,
                        formatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        hasBorder: true,
                        prefixIcon: const Icon(
                          Iconsax.lock,
                          color: prefixIconColor,
                        ),
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      const LabelWidget(
                        label: newPin,
                        textColor: black,
                        fontWeight: boldFont,
                      ),
                      PwdField(
                        hint: "********",
                        controller: newPINController,
                        isObscured: obscure,
                        maxLength: 4,
                        formatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        hasBorder: true,
                        prefixIcon: const Icon(
                          Iconsax.lock,
                          color: prefixIconColor,
                        ),
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      const LabelWidget(
                        label: confirmPIN,
                        textColor: black,
                        fontWeight: boldFont,
                      ),
                      PwdField(
                        hint: "********",
                        controller: confirmPINController,
                        isObscured: obscure,
                        maxLength: 4,
                        formatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        hasBorder: true,
                        prefixIcon: const Icon(
                          Iconsax.lock,
                          color: prefixIconColor,
                        ),
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Consumer2<SuccessProvider, AuthProvider>(
                      builder: (ctx, successProvider, authProvider, child) {
                    return InkWell(
                      onTap: () async {
                        //TOGGLE THE VARIABLE TO CHANGE PIN
                        authProvider.updateIsChangePIN(true);
                        authProvider.updatePhoneNumberOrEmailToEdit(
                            authProvider.userProfile?.data.phoneNumber ?? "");
                        authProvider.requestOtpForUpdateOrReset(
                            isRequestOtp: true,
                            showLoading: false,
                            isEmail: false);
                        context.goNamed(confirmPhoneNumberRouteName);
                        //                         navToWithScreenName(
                        // context: context, screen: const ConfirmYourPhoneNumberScreen());
                        // navTo(
                        // context: context,
                        // path: Routes.confirmPhoneToEditScreen);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SemiBold12px(
                            text: "Forgot TransactionPIN?",
                            fontWeight: boldFont,
                            fontSize: 14,
                            textColor: black,
                          ),
                          SemiBold12px(
                            text: " Reset Now",
                            fontWeight: boldFont,
                            fontSize: 14,
                            textColor: Color(0xFF0093FF),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Consumer2<SuccessProvider, AuthProvider>(
                builder: (ctx, successProvider, authProvider, child) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (authProvider.resMessage != '') {
                  customSnackBar(context, authProvider.resMessage);

                  ///Clear the response message to avoid duplicate
                  authProvider.clear();
                }
              });
              return MainButton(
                authProvider.isLoading || authProvider.isConfirmingPIN
                    ? "Loading..."
                    : resetPIN,
                () async {
                  if (oldPINController.text.trim().length < 4) {
                    customSnackBar(
                        context, "Your old PIN  must be at 4 digits");
                  } else if (newPINController.text.length < 4) {
                    customSnackBar(context, "New PIN must be 4 digits");
                  } else if (newPINController.text.trim() !=
                      confirmPINController.text.trim()) {
                    customSnackBar(
                        context, 'Confirm PIN must match confirm PIN');
                  } else {
                    bool isOldPINCorrect =
                        await authProvider.confirmTransactionPIN(
                            pin: oldPINController.text.trim(),
                            context: context);
                    if (mounted) {
                      //pop dialog
                      popLoader(context: context, isGoRouterScreen: false);
                    }
                    if (mounted && isOldPINCorrect) {
                      bool newPINChanged = await authProvider.createPIN(
                          pin: newPINController.text.trim(),
                          userID: authProvider.userProfile?.data.id ?? "",
                          context: context);
                      if (mounted) {
                        popLoader(context: context);
                      }
                      if (mounted && newPINChanged) {
                        Navigator.pop(context);
                        authProvider.updateProfileEditedMessage(pinUpdated);
                        navToWithScreenName(
                            context: context, screen: const InfoEditedScreen());
                        //  navTo(
                        //         context: context,
                        //         path: Routes.profileUpdatedScreen);
                      }
                    }
                  }
                },
              );
            }),
          )
        ],
      )),
    );
  }
}
