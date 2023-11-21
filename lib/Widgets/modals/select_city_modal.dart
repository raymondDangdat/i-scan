import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../providers/state_and_city_provider.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/dimension_constants.dart';
import '../../resources/constants/font_constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;
import '../../resources/constants/image_constant.dart';
import '../../resources/styles_manager.dart';
import '../custom_text.dart';
import '../long_divider.dart';
import '../pull_down_indicator.dart';

Future showCitySelectionModal(
  BuildContext importContext,
) {
  return modal.showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: importContext,
    builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
      final searchController = TextEditingController();
      return Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(modalRadius.r),
                topRight: Radius.circular(modalRadius.r)),
          ),
          constraints: BoxConstraints(
            minHeight: 300.h,
            maxHeight: 700.h,
          ),
          child: Consumer<StateAndCityProvider>(
              builder: (ctx, stateAndCityProvider, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 14.h),
                const PullDownIndicator(),
                SizedBox(height: 41.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(3, 31, 76, 0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 16.w,
                          ),
                          SvgPicture.asset(searchIcon),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: TextField(
                            controller: searchController,
                            autofocus: false,
                            autocorrect: false,
                            onChanged: (value) {
                              // if (value.isNotEmpty) {
                              //   stateAndCityProvider.searchForState(value);
                              // } else {
                              //   stateAndCityProvider.resetSearch();
                              // }
                            },
                            cursorColor: mainColor,
                            textInputAction: TextInputAction.search,
                            decoration: const InputDecoration(
                              hintText: "Search",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: textInputStyle(),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: stateAndCityProvider.listOfCities.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final city = stateAndCityProvider.listOfCities[index];
                        return InkWell(
                          onTap: () {
                            stateAndCityProvider.changeSelectedCity(city);
                            Navigator.pop(context, true);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BodyTextPrimaryWithLineHeight(
                                    text: city.name,
                                    textColor: const Color(0xFF181C26),
                                    fontSize: 14,
                                    fontWeight: boldFont,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                      child: LongDivider(
                                          color:
                                              Color.fromRGBO(232, 233, 235, 1),
                                          height: 0.5)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          }));
    }),
  );
}
// {
//   return showMaterialModalBottomSheet(
//     backgroundColor: Colors.transparent,
//     context: context,
//     builder: (context) => StatefulBuilder(builder: (context, setStateSB) {
//       return Container(
//         constraints: BoxConstraints(
//             minHeight: 100.h,
//             maxHeight: 656.h
//         ),
//         decoration: BoxDecoration(
//           color: white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.r),
//               topRight: Radius.circular(20.r)),
//         ),
//         child:
//         Consumer<StateAndCityProvider>(builder: (ctx, stateAndCityProvider, child) {
//           return SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 14.h),
//                 const PullDownIndicator(),
//                 SizedBox(height: 19.h,),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SemiBold16px(text: selectAnOption),
//                   ],
//                 ),
//
//                 SizedBox(height: 14.h,),
//                 SizedBox(
//                   // height: 200.h,
//                   child: ListView.builder(
//                       padding: const EdgeInsets.all(0),
//                       itemCount: stateAndCityProvider.listOfCities.length,
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemBuilder: (context, index){
//                         final state = stateAndCityProvider.listOfCities[index];
//                         return Padding(
//                           padding: EdgeInsets.only(
//                               top: 11.h
//                           ),
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 10.h,
//                                 horizontal: 11.w
//                             ),
//                             decoration: BoxDecoration(
//                                 color: stateAndCityProvider.selectedCity == state ? black : white,
//                                 borderRadius: BorderRadius.circular(9.r)
//                             ),
//                             child: InkWell(
//                               onTap: (){
//                                 stateAndCityProvider.changeSelectedCity(state);
//                                 Navigator.pop(context);
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           BodyTextPrimaryWithLineHeight(text: state.name,
//                                             textColor: stateAndCityProvider.selectedCity == state ? white :  black,
//                                             fontSize: 13,
//                                             fontWeight: semiBoldFont,),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//
//                                   Container(
//                                     height: 18.h,
//                                     width: 18.h,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(100.r),
//                                         border: Border.all(
//                                             width: state == stateAndCityProvider.selectedCity ? 2 : 1,
//                                             color: state == stateAndCityProvider.selectedCity ? white : const Color.fromRGBO(0, 0, 0, 0.33))
//                                     ),
//                                   )
//                                 ],
//                               ),
//
//                             ),
//                           ),
//                         );
//                       }),
//                 ),
//
//                 // SizedBox(height: 49.h,),
//                 // MainButton(proceed, () {
//                 //   if(stateAndCityProvider.selectedCity != null){
//                 //     Navigator.pop(context);
//                 //   }
//                 // },
//                 //   color: black,),
//
//                 SizedBox(height: 20.h,),
//               ],
//             ),
//           );
//         }),
//       );
//     }),
//   );
// }
