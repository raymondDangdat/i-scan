import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widgets/loading_indicator.dart';
import '../model/advert_template_model.dart';
import '../model/products_model.dart';
import '../model/user_hive_model.dart';
import '../providers/bottom_nav_provider.dart';
import '../resources/constants/color_constants.dart';
import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';
import 'go_router_route_names.dart';

String formatDate(String str) {
  DateTime date = DateTime.parse(str);
  return DateFormat().add_yMMMd().add_jm().format(date);
}

String formatCurrency(double num, {String? symbol}) =>
    NumberFormat.currency(symbol: symbol ?? '₦').format(num);

String returnActivityIcon(String activity) {
  if (activity == "Comment") {
    return commentIconSvg;
  } else if (activity == "Like") {
    return likeIconSvg;
  } else if (activity == "Share") {
    return shareIconSvg;
  } else {
    return followIconIconSvg;
  }
}


String returnTodayDate(){
  return "${DateTime.now().day < 10 ? '0${DateTime.now().day}' : DateTime.now().day}-${DateTime.now().month < 10 ? '0${DateTime.now().month}' : DateTime.now().month}-${DateTime.now().year}";
}

double getFileSize(File file) {
  int sizeInBytes = file.lengthSync();
  double sizeInMb = sizeInBytes / (1024 * 1024);
  return sizeInMb;
}

String returnGoalSavingsDuration(String selectedOption) {
  String duration = "";
  // var jiffy = Jiffy.now();
  if (selectedOption.isEmpty) {
    //  do noting
  } else if (selectedOption.endsWith("year") ||
      selectedOption.endsWith("years")) {
    debugPrint("Years");
    var jiffy = Jiffy.now().add(years: int.parse(selectedOption[0]));
    duration = jiffy.dateTime.toString();
    debugPrint("The duration in year is: $duration");
  } else {
    debugPrint("Month");
    var jiffy = Jiffy.now().add(months: int.parse(selectedOption[0]));
    duration = jiffy.dateTime.toString();
    debugPrint("The duration in month is: $duration");
  }
  return duration;
}

double returnPercentAchieved({required double amount, required double total}) {
  double percentAchieved = amount < 1 ? 0 : (amount * 100) / total;
  debugPrint("Percentage achieved:  $percentAchieved");

  return percentAchieved;
}

int returnPercentDiscount(
    {required double sellingPrice, required double discountedPrice}) {
  double discount = sellingPrice - discountedPrice;
  double discountPercent = (discount * 100) / sellingPrice;
  String approximateValue = discountPercent.toStringAsFixed(0);

  return double.parse(approximateValue).toInt();
}

double returnRealAmount({required String amount}) {
  String localAmount = "00";
  if (amount.endsWith("K")) {
    localAmount = amount.replaceAll("K", "000");
  } else if (amount.endsWith("M")) {
    localAmount = amount.replaceAll("M", "000000");
  } else {
    localAmount = amount;
  }
  debugPrint("The local amount is: $localAmount");
  return double.parse(localAmount);
}

// requests storage permission
Future<bool> requestWritePermission() async {
  await Permission.storage.request();
  return await Permission.storage.request().isGranted;
}

// Future<File?> pickDocument({required BuildContext context}) async {
//   try {
//     return await showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) => CupertinoActionSheet(
//         actions: [
//           CupertinoActionSheetAction(
//             onPressed: () async {
//               XFile? result = await ImagePicker().pickImage(source: ImageSource.camera);
//
//               if (result != null) {
//                 if ((await result.length()) > 5000000) {
//                   // showErrorToast('File too large');
//                   return null;
//                 } else {
//                   // Get.back(result: File(result.path));
//                 }
//               } else {
//                 return null;
//               }
//             },
//             child: Text('Select from Camera'),
//           ),
//           CupertinoActionSheetAction(
//             onPressed: () async {
//               XFile? result = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//               if (result != null) {
//                 //File size limit - 5mb
//                 if ((await result.length()) > 5000000) {
//                   // showErrorToast('File too large');
//                   return null;
//                 } else {
//                   // Get.back(result: File(result.path));
//                 }
//               } else {
//                 return null;
//               }
//             },
//             child: Text('Select from Gallery'),
//           ),
//           CupertinoActionSheetAction(
//             onPressed: () async {
//               FilePickerResult? result = await FilePicker.platform.pickFiles(
//                 type: FileType.custom,
//                 allowedExtensions: ['pdf'],
//               );
//
//               if (result != null) {
//                 if (result.files.single.size > 5000000) {
//                   // showErrorToast('File too large');
//                   return null;
//                 } else {
//                   // Get.back(result: File(result.files.single.path));
//                 }
//               } else {
//                 return null;
//               }
//             },
//             child: Text('Select Document'),
//           ),
//         ],
//         cancelButton: CupertinoActionSheetAction(
//           onPressed: (){
//
//           },
//           child: Text('Cancel'),
//         ),
//       ),
//     );
//   } catch (e) {
//     return null;
//   }
// }

String getToken() {
  String token = "";
  if (Hive.box<UserHiveModel>(userBox).isNotEmpty) {
    debugPrint("The token retrieved is:::::$token");
    final hiveUserData = Hive.box<UserHiveModel>(userBox).getAt(0);
    token = hiveUserData?.token ?? "";
    debugPrint("The token retrieved is:::::$token");
  } else {
    debugPrint("Get Token Method has User daata empty ========");
  }
  return token;
}

void copyToClipboard(String info) {
  Clipboard.setData(ClipboardData(text: info));
  Fluttertoast.showToast(msg: "Copied!", backgroundColor: mainColor);
}

Future<void> showIScanLoader(BuildContext context,
    {bool barrierDismissible = false, String message = "Loading..."}) async {
  showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) => IScanLoadingIndicator(
            message: message,
          ));
}

String returnNetworkProviderLogo(String networkProviderName) {
  if (networkProviderName.toLowerCase().contains("mtn")) {
    return mtnLogo;
  } else if (networkProviderName.toLowerCase().contains("airtel")) {
    return airtelLogo;
  } else if (networkProviderName.toLowerCase().contains("9mobile")) {
    return nineMobileLogo;
  } else if (networkProviderName.toLowerCase().contains("glo")) {
    return gloLogo;
  } else {
    return "";
  }
}

String replaceCharAt(String oldString, dynamic index, String newChar) {
  return oldString.substring(0, index) +
      newChar +
      oldString.substring(index + 1);
}

File? snapshot;
XFile? xFile;
final ImagePicker _picker = ImagePicker();

Future<File?> handleChooseFromGallery(BuildContext context) async {
  final XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,
  );
  if (pickedFile != null) {
    final imageSize = (await File(pickedFile.path).readAsBytes()).length;
    double fileSize = imageSize / 1048576;
    debugPrint("Image Size: $fileSize");
    if (fileSize > 5) {
    } else {
      xFile = pickedFile;
      snapshot = File(pickedFile.path);
    }
  }
  return snapshot;
}

logoutUser(BuildContext context) {
  final bottomNavProvider =
      Provider.of<BottomNavProvider>(context, listen: false);
  context.push(context.namedLocation(loginPasscodeName));
  // navToWithScreenName(
  //     context: context,
  //     screen: const LoginPassCodeScreen(),
  //     isPushAndRemoveUntil: true);
  // navTo(
  //     context: context,
  //     path: Routes.loginPasscodeScreen,
  //     isPushAndRemoveUntil: true);
}

Color returnTemplateButtonColor(String socialMediaName) {
  return socialMediaName.toLowerCase().contains(whatsApp.toLowerCase())
      ? const Color.fromRGBO(27, 151, 84, 1)
      : socialMediaName.toLowerCase().contains(instagram.toLowerCase())
          ? const Color.fromRGBO(252, 45, 95, 1)
          : const Color.fromRGBO(45, 91, 252, 1);
}

Color returnTemplateBgColor(String socialMediaName) {
  return socialMediaName.toLowerCase().contains(whatsApp.toLowerCase())
      ? const Color.fromRGBO(234, 255, 243, 1)
      : socialMediaName.toLowerCase().contains(instagram.toLowerCase())
          ? const Color.fromRGBO(255, 234, 239, 1)
          : socialMediaName.toLowerCase().contains(x.toLowerCase())
              ? const Color.fromRGBO(232, 233, 235, 1)
              : const Color.fromRGBO(234, 238, 255, 1);
}

String returnTemplateHeaderImg(String socialMediaName) {
  return socialMediaName.toLowerCase().contains(whatsApp.toLowerCase())
      ? whatsAppAdvertIcon
      : socialMediaName.toLowerCase().contains(x.toLowerCase())
          ? xAdvertIcon
          : socialMediaName.toLowerCase().contains(instagram.toLowerCase())
              ? instagramAdvertIcon
              : fbAdvertIcon;
}

String returnTemplateIcon(String socialMediaName) {
  debugPrint("Social Media Name: $socialMediaName");
  return socialMediaName.toLowerCase().contains(whatsApp.toLowerCase())
      ? whatsappTaskIcon
      : socialMediaName.toLowerCase().contains(x.toLowerCase())
          ? xTaskIcon
          : socialMediaName.toLowerCase().contains(instagram.toLowerCase())
              ? instagramTaskIcon
              : facebookTaskIcon;
}

String returnEngagementTaskTemplateIcon(AdvertTemplateData template) {
  return template.socialMedia
          .toString()
          .toLowerCase()
          .contains(audiomack.toLowerCase())
      ? followAudioMackChannelIcon
      : template.socialMedia
              .toString()
              .toLowerCase()
              .contains(playstore.toLowerCase())
          ? adPlayStoreIcon
          : template.socialMedia
                  .toString()
                  .toLowerCase()
                  .contains(youtube.toLowerCase())
              ? advertSubscribeToYoutubeIcon
              : template.action.toString().toLowerCase().contains("like")
                  ? advertLikeIcon
                  : template.action.toString().toLowerCase().contains("comment")
                      ? advertCommentOnSocialMediaIcon
                      : template.socialMedia
                              .toString()
                              .toLowerCase()
                              .contains(telegram.toLowerCase())
                          ? adTelegramIcon
                          : template.action
                                  .toString()
                                  .toLowerCase()
                                  .contains(retweet.toLowerCase())
                              ? adRetweetIcon
                              : template.action
                                      .toString()
                                      .toLowerCase()
                                      .contains(share.toLowerCase())
                                  ? adShareIcon
                                  : template.socialMedia
                                          .toString()
                                          .toLowerCase()
                                          .contains(whatsApp.toLowerCase())
                                      ? adWhatsAppIcon
                                      : template.action
                                              .toString()
                                              .toLowerCase()
                                              .contains(install.toLowerCase())
                                          ? appsIcon
                                          : advertFollowIcon;
}

List<Color> returnEngagementTaskTemplateHeaderColor(
    AdvertTemplateData template) {
  return template.action.toLowerCase().contains(like.toLowerCase()) ||
          template.action
              .toString()
              .toLowerCase()
              .contains(subscribe.toLowerCase())
      ? [
          const Color.fromRGBO(200, 146, 42, 1),
          const Color.fromRGBO(254, 248, 234, 1)
        ]
      : template.action.toString().toLowerCase().contains(share.toLowerCase()) ||
              template.action
                  .toString()
                  .toLowerCase()
                  .contains(comment.toLowerCase()) ||
              template.action.toString().toLowerCase().contains(follow.toLowerCase()) &&
                  !template.socialMedia
                      .toString()
                      .toLowerCase()
                      .contains(audiomack.toLowerCase())
          ? [
              const Color.fromRGBO(45, 91, 252, 1),
              const Color.fromRGBO(234, 238, 255, 1)
            ]
          : template.action
                  .toString()
                  .toLowerCase()
                  .contains(install.toLowerCase())
              ? [
                  const Color.fromRGBO(34, 39, 55, 1),
                  const Color.fromRGBO(255, 255, 255, 0.9)
                ]
              : template.action
                          .toString()
                          .toLowerCase()
                          .contains(join.toLowerCase()) ||
                      template.action
                          .toString()
                          .toLowerCase()
                          .contains(retweet.toLowerCase())
                  ? [
                      const Color.fromRGBO(27, 151, 84, 1),
                      const Color.fromRGBO(234, 255, 243, 1)
                    ]
                  : template.socialMedia
                                  .toString()
                                  .toLowerCase()
                                  .contains(youtube.toLowerCase()) &&
                              template.action
                                  .toString()
                                  .toLowerCase()
                                  .contains(view.toLowerCase()) ||
                          template.socialMedia
                                  .toString()
                                  .toLowerCase()
                                  .contains(audiomack.toLowerCase()) &&
                              template.action
                                  .toString()
                                  .toLowerCase()
                                  .contains(follow.toLowerCase())
                      ? [
                          const Color.fromRGBO(252, 45, 95, 1),
                          const Color.fromRGBO(255, 234, 239, 1)
                        ]
                      : [
                          const Color.fromRGBO(45, 91, 252, 1),
                          const Color.fromRGBO(234, 238, 255, 1)
                        ];
}

List<String> returnTemplateSocialMediaIcons(AdvertTemplateData template) {
  return template.action
          .toString()
          .toLowerCase()
          .contains(install.toLowerCase())
      ? [appStoreIconSmall, playStoreIconSmall]
      : template.socialMedia
              .toString()
              .toLowerCase()
              .contains(audiomack.toString().toLowerCase())
          ? [audiomackSmallIcon]
          : template.action
                  .toString()
                  .toLowerCase()
                  .contains(join.toLowerCase())
              ? [whatsAppIconSmall, telegramIconSmall]
              : template.socialMedia
                      .toString()
                      .toLowerCase()
                      .contains(youtube.toLowerCase())
                  ? [youtubeSmallIcon]
                  : template.action
                          .toString()
                          .toLowerCase()
                          .contains(comment.toLowerCase())
                      ? [fbIconSmallIcon, xSmallIcon, instagramSmallIcon]
                      : template.action
                              .toString()
                              .toLowerCase()
                              .contains(follow.toLowerCase())
                          ? [
                              instagramSmallIcon,
                              fbIconSmallIcon,
                              xSmallIcon,
                              tiktokSmallIcon
                            ]
                          : template.action
                                  .toString()
                                  .toLowerCase()
                                  .contains(like.toLowerCase())
                              ? [
                                  instagramSmallIcon,
                                  fbIconSmallIcon,
                                  xSmallIcon,
                                  tiktokSmallIcon
                                ]
                              : template.action
                                      .toString()
                                      .toLowerCase()
                                      .contains(retweet.toLowerCase())
                                  ? [
                                      xSmallIcon,
                                    ]
                                  : [fbIconSmallIcon];
}

List<String> returnTemplateSocialMedia(AdvertTemplateData template) {
  return template.action
          .toString()
          .toLowerCase()
          .contains(install.toLowerCase())
      ? [appStore, playstore]
      : template.socialMedia
              .toString()
              .toLowerCase()
              .contains(audiomack.toString().toLowerCase())
          ? [audiomack]
          : template.action
                  .toString()
                  .toLowerCase()
                  .contains(join.toLowerCase())
              ? [whatsApp, telegram]
              : template.socialMedia
                      .toString()
                      .toLowerCase()
                      .contains(youtube.toLowerCase())
                  ? [youtube]
                  : template.action
                          .toString()
                          .toLowerCase()
                          .contains(comment.toLowerCase())
                      ? [facebook, x, instagram]
                      : template.action
                              .toString()
                              .toLowerCase()
                              .contains(like.toLowerCase())
                          ? [instagram, facebook, x, tiktok]
                          : template.action
                                  .toString()
                                  .toLowerCase()
                                  .contains(follow.toLowerCase())
                              ? [instagram, facebook, x, tiktok]
                              : [facebook];
}

String returnEngagementTaskTemplateBtnText(AdvertTemplateData template) {
  return template.socialMedia
          .toString()
          .toLowerCase()
          .contains(audiomack.toLowerCase())
      ? "per follower"
      : template.action.toString().toLowerCase().contains(install.toLowerCase())
          ? "per download\n& review"
          : template.socialMedia
                      .toString()
                      .toLowerCase()
                      .contains(youtube.toLowerCase()) &&
                  template.action
                      .toString()
                      .toLowerCase()
                      .contains(subscribe.toLowerCase())
              ? "per subscriber"
              : template.action.toString().toLowerCase().contains("like")
                  ? "per like"
                  : template.socialMedia
                              .toString()
                              .toLowerCase()
                              .contains(youtube.toLowerCase()) &&
                          template.action
                              .toString()
                              .toLowerCase()
                              .contains(view.toLowerCase())
                      ? "per view, like &\ncomment"
                      : template.action
                              .toString()
                              .toLowerCase()
                              .contains("comment")
                          ? "per comment"
                          : template.socialMedia
                                  .toString()
                                  .toLowerCase()
                                  .contains(telegram.toLowerCase())
                              ? "per Telegram\ngroup member"
                              : template.action
                                      .toString()
                                      .toLowerCase()
                                      .contains(retweet.toLowerCase())
                                  ? "per retweet"
                                  : template.action
                                          .toString()
                                          .toLowerCase()
                                          .contains(share.toLowerCase())
                                      ? "per share"
                                      : template.socialMedia
                                              .toString()
                                              .toLowerCase()
                                              .contains(whatsApp.toLowerCase())
                                          ? "per whatsapp\ngroup member"
                                          : "per follow";
}

String returnNumberOfPostLabel(AdvertTemplateData template) {
  return template.socialMedia
          .toString()
          .toLowerCase()
          .contains(audiomack.toLowerCase())
      ? "Number of Audiomack followers that you want"
      : template.action.toString().toLowerCase().contains(install.toLowerCase())
          ? "Number of app reviews that you want"
          : template.socialMedia
                      .toString()
                      .toLowerCase()
                      .contains(youtube.toLowerCase()) &&
                  template.action
                      .toString()
                      .toLowerCase()
                      .contains(subscribe.toLowerCase())
              ? "Number of YouTube subscribers that you want"
              : template.action.toString().toLowerCase().contains("like")
                  ? "Number of likes"
                  : template.action
                          .toString()
                          .toLowerCase()
                          .contains(follow.toLowerCase())
                      ? "Number of followers that you want"
                      : template.socialMedia
                                  .toString()
                                  .toLowerCase()
                                  .contains(youtube.toLowerCase()) &&
                              template.action
                                  .toString()
                                  .toLowerCase()
                                  .contains(view.toLowerCase())
                          ? "Number of YouTube views, likes and comments that you want"
                          : template.action
                                  .toString()
                                  .toLowerCase()
                                  .contains("comment")
                              ? "Number of comments"
                              : template.socialMedia
                                      .toString()
                                      .toLowerCase()
                                      .contains(telegram.toLowerCase())
                                  ? "Number of telegram group members that you want"
                                  : template.action
                                          .toString()
                                          .toLowerCase()
                                          .contains(retweet.toLowerCase())
                                      ? "Number of retweets that you want"
                                      : template.action
                                              .toString()
                                              .toLowerCase()
                                              .contains(share.toLowerCase())
                                          ? "Number of shares that you want"
                                          : template.socialMedia
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(
                                                      whatsApp.toLowerCase())
                                              ? "Number of telegram group members that you want"
                                              : template.socialMedia
                                                      .toString()
                                                      .toLowerCase()
                                                      .contains(
                                                          appStore.toLowerCase())
                                                  ? "Number of app reviews you want"
                                                  : "Number of likes that you want";
}

String returnPostLinkLabel(AdvertTemplateData template) {
  return template.socialMedia
          .toString()
          .toLowerCase()
          .contains(audiomack.toLowerCase())
      ? "Enter your link"
      : template.socialMedia
              .toString()
              .toLowerCase()
              .contains(playstore.toLowerCase())
          ? "Enter your play store link"
          : template.socialMedia
                      .toString()
                      .toLowerCase()
                      .contains(youtube.toLowerCase()) &&
                  template.action
                      .toString()
                      .toLowerCase()
                      .contains(subscribe.toLowerCase())
              ? "Your YouTube video Link/URL"
              : template.action.toString().toLowerCase().contains("like")
                  ? "Enter your link"
                  : template.socialMedia
                              .toString()
                              .toLowerCase()
                              .contains(youtube.toLowerCase()) &&
                          template.action
                              .toString()
                              .toLowerCase()
                              .contains(view.toLowerCase())
                      ? "Your YouTube video Link/URL"
                      : template.action
                              .toString()
                              .toLowerCase()
                              .contains("comment")
                          ? "Enter your link"
                          : template.socialMedia
                                  .toString()
                                  .toLowerCase()
                                  .contains(telegram.toLowerCase())
                              ? "Enter telegram group/channel link"
                              : template.action
                                      .toString()
                                      .toLowerCase()
                                      .contains(retweet.toLowerCase())
                                  ? "Enter your twitter post link"
                                  : template.action
                                          .toString()
                                          .toLowerCase()
                                          .contains(share.toLowerCase())
                                      ? "Enter your Facebook post link"
                                      : template.socialMedia
                                              .toString()
                                              .toLowerCase()
                                              .contains(whatsApp.toLowerCase())
                                          ? "Enter your Whatsapp group invite link"
                                          : template.socialMedia
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(
                                                      appStore.toLowerCase())
                                              ? "Enter your link"
                                              : "Enter your link";
}

String returnPostCommentTypeLabel(AdvertTemplateData template) {
  return template.socialMedia
          .toString()
          .toLowerCase()
          .contains(audiomack.toLowerCase())
      ? ""
      : template.action.toString().toLowerCase().contains(install.toLowerCase())
          ? "What kind of app reviews do you want?"
          : template.socialMedia
                      .toString()
                      .toLowerCase()
                      .contains(youtube.toLowerCase()) &&
                  template.action
                      .toString()
                      .toLowerCase()
                      .contains(subscribe.toLowerCase())
              ? "What type of comments do you want?"
              : template.action.toString().toLowerCase().contains("like")
                  ? ""
                  : template.action
                          .toString()
                          .toLowerCase()
                          .contains(follow.toLowerCase())
                      ? ""
                      : template.socialMedia
                                  .toString()
                                  .toLowerCase()
                                  .contains(youtube.toLowerCase()) &&
                              template.action
                                  .toString()
                                  .toLowerCase()
                                  .contains(view.toLowerCase())
                          ? "What type of comments do you want?"
                          : template.action
                                  .toString()
                                  .toLowerCase()
                                  .contains("comment")
                              ? "What type of comments do you want?"
                              : template.socialMedia
                                      .toString()
                                      .toLowerCase()
                                      .contains(telegram.toLowerCase())
                                  ? ""
                                  : template.action
                                          .toString()
                                          .toLowerCase()
                                          .contains(retweet.toLowerCase())
                                      ? ""
                                      : template.action
                                              .toString()
                                              .toLowerCase()
                                              .contains(share.toLowerCase())
                                          ? ""
                                          : template.socialMedia
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(
                                                      whatsApp.toLowerCase())
                                              ? ""
                                              : template.socialMedia
                                                      .toString()
                                                      .toLowerCase()
                                                      .contains(
                                                          appStore.toLowerCase())
                                                  ? "What kind of app reviews do you want?"
                                                  : "What type of comments do you want?";
}

String returnTaskCategoryImage(String socialMediaName) {
  debugPrint("Social Media Name: $socialMediaName");
  return socialMediaName.toLowerCase().contains(whatsApp.toLowerCase())
      ? whatsAppEarningBg
      : socialMediaName.toLowerCase().contains(x.toLowerCase())
          ? xTwitterEarningBg
          : socialMediaName.toLowerCase().contains(instagram.toLowerCase())
              ? instagramEarningBg
              : fbEarningBg;
}

Color returnTaskCategoryHeaderColor(String socialMediaName) {
  debugPrint("Social Media Name: $socialMediaName");
  return socialMediaName.toLowerCase().contains(whatsApp.toLowerCase())
      ? const Color.fromRGBO(27, 151, 84, 1)
      : socialMediaName.toLowerCase().contains(x.toLowerCase())
          ? black
          : socialMediaName.toLowerCase().contains(instagram.toLowerCase())
              ? const Color(0x002D5AFC)
              : const Color.fromRGBO(45, 91, 252, 1);
}

Future<bool> checkIfUrlIsValid({required String url}) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    return true;
  }
  return false;
}

Future<void> launchUrl(String url) async {
  final canLaunch = await canLaunchUrl(Uri.parse(url));
  if (kIsWeb) {
    if (canLaunch) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
    return;
  }
  if (Platform.isAndroid) {
    if (url.startsWith("https://www.facebook.com/")) {
      final url2 = "fb://facewebmodal/f?href=$url";
      final intent2 = AndroidIntent(action: "action_view", data: url2);
      final canWork = await intent2.canResolveActivity();
      if (canWork ?? false) return intent2.launch();
    }
    final intent = AndroidIntent(action: "action_view", data: url);
    return intent.launch();
  } else {
    if (canLaunch) {
      await launch(url, forceSafariVC: false);
    } else {
      throw "Could not launch $url";
    }
  }
}

Future<void> launchSocialMediaAppIfInstalled({
  required String url,
}) async {
  try {
    bool launched =
        await launch(url, forceSafariVC: false); // Launch the app if installed!

    if (!launched) {
      launch(url); // Launch web view if app is not installed!
    }
  } catch (e) {
    launch(url); // Launch web view if app is not installed!
  }
}

//This function pops out screen according to the type of routing used
void popLoader({required BuildContext context, bool isGoRouterScreen = true}) {
  if (isGoRouterScreen) {
    context.pop();
  } else {
    Navigator.pop(context);
  }
}

//THIS METHOD GETS THE VARIATION VALUE AND ASSIGN ON THE CART
String returnVariationSize(
    {required String variationId, required Product product}) {
  String value = "";
  for (int i = 0; i < product.variation.size.length; i++) {
    if (product.variation.size[i].id.toString().toLowerCase() ==
        variationId.toLowerCase()) {
      value = product.variation.size[i].value;
    }
  }
  return value;
}

//THIS METHOD GETS THE VARIATION VALUE AND ASSIGN ON THE CART
String returnVariationColour(
    {required String variationId, required Product product}) {
  String value = "";
  for (int i = 0; i < product.variation.colour.length; i++) {
    if (product.variation.colour[i].id.toString().toLowerCase() ==
        variationId.toLowerCase()) {
      value = product.variation.colour[i].value;
    }
  }
  return value;
}

String returnBeneficiaryMessage({required String category}) {
  if (category == interAccountTransferCategory ||
      category == bankTransferCategory) {
    return sendMoney;
  } else if (category == electricityCategory) {
    return "Buy";
  } else if (category == telcoCategory) {
    return "Buy";
  } else {
    return category;
  }
}
