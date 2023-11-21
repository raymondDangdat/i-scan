import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/constants/image_constant.dart';
import 'cached_network_image_widget.dart';

class GreenSuccessIconWidget extends StatelessWidget {
  const GreenSuccessIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      width: 75.h,
      child: const CachedNetworkImageWidget(
          height: 75, imageUrl: greenSuccessIconUrl),
    );
  }
}
