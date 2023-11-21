// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:hash_it/Widgets/components.dart';
// // import 'package:hash_it/resources/constants/dimension_constants.dart';
// // import 'package:iconsax/iconsax.dart';
// // import 'package:provider/provider.dart';
// // import '../../../Utils/functions.dart';
// // import '../../../Widgets/custom_snack_back.dart';
// // import '../../../Widgets/custom_text.dart';
// // import '../../../providers/auth_provider.dart';
// // import '../../../providers/bottom_nav_provider.dart';
// // import '../../../resources/constants/color_constants.dart';
// // import '../../../resources/constants/font_constants.dart';
// // import '../../../resources/constants/image_constant.dart';
// // import '../../../resources/constants/string_constants.dart';
// // import '../../../resources/navigation_utils.dart';
// //
// // class MoreScreen extends StatefulWidget {
// //   const MoreScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MoreScreen> createState() => _MoreScreenState();
// // }
// //
// // class _MoreScreenState extends State<MoreScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final auth = context.watch<AuthProvider>();
// //     final bottomNavProvider = context.watch<BottomNavProvider>();
// //     return Scaffold(
// //       backgroundColor: appBgColor,
// //       body: SingleChildScrollView(
// //         child: Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
// //             return Container(
// //               decoration: const BoxDecoration(
// //                 color: Color(0xFFE5E5E5)
// //               ),
// //               height: MediaQuery.of(context).size.height,
// //               width: MediaQuery.of(context).size.width,
// //               child: Stack(
// //                 children: [
// //                   Positioned(
// //                     top: 0,
// //                     child: Container(
// //                       height: 232.h,
// //                       width: MediaQuery.of(context).size.width,
// //                       decoration: BoxDecoration(
// //                         color: const Color(0xFF2D5AFC),
// //                         borderRadius: BorderRadius.only(
// //                           bottomLeft: Radius.circular(8.r),
// //                           bottomRight: Radius.circular(8.r)
// //                         )
// //                       ),
// //                       alignment: Alignment.topLeft,
// //                       child: Padding(
// //                         padding: EdgeInsets.symmetric(
// //                           horizontal: horizontalPadding.w,
// //                           vertical: 19.h
// //                         ),
// //                         child: const Row(
// //                           children: [
// //                             HeaderText(text: more, textColor: white, fontSize: 18, fontWeight: boldFont,),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   Positioned(
// //                     left: horizontalPadding.w,
// //                     right: horizontalPadding.w,
// //                     top: 117.h,
// //                     child: Container(
// //                       height: 1000.h,
// //                       width: MediaQuery.of(context).size.width,
// //                       decoration: BoxDecoration(
// //                         color: const Color.fromRGBO(242, 242, 242, 1),
// //                         borderRadius: BorderRadius.circular(16.r)
// //                       ),
// //                       child: Stack(
// //                         clipBehavior: Clip.none,
// //                         children: [
// //                           Positioned(
// //                             top: -30.h,
// //                             right: 47.w,
// //                             left: 47.w,
// //                             child: Container(
// //                               height: 64.h,
// //                               // width: 251.w,
// //                               decoration: BoxDecoration(
// //                                   color: const Color.fromRGBO(211, 219, 249, 1),
// //                                   borderRadius: BorderRadius.circular(
// //                                       20.r
// //                                   )
// //                               ),
// //                               child: Row(
// //                                 children: [
// //                                   Container(
// //                                     height: 64.h,
// //                                     width: 64.h,
// //                                     decoration: BoxDecoration(
// //                                         color: cardColor,
// //                                         image:  DecorationImage(image: NetworkImage(authProvider.userProfile == null || authProvider.userProfile!.data.avatar == null || authProvider.userProfile!.data.avatar.toString().isEmpty ? "" : authProvider.userProfile!.data.avatar), fit: BoxFit.cover),
// //                                         borderRadius: BorderRadius.circular(16.r)
// //                                     ),
// //                                   ),
// //                                   SizedBox(width: 8.w,),
// //                                   Column(
// //                                     crossAxisAlignment: CrossAxisAlignment.start,
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       BodyTextPrimaryWithLineHeight(text: "${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}", textColor: black,
// //                                         fontSize: 16,
// //                                         fontWeight: boldFont,),
// //                                       SizedBox(height: 3.h,),
// //                                       Row(
// //                                         children: [
// //                                           const BodyTextPrimaryWithLineHeight(text: verified, textColor: Color.fromRGBO(100, 103, 115, 1),
// //                                             fontSize: 10,
// //                                             lineHeight: 1.5,),
// //                                           InkWell(
// //                                             onTap: (){
// //                                             },
// //                                             child: SizedBox(height: 16.h,
// //                                               width: 16.h,
// //                                               child: SvgPicture.asset(verifyImgSmall),),
// //                                           ),
// //                                         ],
// //                                       )
// //                                     ],
// //                                   )
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                           Positioned(
// //                             top: 50.h,
// //                             right: 17.w,
// //                             left: 17.w,
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 MainButton(editProfile, () { },
// //                                   widget: Row(
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       SvgPicture.asset(editProfileImgSvg),
// //                                       SizedBox(width: 8.w,),
// //                                       const BodyTextPrimaryWithLineHeight(text: editProfile, textColor: Color(0xFFE9ECEF),
// //                                         fontSize: 12,
// //                                         lineHeight: 1.33,
// //                                         fontWeight: boldFont,),
// //                                     ],
// //                                   ),
// //                                 ),
// //                                 SizedBox(height: 32.h,),
// //                                 const HeaderText(text: accountInformation, textColor: black, fontSize: 16, fontWeight: boldFont,
// //                                   isUpperCase: false,),
// //
// //                                 SizedBox(height: 19.h,),
// //                                 AccountInformationItem(title: hashITTag, value: authProvider.userProfile != null && authProvider.userProfile!.data.username.toString().isNotEmpty ? '#${authProvider.userProfile?.data.username}' : 'No Tag', copyFunction: (){
// //                                   if(authProvider.userProfile != null && authProvider.userProfile!.data.username.toString().isNotEmpty){
// //                                     copyToClipboard(authProvider.userProfile!.data.username);
// //                                   }else{
// //                                     customSnackBar(context, "No HashIT Tag");
// //                                   }
// //                                 }),
// //                                 SizedBox(height: 8.h,),
// //                                 AccountInformationItem(title: accountName, value: authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty ? '${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}' : 'No Account', copyFunction: (){
// //                                   if(authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty){
// //                                     copyToClipboard('${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}');
// //                                   }else{
// //                                     customSnackBar(context, "No Account Name");
// //                                   }
// //                                 }),
// //
// //                                 SizedBox(height: 8.h,),
// //                                 AccountInformationItem(title: bankName, value: authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty ? '${authProvider.userProfile?.data.accounts[0].bankName} ' : 'No Bank Details', copyFunction: (){
// //                                   if(authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty){
// //                                     copyToClipboard('${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.accounts[0].bankName}');
// //                                   }else{
// //                                     customSnackBar(context, "No Account Name");
// //                                   }
// //                                 }),
// //                                 SizedBox(height: 8.h,),
// //                                 AccountInformationItem(title: accountNumber, value: authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty ? '${authProvider.userProfile?.data.accounts[0].accountNumber}' : 'No Account', copyFunction: (){
// //                                   if(authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty){
// //                                     copyToClipboard('${authProvider.userProfile?.data.accounts[0].accountNumber}');
// //                                   }else{
// //                                     customSnackBar(context, "No Account Number");
// //                                   }
// //                                 }),
// //                                 SizedBox(height: 8.h,),
// //                                 AccountInformationItem(title: email, value: authProvider.userProfile != null ? '${authProvider.userProfile?.data.email}' : 'No Email', copyFunction: (){
// //                                   if(authProvider.userProfile != null){
// //                                     copyToClipboard(authProvider.userProfile!.data.email);
// //                                   }else{
// //                                     customSnackBar(context, "No Email");
// //                                   }
// //                                 }),
// //                                 SizedBox(height: 8.h,),
// //                                 AccountInformationItem(title: phoneNumber, value: authProvider.userProfile != null ? '${authProvider.userProfile?.data.phoneNumber}' : 'No Phone number', copyFunction: (){
// //                                   if(authProvider.userProfile != null){
// //                                     copyToClipboard(authProvider.userProfile!.data.phoneNumber);
// //                                   }else{
// //                                     customSnackBar(context, "No Phone number");
// //                                   }
// //                                 }),
// //
// //
// //                                 SizedBox(height: 24.h,),
// //                                 Column(
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   children: [
// //                                     SizedBox(height: 24.h,),
// //                                     const HeaderText(text: security, textColor: black, fontSize: 16, fontWeight: boldFont,
// //                                       isUpperCase: false,),
// //                                     SizedBox(height: 14.h,),
// //                                     SecurityItem(leadingIconName: securitySettingsLockIcon, title: resetPassword, onTap: (){}),
// //                                     SizedBox(height: 14.h,),
// //                                     SecurityItem(leadingIconName: securitySettingsLockIcon, title: resetPassword, onTap: (){}),
// //                                     SizedBox(height: 14.h,),
// //                                     SecurityItem(leadingIconName: securitySettingsLockIcon, title: resetPassword, onTap: (){}),
// //                                     SizedBox(height: 14.h,),
// //                                     SecurityItem(leadingIconName: securitySettingsLockIcon, title: resetPassword, onTap: (){}),
// //                                     SizedBox(height: 14.h,),
// //
// //                                   ],
// //                                 )
// //                               ],
// //                             ),
// //                           ),
// //
// //
// //                         ],
// //                       ),
// //                     ),
// //
// //                   ),
// //
// //                   // Positioned(
// //                   //   top: 650.h,
// //                   //   left: horizontalPadding.w,
// //                   //   right: horizontalPadding.w,
// //                   //   child: Container(
// //                   //     height: 400,
// //                   //     child: Column(
// //                   //       crossAxisAlignment: CrossAxisAlignment.start,
// //                   //       children: [
// //                   //         SizedBox(height: 24.h,),
// //                   //         const HeaderText(text: security, textColor: black, fontSize: 16, fontWeight: boldFont,
// //                   //           isUpperCase: false,),
// //                   //         SizedBox(height: 14.h,),
// //                   //         SecurityItem(leadingIconName: securitySettingsLockIcon, title: resetPassword, onTap: (){}),
// //                   //         SizedBox(height: 14.h,),
// //                   //         SecurityItem(leadingIconName: securitySettingsLockIcon, title: resetPassword, onTap: (){}),
// //                   //         SizedBox(height: 14.h,),
// //                   //         SecurityItem(leadingIconName: securitySettingsLockIcon, title: resetPassword, onTap: (){}),
// //                   //         SizedBox(height: 14.h,),
// //                   //         SecurityItem(leadingIconName: securitySettingsLockIcon, title: resetPassword, onTap: (){}),
// //                   //         SizedBox(height: 14.h,),
// //                   //
// //                   //       ],
// //                   //     ),
// //                   //   ),
// //                   // ),
// //
// //
// //
// //
// //                 ],
// //               ),
// //             );
// //           }
// //         ),
// //       )
// //
// //     );
// //   }
// // }
// //
// //
// //
// // class AccountInformationItem extends StatelessWidget {
// //   final String title;
// //   final String value;
// //   final VoidCallback copyFunction;
// //   const AccountInformationItem({Key? key,
// //     required this.title, required this.value, required this.copyFunction}) : super(key: key);
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(16.r),
// //       decoration:  BoxDecoration(
// //         color: const Color.fromRGBO(232, 233, 235, 1),
// //         borderRadius: BorderRadius.circular(8.r)
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           BodyTextPrimaryWithLineHeight(text: title, textColor: const Color.fromRGBO(122, 125, 135, 1),
// //             fontSize: 12,
// //             lineHeight: 1.2,
// //             fontWeight: mediumFont,),
// //           InkWell(
// //             onTap: copyFunction,
// //             child: Row(
// //               children: [
// //                 BodyTextPrimaryWithLineHeight(text: value, textColor: const Color.fromRGBO(24, 29, 38, 1),
// //                   fontSize: 12,
// //                   lineHeight: 1.33,
// //                   fontWeight: boldFont,),
// //                 SizedBox(width: 5.w,),
// //                 Icon(Iconsax.document_copy, size: 20.h,color: const Color.fromRGBO(167, 169, 175, 1),)
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //
// // class SecurityItem extends StatelessWidget {
// //   final String leadingIconName;
// //   final String title;
// //   final String trailingIcon;
// //   final VoidCallback onTap;
// //   const SecurityItem({Key? key, required this.leadingIconName, required this.title, this.trailingIcon = forwardIcon, required this.onTap}) : super(key: key);
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: onTap,
// //       child: Container(
// //           padding: EdgeInsets.only(
// //               top: 11.h,
// //               left: 11.w,
// //               bottom: 11.h,
// //               right: 19.w
// //           ),
// //           decoration: BoxDecoration(
// //               color: const Color.fromRGBO(232, 233, 235, 1),
// //               borderRadius: BorderRadius.circular(9.r)
// //           ),
// //           child: Row(
// //             children: [
// //               Container(
// //                 padding: EdgeInsets.all(11.r),
// //                 decoration: const ShapeDecoration(
// //                   color: Color(0x118B83BC),
// //                   shape: OvalBorder(),
// //                 ),
// //                 child: SvgPicture.asset(leadingIconName),
// //               ),
// //               SizedBox(width: 11.w,),
// //                Expanded(
// //                 child: BodyTextPrimaryWithLineHeight(text: title, textColor: black,
// //                   fontSize: 14,
// //                   fontWeight: boldFont,),
// //               ),
// //               SvgPicture.asset(trailingIcon)
// //             ],
// //           )
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:hash_it/Widgets/components.dart';
// import 'package:hash_it/resources/constants/dimension_constants.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:provider/provider.dart';
// import '../../../Utils/functions.dart';
// import '../../../Widgets/custom_snack_back.dart';
// import '../../../Widgets/custom_text.dart';
// import '../../../providers/auth_provider.dart';
// import '../../../resources/constants/color_constants.dart';
// import '../../../resources/constants/font_constants.dart';
// import '../../../resources/constants/image_constant.dart';
// import '../../../resources/constants/string_constants.dart';
//
// class MoreScreen extends StatefulWidget {
//   const MoreScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MoreScreen> createState() => _MoreScreenState();
// }
//
// class _MoreScreenState extends State<MoreScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: appBgColor,
//         body: SingleChildScrollView(
//           child: Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
//             return Stack(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                       color: Color(0xFFE5E5E5)
//                   ),
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         top: 0,
//                         child: Container(
//                           height: 232.h,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                               color: const Color(0xFF2D5AFC),
//                               borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(8.r),
//                                   bottomRight: Radius.circular(8.r)
//                               )
//                           ),
//                           alignment: Alignment.topLeft,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: horizontalPadding.w,
//                                 vertical: 19.h
//                             ),
//                             child: const Row(
//                               children: [
//                                 HeaderText(text: more, textColor: white, fontSize: 18, fontWeight: boldFont,),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: horizontalPadding.w,
//                         right: horizontalPadding.w,
//                         top: 117.h,
//                         child: Container(
//                           height: 1000.h,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                               color: const Color.fromRGBO(242, 242, 242, 1),
//                               borderRadius: BorderRadius.circular(16.r)
//                           ),
//                           child: Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               Positioned(
//                                 top: -30.h,
//                                 right: 47.w,
//                                 left: 47.w,
//                                 child: Container(
//                                   height: 64.h,
//                                   // width: 251.w,
//                                   decoration: BoxDecoration(
//                                       color: const Color.fromRGBO(211, 219, 249, 1),
//                                       borderRadius: BorderRadius.circular(
//                                           20.r
//                                       )
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         height: 64.h,
//                                         width: 64.h,
//                                         decoration: BoxDecoration(
//                                             color: cardColor,
//                                             image:  DecorationImage(image: NetworkImage(authProvider.userProfile == null || authProvider.userProfile!.data.avatar == null || authProvider.userProfile!.data.avatar.toString().isEmpty ? "" : authProvider.userProfile!.data.avatar), fit: BoxFit.cover),
//                                             borderRadius: BorderRadius.circular(16.r)
//                                         ),
//                                       ),
//                                       SizedBox(width: 8.w,),
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           BodyTextPrimaryWithLineHeight(text: "${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}", textColor: black,
//                                             fontSize: 16,
//                                             fontWeight: boldFont,),
//                                           SizedBox(height: 3.h,),
//                                           Row(
//                                             children: [
//                                               const BodyTextPrimaryWithLineHeight(text: verified, textColor: Color.fromRGBO(100, 103, 115, 1),
//                                                 fontSize: 10,
//                                                 lineHeight: 1.5,),
//                                               InkWell(
//                                                 onTap: (){
//                                                 },
//                                                 child: SizedBox(height: 16.h,
//                                                   width: 16.h,
//                                                   child: SvgPicture.asset(verifyImgSmall),),
//                                               ),
//                                             ],
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 50.h,
//                                 right: 17.w,
//                                 left: 17.w,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     MainButton(editProfile, () { },
//                                       widget: Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           SvgPicture.asset(editProfileImgSvg),
//                                           SizedBox(width: 8.w,),
//                                           const BodyTextPrimaryWithLineHeight(text: editProfile, textColor: Color(0xFFE9ECEF),
//                                             fontSize: 12,
//                                             lineHeight: 1.33,
//                                             fontWeight: boldFont,),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(height: 32.h,),
//                                     const HeaderText(text: accountInformation, textColor: black, fontSize: 16, fontWeight: boldFont,
//                                       isUpperCase: false,),
//
//                                     SizedBox(height: 19.h,),
//                                     AccountInformationItem(title: hashITTag, value: authProvider.userProfile != null && authProvider.userProfile!.data.username.toString().isNotEmpty ? '#${authProvider.userProfile?.data.username}' : 'No Tag', copyFunction: (){
//                                       if(authProvider.userProfile != null && authProvider.userProfile!.data.username.toString().isNotEmpty){
//                                         copyToClipboard(authProvider.userProfile!.data.username);
//                                       }else{
//                                         customSnackBar(context, "No HashIT Tag");
//                                       }
//                                     }),
//                                     SizedBox(height: 8.h,),
//                                     AccountInformationItem(title: accountName, value: authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty ? '${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}' : 'No Account', copyFunction: (){
//                                       if(authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty){
//                                         copyToClipboard('${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}');
//                                       }else{
//                                         customSnackBar(context, "No Account Name");
//                                       }
//                                     }),
//
//                                     SizedBox(height: 8.h,),
//                                     AccountInformationItem(title: bankName, value: authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty ? '${authProvider.userProfile?.data.accounts[0].bankName} ' : 'No Bank Details', copyFunction: (){
//                                       if(authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty){
//                                         copyToClipboard('${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.accounts[0].bankName}');
//                                       }else{
//                                         customSnackBar(context, "No Account Name");
//                                       }
//                                     }),
//                                     SizedBox(height: 8.h,),
//                                     AccountInformationItem(title: accountNumber, value: authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty ? '${authProvider.userProfile?.data.accounts[0].accountNumber}' : 'No Account', copyFunction: (){
//                                       if(authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty){
//                                         copyToClipboard('${authProvider.userProfile?.data.accounts[0].accountNumber}');
//                                       }else{
//                                         customSnackBar(context, "No Account Number");
//                                       }
//                                     }),
//                                     SizedBox(height: 8.h,),
//                                     AccountInformationItem(title: email, value: authProvider.userProfile != null ? '${authProvider.userProfile?.data.email}' : 'No Email', copyFunction: (){
//                                       if(authProvider.userProfile != null){
//                                         copyToClipboard(authProvider.userProfile!.data.email);
//                                       }else{
//                                         customSnackBar(context, "No Email");
//                                       }
//                                     }),
//                                     SizedBox(height: 8.h,),
//                                     AccountInformationItem(title: phoneNumber, value: authProvider.userProfile != null ? '${authProvider.userProfile?.data.phoneNumber}' : 'No Phone number', copyFunction: (){
//                                       if(authProvider.userProfile != null){
//                                         copyToClipboard(authProvider.userProfile!.data.phoneNumber);
//                                       }else{
//                                         customSnackBar(context, "No Phone number");
//                                       }
//                                     }),
//                                   ],
//                                 ),
//                               ),
//
//
//                             ],
//                           ),
//                         ),
//
//                       ),
//
//
//
//
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: 24.h,),
//
//
//               ],
//             );
//           }
//           ),
//         )
//
//     );
//   }
// }
//
//
//
// class AccountInformationItem extends StatelessWidget {
//   final String title;
//   final String value;
//   final VoidCallback copyFunction;
//   const AccountInformationItem({Key? key,
//     required this.title, required this.value, required this.copyFunction}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.r),
//       decoration:  BoxDecoration(
//           color: const Color.fromRGBO(232, 233, 235, 1),
//           borderRadius: BorderRadius.circular(8.r)
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           BodyTextPrimaryWithLineHeight(text: title, textColor: const Color.fromRGBO(122, 125, 135, 1),
//             fontSize: 12,
//             lineHeight: 1.2,
//             fontWeight: mediumFont,),
//           InkWell(
//             onTap: copyFunction,
//             child: Row(
//               children: [
//                 BodyTextPrimaryWithLineHeight(text: value, textColor: const Color.fromRGBO(24, 29, 38, 1),
//                   fontSize: 12,
//                   lineHeight: 1.33,
//                   fontWeight: boldFont,),
//                 SizedBox(width: 5.w,),
//                 Icon(Iconsax.document_copy, size: 20.h,color: const Color.fromRGBO(167, 169, 175, 1),)
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class SecurityItem extends StatelessWidget {
//   final String leadingIconName;
//   final String title;
//   final String trailingIcon;
//   final VoidCallback onTap;
//   const SecurityItem({Key? key, required this.leadingIconName, required this.title, this.trailingIcon = forwardIcon, required this.onTap}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//           padding: EdgeInsets.only(
//               top: 11.h,
//               left: 11.w,
//               bottom: 11.h,
//               right: 19.w
//           ),
//           decoration: BoxDecoration(
//               color: const Color.fromRGBO(232, 233, 235, 1),
//               borderRadius: BorderRadius.circular(9.r)
//           ),
//           child: Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(11.r),
//                 decoration: const ShapeDecoration(
//                   color: Color(0x118B83BC),
//                   shape: OvalBorder(),
//                 ),
//                 child: SvgPicture.asset(leadingIconName),
//               ),
//               SizedBox(width: 11.w,),
//               Expanded(
//                 child: BodyTextPrimaryWithLineHeight(text: title, textColor: black,
//                   fontSize: 14,
//                   fontWeight: boldFont,),
//               ),
//               SvgPicture.asset(trailingIcon)
//             ],
//           )
//       ),
//     );
//   }
// }
