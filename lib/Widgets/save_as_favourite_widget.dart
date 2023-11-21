import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/favourite_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';
import 'components.dart';
import 'custom_text.dart';
import 'label_widget.dart';
import 'textfields.dart';

class SaveAsFavouriteWidget extends StatefulWidget {
  const SaveAsFavouriteWidget({Key? key}) : super(key: key);

  @override
  State<SaveAsFavouriteWidget> createState() => _SaveAsFavouriteWidgetState();
}

class _SaveAsFavouriteWidgetState extends State<SaveAsFavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
        builder: (ctx, favouriteProvider, child) {
      return !favouriteProvider.showFavouriteWidget
          ? Container()
          : Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CustomContainerButton(
                  onTap: () {
                    setState(() {
                      favouriteProvider.toggleSaveAsFavourite();
                    });
                  },
                  title: "",
                  borderRadius: 9,
                  bgColor: favouriteProvider.saveAsFavourite
                      ? Colors.green
                      : const Color(0x11282828),
                  widget: Row(
                    children: [
                      SizedBox(
                          height: 18.h,
                          width: 18.h,
                          child: SvgPicture.asset(
                              favouriteProvider.saveAsFavourite
                                  ? checkboxChecked
                                  : checkboxUnchecked)),
                      SizedBox(
                        width: 11.w,
                      ),
                      CustomTextWithLineHeight(
                        text: saveAsFavourite,
                        fontSize: 12,
                        textColor:
                            favouriteProvider.saveAsFavourite ? white : black,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                if (favouriteProvider.saveAsFavourite)
                  Column(
                    children: [
                      const LabelWidget(label: favoriteNickname),
                      Row(
                        children: [
                          Expanded(
                            child: CustomField(
                              "",
                              favouriteProvider.favouriteNicknameController,
                              type: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            );
    });
  }
}
