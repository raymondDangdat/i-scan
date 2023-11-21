import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/more_products_model.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import 'components.dart';
import 'custom_text.dart';

class MoreProductsWidget extends StatelessWidget {
  const MoreProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 170.h,
        child: ListView.builder(
            itemCount: moreProductsList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = moreProductsList[index];
              return Padding(
                padding:
                    EdgeInsets.only(right: 12.w, left: index == 0 ? 16 : 0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 300.w,
                    padding: EdgeInsets.only(top: 38.h, left: 29.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: cardColor,
                        image: DecorationImage(
                            image: AssetImage(product.bgImg),
                            fit: BoxFit.cover)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            constraints: BoxConstraints(maxWidth: 200.w),
                            child: BodyTextPrimaryWithLineHeight(
                              text: product.title,
                              fontSize: 16,
                              textColor: white,
                              fontWeight: boldFont,
                            )
                            // TitleWidget(title: product.title,
                            //   textColor: white,
                            //   fontSize: 16,
                            // ),
                            ),
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedBox(
                          width: 150.w,
                          child: BodyTextPrimaryWithLineHeight(
                            text: product.subTitle,
                            fontSize: 10,
                            textColor:
                                Colors.white.withOpacity(0.8999999761581421),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 140.w,
                          child: OutlineBtn(
                            product.btnTitle,
                            () {},
                            backgroundColor: Colors.transparent,
                            textColor: white,
                            borderColor: white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
