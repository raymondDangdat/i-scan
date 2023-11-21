import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Widgets/custom_text.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
  final List<Widget> children;
  final IconData icon;
  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    required this.children,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                Container(
                  width: 41,
                  height: 41,
                  decoration: const ShapeDecoration(
                    color: Color(0x118B83BC),
                    shape: OvalBorder(),
                  ),
                  child: Icon(icon),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: HeaderText(
                    text: title,
                    textColor: black,
                    fontSize: 12,
                    fontWeight: boldFont,
                    isUpperCase: false,
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded) SizedBox(height: 16.h),
          if (isExpanded) ...children,
        ],
      ),
    );
  }
}
