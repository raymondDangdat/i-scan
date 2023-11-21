// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import '../../../Widgets/components.dart';
// import '../../../Widgets/constant_widgets.dart';
// import '../../../Widgets/custom_text.dart';
// import '../../../Widgets/textfields.dart';
// import '../../../model/chat_model.dart';
// import '../../../providers/help_and_support_provider.dart';
// import '../../../resources/constants/color_constants.dart';
// import '../../../resources/constants/font_constants.dart';
// import '../../../resources/constants/image_constant.dart';
// import '../../../resources/constants/string_constants.dart';
//
// class ChatWithUsScreen extends StatefulWidget {
//   const ChatWithUsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatWithUsScreen> createState() => _ChatWithUsScreenState();
// }
//
// class _ChatWithUsScreenState extends State<ChatWithUsScreen> {
//   final messageController = TextEditingController();
//
//   final ImagePicker _picker = ImagePicker();
//   late HelpAndSupportProvider _helpAndSupportProvider;
//
//
//   handleChooseFromGallery(BuildContext context) async {
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//     );
//     setState(() {
//       xFile = pickedFile;
//       snapshot = File(pickedFile!.path);
//       final chat = ChatModel(message: "", dateSent: "12:30", file: snapshot, isImage: true);
//       _helpAndSupportProvider.addChat(chat);
//
//
//     });
//   }
//
//
//   File? snapshot;
//   XFile? xFile;
//   @override
//   Widget build(BuildContext context) {
//     _helpAndSupportProvider = context.watch<HelpAndSupportProvider>();
//     return Scaffold(
//         backgroundColor: appBgColor,
//         body: SafeArea(
//             child: Column(
//           children: [
//             const TopPadding(),
//             const AriaAppBar(
//               title: chatWithUs,
//               titleFontSize: 16,
//             ),
//             SizedBox(
//               height: 38.h,
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                 child: SingleChildScrollView(child:
//                     Consumer<HelpAndSupportProvider>(
//                         builder: (ctx, helpAndSupportProvider, child) {
//                   return ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: helpAndSupportProvider.chats.length,
//                       itemBuilder: (context, index) {
//                         final chat = helpAndSupportProvider.chats[index];
//                         return Padding(
//                           padding: EdgeInsets.only(
//                             bottom: 28.h
//                           ),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: chat.isReply ? MainAxisAlignment.start : MainAxisAlignment.end,
//                                 children: [
//                                   Container(
//                                     constraints: BoxConstraints(
//                                       maxWidth: 264.w,
//                                       minWidth: 20.w
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: chat.isReply ? lightBlueTextColor : white,
//                                         borderRadius: BorderRadius.circular(8.r)),
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 14.w, vertical: 12.h),
//                                         child: chat.isImage ? Container(
//                                           width: 225.w,
//                                           height: 105.h,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(9.r),
//                                             image: DecorationImage(image: FileImage(chat.file!), fit: BoxFit.cover)
//                                           ),
//                                         ) : BodyTextPrimaryWithLineHeight(text: chat.message, fontSize: 11, fontWeight: mediumFont,
//                                         textColor: chat.isReply ? white : const Color.fromRGBO(69, 58, 58, 1), ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 7.h,),
//                               Row(
//                                 mainAxisAlignment: chat.isReply ? MainAxisAlignment.start : MainAxisAlignment.end,
//                                 children: [
//                                   BodyTextPrimaryWithLineHeight(text: chat.dateSent, fontSize: 8, fontWeight: boldFont,
//                                         textColor: const Color.fromRGBO(157, 157, 157, 1), ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       });
//                 })),
//               ),
//             )
//           ],
//         )),
//         bottomSheet: BottomSheet(
//             elevation: 0,
//             onClosing: () {},
//             builder: (BuildContext ctx) => Consumer<HelpAndSupportProvider>(
//                     builder: (ctx, helpAndSupportProivider, child) {
//                   return Padding(
//                     padding: EdgeInsets.only(bottom: 16.h),
//                     child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 16.w),
//                         color: appBgColor,
//                         width: double.infinity,
//                         height: 55.h,
//                         child: Builder(builder: (context) {
//                           return Row(
//                             children: [
//                               InkWell(
//                                 onTap: (){
//                                   handleChooseFromGallery(context);
//                                 },
//                                 child: SizedBox(
//                                   height: 24.h,
//                                   width: 24.h,
//                                   child: Image.asset(attachmentIcon),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 15.w,
//                               ),
//                               Expanded(
//                                 child: CustomField2(
//                                   "Type your message",
//                                   messageController,
//                                   showBorder: false,
//                                   type: TextInputType.text,
//                                   onChange: (value) {
//                                     setState(() {
//                                       // debugPrint('value: $value');r
//                                     });
//                                   },
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 15.w,
//                               ),
//                               Consumer<HelpAndSupportProvider>(builder:
//                                   (ctx, helpAndSupportProvider, child) {
//                                 return InkWell(
//                                   onTap: () {
//                                     if (messageController.text.isEmpty) {
//                                       // Do nothing
//                                     } else {
//                                       final newChat = ChatModel(
//                                           message:
//                                               messageController.text.trim(),
//                                           dateSent: "12:30am");
//                                       helpAndSupportProivider.addChat(newChat);
//                                       setState(() {
//                                         messageController.text = "";
//                                       });
//                                     }
//                                   },
//                                   child: SizedBox(
//                                     height: 24.h,
//                                     width: 24.h,
//                                     child: SvgPicture.asset(sendIcon),
//                                   ),
//                                 );
//                               }),
//                             ],
//                           );
//                         })),
//                   );
//                 })));
//   }
// }
