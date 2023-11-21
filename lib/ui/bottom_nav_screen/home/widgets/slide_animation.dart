import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Widgets/custom_text.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class SlideAnimationWidget extends StatelessWidget {
  const SlideAnimationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const BodyTextLightWithLineHeight(
              text: slide,
              fontWeight: mediumFont,
              fontSize: 10,
              textColor: Color.fromRGBO(145, 147, 155, 1),
            ),
            SizedBox(
              width: 4.w,
            ),
            SvgPicture.asset(forwardIconSvg),
            SvgPicture.asset(forwardIconSvg),
            SvgPicture.asset(forwardIconSvg),
          ],
        ),
      ),
    );
  }
}
