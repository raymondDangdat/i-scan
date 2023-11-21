import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../Utils/constants.dart';
import 'label_widget.dart';
import '../providers/auth_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';

class BalanceLeftWidget extends StatelessWidget {
  const BalanceLeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (ctx, auth, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              LabelWidget(
                label:
                    "Balance: ${auth.showBalance ? auth.userProfile != null && auth.userProfile!.data.accounts.isNotEmpty ? '$nairaSign${returnAmount(amount: auth.userProfile!.data.accounts[0].balance)}' : "0.00" : 'NGN****'}",
                textColor: black,
              ),
              SizedBox(
                width: 5.w,
              ),
              InkWell(
                  onTap: () {
                    auth.toggleShowBalance();
                  },
                  child: SvgPicture.asset(showAccountBalanceEye))
            ],
          ),
        ],
      );
      //   Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     CustomTextWithLineHeight(
      //       text: "You have  ${auth.userProfile != null && auth.userProfile!.data.accounts.isNotEmpty ? '$nairaSign${returnAmount(amount: auth.userProfile!.data.accounts[0].balance)}' : "0.00"} left",
      //       textColor: black,
      //       fontSize: 12,
      //     ),
      //   ],
      // );
    });
  }
}
