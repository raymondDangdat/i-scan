import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../providers/card_provider.dart';
import '../../../../resources/constants/color_constants.dart';

class CardTypeWidget extends StatefulWidget {
  final BuildContext importedContext;
  final bool isOtherScreens;
  const CardTypeWidget({
    Key? key,
    required this.importedContext,
    this.isOtherScreens = false,
  }) : super(key: key);

  @override
  State<CardTypeWidget> createState() => _CardTypeWidgetState();
}

class _CardTypeWidgetState extends State<CardTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<CardProvider>(builder: (ctx, cardProvider, child) {
              return Row(
                children: [
                  Expanded(
                    child: DotsIndicator(
                      dotsCount: 2,
                      position: cardProvider.currentIndex,
                      decorator: DotsDecorator(
                        color: const Color.fromRGBO(
                            224, 228, 235, 1), // Inactive color
                        activeColor: black,
                        size: Size.square(14.h),
                        activeSize: Size(14.h, 14.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r)),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r)),
                      ),
                    ),
                  ),
                ],
              );
            }),
            SizedBox(
              height: 34.h,
            ),
            Container(
              height: 267.h,
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                carouselController: cardProvider.carouselController,
                options: CarouselOptions(
                    padEnds: false,
                    viewportFraction: 0.8,
                    aspectRatio: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        cardProvider.changeCurrentIndex(index);
                      });
                    },
                    initialPage: cardProvider.currentIndex),
                items: [
                  ...cardProvider.cardTypeList.map((card) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: InkWell(
                          onTap: () async {},
                          child: CachedNetworkImage(
                            height: 267.h,
                            // width: MediaQuery.of(context).size.width,
                            imageUrl: card,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  image: imageProvider,
                                  // fit: BoxFit.cover,
                                ),
                                // color: ColorManager.primaryColor
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              width: MediaQuery.of(context).size.width,
                              height: 267.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color(0xFFF9F9F9),
                                    Color(0xFFFAFAFA)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
          ],
        );
      }),
    );
  }
}
