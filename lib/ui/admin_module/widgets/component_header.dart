// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
//
//
// class ComponentHeader extends StatelessWidget {
//   final String title;
//   final bool showSearchBar;
//   const ComponentHeader(
//       {Key? key, required this.title, this.showSearchBar = false})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: Column(
//         children: [
//           SizedBox(
//             height: 12.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 16.w),
//                 child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: SizedBox(
//                         // color: ColorManager.payCardColor,
//                         height: 32.h,
//                         width: 32.h,
//                         child: SvgPicture.asset(AppImages.arrowBackFrame))),
//               ),
//               HeaderText(
//                 text: title,
//                 isUpperCase: true,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: AppSize.s16.w),
//                 child: Row(
//                   children: [
//                     Consumer<NotificationProvider>(
//                         builder: (ctx, notificationProvider, child) {
//                       return InkWell(
//                         onTap: () {},
//                         child: GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(
//                                   context, Routes.notificationsView);
//                             },
//                             child: SizedBox(
//                                 height: AppSize.s32.h,
//                                 width: AppSize.s32.h,
//                                 child: SvgPicture.asset(
//                                     notificationProvider.hasUnreadMessage
//                                         ? AppImages.notificationBell
//                                         : AppImages.notificationIconInActive))),
//                       );
//                     }),
//                     SizedBox(
//                       width: AppSize.s7.w,
//                     ),
//                     InkWell(
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () {
//                           Navigator.pushNamed(context, Routes.settingsHome);
//                         },
//                         child: SizedBox(
//                           height: AppSize.s32.h,
//                           width: AppSize.s32.h,
//                           child: SvgPicture.asset(AppImages.avata),
//                           // decoration: const BoxDecoration(
//                           //     image: DecorationImage(
//                           //         image: AssetImage(
//                           //           AppImages.avatar,
//                           //         ),
//                           //         fit: BoxFit.cover)),
//                         )),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           if (showSearchBar)
//             SizedBox(
//               height: AppSize.s19.h,
//             ),
//           if (showSearchBar)
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: AppSize.s20.w),
//               child: Container(
//                 width: double.infinity,
//                 height: AppSize.s48.h,
//                 decoration: BoxDecoration(
//                   color: ColorManager.whiteColor,
//                   borderRadius: BorderRadius.circular(AppSize.s50.r),
//                   // border: Border.all(
//                   //   color: ColorManager.inputBorderColor,
//                   // ),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color.fromRGBO(3, 31, 76, 0.1),
//                       spreadRadius: 3,
//                       blurRadius: 5,
//                       offset: Offset(1, 2), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: AppSize.s16.w,
//                     ),
//                     SvgPicture.asset(AppImages.searchIcon),
//                     SizedBox(
//                       width: AppSize.s10.w,
//                     ),
//                     Expanded(
//                       child: Consumer2<ShopProvider, ContactProvider>(
//                           builder: (ctx, mktProvider, contactProvider, child) {
//                         return TextField(
//                           // controller: _controller,
//                           autocorrect: false,
//                           onChanged: (value) {
//                             if (value.isNotEmpty) {
//                               if (contactProvider.showRecentSent) {
//                                 mktProvider.searchResendSends(value);
//                               } else {
//                                 contactProvider.searchContacts(value);
//                               }
//                             } else {
//                               contactProvider.resetContacts();
//                               mktProvider.resetResendSends(value);
//                             }
//                             // if (value != '') {
//                             //   mktProvider
//                             //       .searchNonProfitss(searchProvider.searchText);
//                             // } else {
//                             //   mktProvider.resetNonProfits();
//                             // }
//                             // searchProvider.updateSearchResult(value);
//                           },
//                           cursorColor: ColorManager.primaryColor,
//                           textInputAction: TextInputAction.search,
//                           decoration: const InputDecoration(
//                             hintText: "search by recepient or transaction type",
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                             ),
//                             disabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                           style: textInputStyle(),
//                         );
//                       }),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }
