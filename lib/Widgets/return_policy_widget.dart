import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/Widgets/title_widget.dart';

import '../resources/constants/color_constants.dart';
import '../resources/constants/string_constants.dart';
import 'components.dart';
import 'custom_text.dart';

class ReturnPolicyWidget extends StatelessWidget {
  const ReturnPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerButton(
      borderRadius: 5,
      borderColor: marketplacePrimaryColor,
      onTap: () {},
      title: "",
      bgColor: const Color.fromRGBO(248, 244, 255, 1),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const TitleWidget(
                title: returnPolicy,
                fontSize: 11,
              ),
              SizedBox(
                height: 6.h,
              ),
            ],
          ),
          const BodyTextLightWithLineHeight(
            text: weHaveAGoodReturnPolicyThatAllows,
            fontSize: 10,
            textColor: Color(0xFF2B2C34),
          ),
        ],
      ),
    );
  }
}
