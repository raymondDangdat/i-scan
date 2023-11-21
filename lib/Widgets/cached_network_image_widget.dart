import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final double height;
  final String imageUrl;
  final double? width;
  final double topLeftRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final double topRightRadius;
  const CachedNetworkImageWidget(
      {super.key,
      required this.height,
      required this.imageUrl,
      this.width,
      this.topLeftRadius = 10,
      this.topRightRadius = 10,
      this.bottomLeftRadius = 10,
      this.bottomRightRadius = 10});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height.h,
      width: width == null ? width : width!.w,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius.r),
            bottomLeft: Radius.circular(bottomLeftRadius.r),
            topRight: Radius.circular(topRightRadius.r),
            bottomRight: Radius.circular(bottomRightRadius.r),
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          // color: ColorManager.primaryColor
        ),
      ),
      placeholder: (context, url) => Container(
        width: MediaQuery.of(context).size.width,
        height: height.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFFF9F9F9), Color(0xFFFAFAFA)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius.r),
              bottomLeft: Radius.circular(bottomLeftRadius.r),
              topRight: Radius.circular(topRightRadius.r),
              bottomRight: Radius.circular(bottomRightRadius.r),
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
