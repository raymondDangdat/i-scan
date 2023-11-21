import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../Utils/functions.dart';
import '../../providers/auth_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/dimension_constants.dart';
import '../../resources/constants/font_constants.dart';
import '../../resources/constants/string_constants.dart';
import '../custom_text.dart';
import '../long_divider.dart';
import '../../../../Widgets/modal_header_with_close_icon_widget.dart';

Future showFundAccountInfoModal(BuildContext importedContext) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    context: importedContext,
    backgroundColor: white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(modalRadius.r),
          topRight: Radius.circular(modalRadius.r)),
    ),
    builder: (BuildContext context) {
      return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    bottom: bottomPadding.h,
                    top: 14.h,
                    left: horizontalPadding.w,
                    right: horizontalPadding.w),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(modalRadius.r),
                      topRight: Radius.circular(modalRadius.r)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ModalHeaderWithCloseIconWidget(),
                    SizedBox(
                      height: 25.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SemiBold16px(
                          text: fundAccount,
                          fontSize: 15,
                          fontWeight: boldFont,
                          textColor: Color(0xFF1A202C),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(6.r)),
                      padding: EdgeInsets.only(
                          top: 15.h, bottom: 19.h, left: 10.5.w, right: 10.5.w),
                      child: Column(
                        children: [
                          ItemWidget(
                              label: accountName,
                              mainText:
                                  "${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}"),
                          ItemWidget(
                              label: bankName,
                              mainText: authProvider.userProfile == null ||
                                      authProvider
                                          .userProfile!.data.accounts.isEmpty
                                  ? "No Account Yet"
                                  : authProvider
                                      .userProfile!.data.accounts[0].bankName),
                          ItemWidget(
                            label: accountNumber,
                            mainText: authProvider.userProfile == null ||
                                    authProvider
                                        .userProfile!.data.accounts.isEmpty
                                ? "0000000000"
                                : authProvider.userProfile!.data.accounts[0]
                                    .accountNumber,
                            showDivider: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          }));
    },
  );
}

class ItemWidget extends StatelessWidget {
  final String label;
  final String mainText;
  final bool showDivider;
  const ItemWidget({
    Key? key,
    required this.label,
    required this.mainText,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SemiBold16px(
                    text: label,
                    fontSize: 12,
                    fontWeight: mediumFont,
                    textColor: const Color(0x600C0C0C),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  SemiBold16px(
                    text: mainText,
                    fontSize: 14,
                    fontWeight: boldFont,
                    textColor: const Color(0xFF0C0C0C),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                copyToClipboard(mainText);
              },
              child: Icon(
                Iconsax.document_copy,
                color: const Color.fromRGBO(32, 86, 190, 1),
                size: 20.h,
              ),
            )
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        if (showDivider) const LongDivider(),
      ],
    );
  }
}
