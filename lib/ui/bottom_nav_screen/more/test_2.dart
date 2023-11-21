// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../providers/auth_provider.dart';
//
// class Test2 extends StatefulWidget {
//   const Test2({Key? key}) : super(key: key);
//
//   @override
//   State<Test2> createState() => _Test2State();
// }
//
// class _Test2State extends State<Test2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
//           return Stack(
//             clipBehavior: Clip.none,
//             children: <Widget>[
//               Container(
//                 height: 200.h,
//                 decoration:  BoxDecoration(
//                     color: const Color(0xFF2D5AFC),
//                   borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(20.r),
//                     bottomLeft: Radius.circular(20.r)
//                   )
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: 0,
//                       child: Container(
//                         height: 232.h,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                             color: const Color(0xFF2D5AFC),
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(8.r),
//                                 bottomRight: Radius.circular(8.r)
//                             )
//                         ),
//                         alignment: Alignment.topLeft,
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: horizontalPadding.w,
//                               vertical: 19.h
//                           ),
//                           child:  const Row(
//                             children: [
//                               HeaderText(text: more, textColor: white, fontSize: 18, fontWeight: boldFont,),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 110.h,
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 // left: horizontalPadding.w,
//                 // right: horizontalPadding.w,
//                 child: Container(
//                     color: Colors.transparent, height: 1000,
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 530.h,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                             color: const Color.fromRGBO(242, 242, 242, 1),
//                             borderRadius: BorderRadius.circular(16.r)
//                         ),
//                         child: Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             Positioned(
//                               top: -30.h,
//                               right: 47.w,
//                               left: 47.w,
//                               child: Container(
//                                 height: 64.h,
//                                 // width: 251.w,
//                                 decoration: BoxDecoration(
//                                     color: const Color.fromRGBO(211, 219, 249, 1),
//                                     borderRadius: BorderRadius.circular(
//                                         20.r
//                                     )
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       height: 64.h,
//                                       width: 64.h,
//                                       decoration: BoxDecoration(
//                                           color: cardColor,
//                                           image:  DecorationImage(image: NetworkImage(authProvider.userProfile == null || authProvider.userProfile!.data.avatar == null || authProvider.userProfile!.data.avatar.toString().isEmpty ? "" : authProvider.userProfile!.data.avatar), fit: BoxFit.cover),
//                                           borderRadius: BorderRadius.circular(16.r)
//                                       ),
//                                     ),
//                                     SizedBox(width: 8.w,),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         BodyTextPrimaryWithLineHeight(text: "${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}", textColor: black,
//                                           fontSize: 16,
//                                           fontWeight: boldFont,),
//                                         SizedBox(height: 3.h,),
//                                         Row(
//                                           children: [
//                                             const BodyTextPrimaryWithLineHeight(text: verified, textColor: Color.fromRGBO(100, 103, 115, 1),
//                                               fontSize: 10,
//                                               lineHeight: 1.5,),
//                                             InkWell(
//                                               onTap: (){
//                                               },
//                                               child: SizedBox(height: 16.h,
//                                                 width: 16.h,
//                                                 child: SvgPicture.asset(verifyImgSmall),),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: 50.h,
//                               right: 17.w,
//                               left: 17.w,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   MainButton(editProfile, () { },
//                                     widget: Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         SvgPicture.asset(editProfileImgSvg),
//                                         SizedBox(width: 8.w,),
//                                         const BodyTextPrimaryWithLineHeight(text: editProfile, textColor: Color(0xFFE9ECEF),
//                                           fontSize: 12,
//                                           lineHeight: 1.33,
//                                           fontWeight: boldFont,),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: 32.h,),
//                                   const HeaderText(text: accountInformation, textColor: black, fontSize: 16, fontWeight: boldFont,
//                                     isUpperCase: false,),
//
//                                   SizedBox(height: 19.h,),
//                                   AccountInformationItem(title: hashITTag, value: authProvider.userProfile != null && authProvider.userProfile!.data.username.toString().isNotEmpty ? '#${authProvider.userProfile?.data.username}' : 'No Tag', copyFunction: (){
//                                     if(authProvider.userProfile != null && authProvider.userProfile!.data.username.toString().isNotEmpty){
//                                       copyToClipboard(authProvider.userProfile!.data.username);
//                                     }else{
//                                       customSnackBar(context, "No HashIT Tag");
//                                     }
//                                   }),
//                                   SizedBox(height: 8.h,),
//                                   AccountInformationItem(title: accountName, value: authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty ? '${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}' : 'No Account', copyFunction: (){
//                                     if(authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty){
//                                       copyToClipboard('${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}');
//                                     }else{
//                                       customSnackBar(context, "No Account Name");
//                                     }
//                                   }),
//
//                                   SizedBox(height: 8.h,),
//                                   AccountInformationItem(title: bankName, value: authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty ? '${authProvider.userProfile?.data.accounts[0].bankName} ' : 'No Bank Details', copyFunction: (){
//                                     if(authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty){
//                                       copyToClipboard('${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.accounts[0].bankName}');
//                                     }else{
//                                       customSnackBar(context, "No Account Name");
//                                     }
//                                   }),
//                                   SizedBox(height: 8.h,),
//                                   AccountInformationItem(title: accountNumber, value: authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty ? '${authProvider.userProfile?.data.accounts[0].accountNumber}' : 'No Account', copyFunction: (){
//                                     if(authProvider.userProfile != null && authProvider.userProfile!.data.accounts.isNotEmpty){
//                                       copyToClipboard('${authProvider.userProfile?.data.accounts[0].accountNumber}');
//                                     }else{
//                                       customSnackBar(context, "No Account Number");
//                                     }
//                                   }),
//                                   SizedBox(height: 8.h,),
//                                   AccountInformationItem(title: email, value: authProvider.userProfile != null ? '${authProvider.userProfile?.data.email}' : 'No Email', copyFunction: (){
//                                     if(authProvider.userProfile != null){
//                                       copyToClipboard(authProvider.userProfile!.data.email);
//                                     }else{
//                                       customSnackBar(context, "No Email");
//                                     }
//                                   }),
//                                   SizedBox(height: 8.h,),
//                                   AccountInformationItem(title: phoneNumber, value: authProvider.userProfile != null ? '${authProvider.userProfile?.data.phoneNumber}' : 'No Phone number', copyFunction: (){
//                                     if(authProvider.userProfile != null){
//                                       copyToClipboard(authProvider.userProfile!.data.phoneNumber);
//                                     }else{
//                                       customSnackBar(context, "No Phone number");
//                                     }
//                                   }),
//
//                                 ],
//                               ),
//                             ),
//
//
//                           ],
//                         ),
//                       ),
//                       Column(
//                         children: [
//
//                           SizedBox(height: 19.h,),
//                           const HeaderText(text: security, textColor: black, fontSize: 16, fontWeight: boldFont,
//                             isUpperCase: false,),
//                           SizedBox(height: 14.h,),
//                           SecurityItem(leadingIconName: securitySettingsLockIcon, title: resetPassword, onTap: (){
//                             openChangePasswordScreen(context);
//                           }),
//                           SizedBox(height: 14.h,),
//                           SecurityItem(leadingIconName: securitySettingsLockIcon, title: changeTransactionPIN, onTap: (){
//                             openResetPINScreen(context);
//                           }),
//                           SizedBox(height: 14.h,),
//                           SecurityItem(leadingIconName: securitySettingFaceIdIcon, title: useFaceId, trailingIcon: authProvider.useFaceID ? settingsToggleOn : settingsToggleOff,
//                               onTap: (){
//                                 authProvider.updateUseFaceID(!authProvider.useFaceID);
//                               }),
//                           SizedBox(height: 14.h,),
//                           SecurityItem(leadingIconName: securitySettingFaceIdIcon, title: faceIdAuthorizeTransaction, trailingIcon: authProvider.faceIDAuthorizeTransaction? settingsToggleOn : settingsToggleOff,
//                             onTap: (){
//                               authProvider.updateFaceIDAuthorizeTransaction(!authProvider.faceIDAuthorizeTransaction);
//                             },),
//                           SizedBox(height: 19.h,),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//
//             ],
//           );
//         }
//       ),
//     );
//   }
// }
