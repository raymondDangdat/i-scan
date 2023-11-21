import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/font_constants.dart';
import '../resources/constants/image_constant.dart';
import 'custom_text.dart';

class MainButton extends StatelessWidget {
  final String label;
  final VoidCallback function;
  final Color color;
  final double fontSize;
  final double lightHeight;
  final double height;
  final Color textColor;
  final Widget? widget;
  final double border;
  final FontWeight fontWeight;
  final BorderSide? borderSide;
  const MainButton(this.label, this.function,
      {super.key,
      this.color = buttonColor,
      this.textColor = white,
      this.fontSize = 16,
      this.lightHeight = 1.7,
      this.widget,
      this.border = 18,
      this.height = 50,
      this.borderSide,
      this.fontWeight = mediumFont});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height.h,
      child: TextButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              color,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(border.r),
                side: borderSide ?? BorderSide.none,
              ),
            ),
          ),
          child: widget != null
              ? widget!
              : CustomTextWithLineHeight(
                  text: label,
                  textColor: textColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  lineHeight: lightHeight,
                )),
    );
  }
}

class MarketPlaceButton extends StatelessWidget {
  final String label;
  final VoidCallback function;
  final Color color;
  final double fontSize;
  final double lightHeight;
  final double height;
  final Color textColor;
  final Widget? widget;
  final double border;
  final FontWeight fontWeight;
  const MarketPlaceButton(this.label, this.function,
      {super.key,
      this.color = buttonColor,
      this.textColor = white,
      this.fontSize = 14,
      this.lightHeight = 1.7,
      this.widget,
      this.border = 5,
      this.height = 50,
      this.fontWeight = boldFont});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height.h,
      child: TextButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              color,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(border.r),
              ),
            ),
          ),
          child: widget != null
              ? widget!
              : CustomTextWithLineHeight(
                  text: label,
                  textColor: textColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  lineHeight: lightHeight,
                )),
    );
  }
}

class MarketplaceButtonWithIcon extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String iconName;
  const MarketplaceButtonWithIcon(
      {Key? key,
      required this.onTap,
      required this.text,
      this.iconName = arrowForwardEmptyState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarketPlaceButton(
      "",
      onTap,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BodyTextPrimaryWithLineHeight(
            text: text,
            textColor: white,
            fontSize: 12,
            fontWeight: mediumFont,
          ),
          SizedBox(
            width: 2.w,
          ),
          SvgPicture.asset(iconName)
        ],
      ),
      border: 18,
      color: marketplacePrimaryColor,
    );
  }
}

class OutlineBtn extends StatelessWidget {
  final String label;
  final VoidCallback function;
  final Color backgroundColor;
  final double height;
  final Color borderColor;
  final Color textColor;
  final double width;
  final Widget? widget;
  final double fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  const OutlineBtn(
    this.label,
    this.function, {
    super.key,
    this.backgroundColor = white,
    this.borderColor = const Color.fromRGBO(211, 212, 215, 1),
    this.width = double.infinity,
    this.textColor = mainColor,
    this.height = 45,
    this.borderRadius = 18,
    this.fontSize = 14,
    this.widget,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height.h,
      child: OutlinedButton(
        onPressed: function,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor, width: 0.5),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius.r)),
          ),
        ),
        child: widget ??
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
      ),
    );
  }
}

class OutlineIconBtn extends StatelessWidget {
  final String label;
  final VoidCallback function;
  final IconData icon;
  final Color bgColor;
  final Color txtColor;
  final double height;
  final Color borderColor;
  const OutlineIconBtn(
    this.label,
    this.function, {
    super.key,
    required this.icon,
    this.bgColor = white,
    this.txtColor = mainColor,
    this.height = 45,
    this.borderColor = mainColor,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height.h,
      child: OutlinedButton.icon(
        onPressed: function,
        icon: Icon(icon, color: txtColor),
        label: Text(label, style: TextStyle(color: txtColor, fontSize: 16)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor, width: 1),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ),
    );
  }
}

class MyDropDown extends StatelessWidget {
  final Widget child;
  const MyDropDown(this.child, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: bg),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: DropdownButtonHideUnderline(child: child),
    );
  }
}

void showLoading(String label, BuildContext ctx) {
  showDialog(
    context: ctx,
    barrierDismissible: false,
    builder: (ctx) => Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(mainColor),
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: Get.textTheme.headline1?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}

void showToast(String label) {
  Get.snackbar(
    'Success',
    label,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(
      bottom: 20,
      left: 20,
      right: 20,
    ),
  );
}

void showErrorToast(String label) {
  Get.snackbar(
    'Error',
    label,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(
      bottom: 20,
      left: 20,
      right: 20,
    ),
  );
}

Widget loader() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(mainColor),
    ),
  );
}

class CustomFieldNoIcon extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const CustomFieldNoIcon(this.hint, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: black),
        ),
      ),
    );
  }
}

Widget isActive(int active) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: active == 1 ? Colors.green.withOpacity(.8) : Colors.red,
    ),
    child: Text(
      active == 1 ? "Active" : "Inactive",
      style: const TextStyle(color: white),
    ),
  );
}

Widget appBar(String title,
    {bool centerTitle = true,
    Color color = bg,
    bool back = true,
    List<Widget>? actions}) {
  return AppBar(
    leading: back
        ? IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: black),
          )
        : null,
    backgroundColor: color,
    centerTitle: centerTitle,
    elevation: 0,
    title: Text(
      title,
      // style: Get.textTheme.headline2.copyWith(fontSize: 16),
    ),
    actions: actions,
  );
}

class PaymentAlert extends StatelessWidget {
  final String content;

  const PaymentAlert(
      {super.key,
      this.content =
          "You could still be at risk of being scammed even though the details you’ve provided match the account, you should still take time to check that the payment request is trustworthy"});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0x26ffc106),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Iconsax.flag, size: 20, color: Color(0xffffc106)),
              SizedBox(width: 4),
              Text(
                "Alert",
                style: TextStyle(
                  color: Color(0xff373737),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            content,
            style: const TextStyle(
              color: Color(0xff5f5f5f),
              fontSize: 10,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}

//First letter widget
Widget firstLetter(String name) {
  return Container(
    width: 42,
    height: 42,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [Color(0xffffd232), Color(0xfffdff88)],
      ),
    ),
    child: Center(
      child: Text(
        name[0].toUpperCase(),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class CustomContainerButton extends StatelessWidget {
  final double height;
  final double horizontalPadding;
  final double verticalPadding;
  final VoidCallback onTap;
  final double borderRadius;
  final Color borderColor;
  final String title;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final double lineHeight;
  final Color bgColor;
  final Widget? widget;
  final bool alignCenter;
  final bool useHeight;
  const CustomContainerButton(
      {Key? key,
      this.height = 30,
      this.horizontalPadding = 12,
      this.verticalPadding = 12,
      required this.onTap,
      this.borderColor = Colors.transparent,
      this.textColor = lightBlueTextColor,
      this.borderRadius = 5,
      required this.title,
      this.fontWeight = mediumFont,
      this.fontSize = 12,
      this.bgColor = white,
      this.widget,
      this.alignCenter = true,
      this.useHeight = false,
      this.lineHeight = 1.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: useHeight ? height : null,
        alignment: alignCenter ? Alignment.center : null,
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding.w, vertical: verticalPadding.h),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(borderRadius.r),
            border: Border.all(color: borderColor, width: 0.5)),
        child: widget ??
            CustomTextWithLineHeight(
              text: title,
              fontSize: fontSize,
              textColor: textColor,
              lineHeight: lineHeight,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}

class IScanAppBar extends StatelessWidget {
  final String title;
  final bool showActionButton;
  final bool showWidget;
  final Widget? actionWidget;
  final bool showBackButton;
  final double titleFontSize;
  final VoidCallback? onTap;
  final Color arrowBackColor;
  const IScanAppBar({
    Key? key,
    required this.title,
    this.showWidget = true,
    this.showActionButton = false,
    this.actionWidget,
    this.showBackButton = true,
    this.titleFontSize = 20,
    this.onTap,
    this.arrowBackColor = black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 16.w,
            ),
            if (showBackButton)
              Row(
                children: [
                  InkWell(
                    onTap: onTap ??
                        () {
                          context.pop();
                        },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: arrowBackColor,
                    ),
                  ),
                  // SizedBox(
                  //   width: 15.w,
                  // ),
                ],
              ),
            BodyTextPrimaryWithLineHeight(
              text: title,
              textColor: const Color.fromRGBO(14, 14, 14, 1),
              fontSize: titleFontSize,
              fontWeight: semiBoldFont,
              lineHeight: 1.32,
            ),
          ],
        ),
        Row(
          children: [
            if (showActionButton)
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: CustomContainerButton(
                    verticalPadding: 7.h,
                    horizontalPadding: 10.w,
                    bgColor: const Color.fromRGBO(227, 29, 28, 1),
                    textColor: white,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: "Cancel"),
              ),
            if (showWidget)
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: actionWidget,
              )
          ],
        )
      ],
    );
  }
}

class CustomDropdownButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;
  final Widget? customWidget;
  final FontWeight fontWeight;
  final double fontSize;
  const CustomDropdownButton(
      {Key? key,
      required this.title,
      this.borderColor = inputBorderColor,
      this.customWidget,
      this.fontWeight = regularFont,
      this.fontSize = 11,
      this.textColor = const Color.fromRGBO(113, 113, 113, 1),
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 52.h,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: white,
            borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customWidget ??
                CustomTextNoOverFlow(
                  text: title,
                  textColor: textColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
            const Icon(Icons.keyboard_arrow_down_rounded)
          ],
        ),
      ),
    );
  }
}

class CustomDropdownWithLabelButton extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;
  final Widget? customWidget;
  final FontWeight fontWeight;
  final String text;
  final double fontSize;
  final bool isRequired;
  const CustomDropdownWithLabelButton(
      {Key? key,
      required this.label,
      this.borderColor = inputBorderColor,
      this.customWidget,
      this.fontWeight = regularFont,
      this.fontSize = 11,
      this.textColor = const Color.fromRGBO(113, 113, 113, 1),
      this.text = "",
      this.isRequired = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 52.h,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: borderGrey),
            color: white,
            borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   children: [
            //     CustomTextNoOverFlow(
            //       text: label,
            //       textColor: textColor,
            //       fontWeight: fontWeight,
            //       fontSize: fontSize,
            //     ),
            //
            //     if(isRequired)
            //       const RequiredSign(),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextNoOverFlow(
                  text: text,
                  textColor: textColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
                const Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownButtonWithTitleAndSubTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color textColor;
  final Color subTitleColor;
  final Color borderColor;
  final VoidCallback onTap;
  final Widget? customWidget;
  final FontWeight fontWeight;
  final double fontSize;
  const CustomDropdownButtonWithTitleAndSubTitle(
      {Key? key,
      required this.title,
      this.borderColor = inputBorderColor,
      this.customWidget,
      this.fontWeight = regularFont,
      this.fontSize = 11,
      required this.subTitle,
      this.subTitleColor = const Color.fromRGBO(113, 113, 113, 1),
      this.textColor = const Color.fromRGBO(113, 113, 113, 1),
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 52.h,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: white,
            borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextNoOverFlow(
                  text: title,
                  textColor: textColor,
                  fontWeight: fontWeight,
                  fontSize: 11,
                ),
                CustomTextNoOverFlow(
                  text: subTitle,
                  textColor: subTitleColor,
                  fontWeight: fontWeight,
                  fontSize: 13,
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_down_rounded)
          ],
        ),
      ),
    );
  }
}

class RequiredSign extends StatelessWidget {
  const RequiredSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomText(
      text: "*",
      textColor: red,
    );
  }
}
