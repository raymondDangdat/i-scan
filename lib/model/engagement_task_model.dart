import 'package:flutter/material.dart';

import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';

class EngagementTask {
  final String img;
  final String title;
  final String amountPerPost;
  final Color bgColor;
  final Color btnColor;
  List<String> socialMediaIcons;
  List<String> platforms;
  String subText;
  String perPostSubtitle;
  String taskLabel;
  String linkText;
  String commentFieldLabel;

  EngagementTask({
    required this.title,
    required this.bgColor,
    required this.amountPerPost,
    required this.img,
    required this.btnColor,
    required this.socialMediaIcons,
    required this.platforms,
    this.subText = "",
    this.perPostSubtitle = "",
    this.taskLabel = '',
    this.linkText = "Enter your link",
    this.commentFieldLabel = "",
  });
}

List<EngagementTask> engagementTaskList = [
  EngagementTask(
      title: "Get more Instagram followers.",
      bgColor: const Color.fromRGBO(234, 238, 255, 1),
      amountPerPost: "${nairaSign}5",
      img: advertFollowIcon,
      btnColor: const Color.fromRGBO(45, 91, 252, 1),
      socialMediaIcons: [instagramSmallIcon],
      platforms: [instagram],
      perPostSubtitle: "per follow",
      taskLabel: "Number of followers that you want",
      subText:
          "Please set your current location below. Your buyers may want to meet you at your physical address so they can buy from you."),
  EngagementTask(
      title: "Get more likes on your social media post.",
      btnColor: const Color.fromRGBO(200, 146, 42, 1),
      amountPerPost: "${nairaSign}5",
      img: advertLikeIcon,
      bgColor: const Color.fromRGBO(254, 248, 234, 1),
      socialMediaIcons: [xSmallIcon, instagramSmallIcon],
      platforms: [x, instagram],
      perPostSubtitle: "per like",
      taskLabel: "Number of likes",
      subText:
          "Please set your current location below. Your buyers may want to meet you at your physical address so they can buy from you."),
  EngagementTask(
      title: "Get Facebook followers on your business page",
      bgColor: const Color.fromRGBO(255, 234, 239, 1),
      amountPerPost: "${nairaSign}5",
      img: likeFacebookPageIcon,
      btnColor: const Color.fromRGBO(252, 45, 95, 1),
      socialMediaIcons: [fbIconSmallIcon],
      platforms: [facebook],
      taskLabel: "Number of likes",
      perPostSubtitle: "per share",
      subText:
          "Please set your current location below. Your buyers may want to meet you at your physical address so they can buy from you."),
  EngagementTask(
      title: "Get people to follow on your Audiomack channel",
      bgColor: const Color.fromRGBO(234, 255, 243, 1),
      amountPerPost: "${nairaSign}20",
      img: followAudioMackChannelIcon,
      btnColor: const Color.fromRGBO(27, 151, 84, 1),
      socialMediaIcons: [audiomackSmallIcon],
      platforms: [audiomack],
      taskLabel: "Number of likes",
      perPostSubtitle: "Number of Audiomack followers",
      subText:
          "Please set your current location below. Your buyers may want to meet you at your physical address so they can buy from you."),
  EngagementTask(
      title: "Get comments on your social media posts",
      bgColor: const Color.fromRGBO(234, 238, 255, 1),
      amountPerPost: "${nairaSign}30",
      img: advertCommentOnSocialMediaIcon,
      btnColor: const Color.fromRGBO(45, 91, 252, 1),
      socialMediaIcons: [fbIconSmallIcon, xSmallIcon, instagramSmallIcon],
      platforms: [facebook, x, instagram],
      perPostSubtitle: "per comment",
      taskLabel: "Number of comments",
      commentFieldLabel: "What kind of app reviews do you want?",
      subText:
          "Please set your current location below. Your buyers may want to meet you at your physical address so they can buy from you."),
  EngagementTask(
      title: "Get subscribers on your Youtube Channel",
      btnColor: const Color.fromRGBO(200, 146, 42, 1),
      amountPerPost: "${nairaSign}5",
      img: advertSubscribeToYoutubeIcon,
      bgColor: const Color.fromRGBO(254, 248, 234, 1),
      socialMediaIcons: [youtubeSmallIcon],
      platforms: [youtube],
      perPostSubtitle: "per like",
      taskLabel: "Number of YouTube subscribers",
      subText:
          "Get unlimited real people to Subscribe on your Youtube Channel. People will subscribe to your channel thereby increasing your subscribers, views, comments and likes. Simply enter your Youtube Channel Link to get started."),
  EngagementTask(
      title:
          "Get people to view and comment on your Youtube channel and video.",
      bgColor: const Color.fromRGBO(255, 234, 239, 1),
      amountPerPost: "${nairaSign}5",
      img: advertSubscribeToYoutubeIcon,
      btnColor: const Color.fromRGBO(252, 45, 95, 1),
      socialMediaIcons: [youtubeSmallIcon],
      platforms: [youtube],
      linkText: "Your YouTube video Link/URL",
      taskLabel: "Number of YouTube views, likes and comments",
      perPostSubtitle: "per view, like & comment",
      commentFieldLabel: "What kind of app reviews do you want?",
      subText:
          "Get unlimited real people to View and Comment on your Youtube Channel and Video. People will watch your video, comment on the video and like the video at the same time thereby increasing your views, comments and likes. To get started, enter the Youtube Video Link."),
  EngagementTask(
      title: "Get users to install and review your App on Google play",
      btnColor: const Color.fromRGBO(200, 146, 42, 1),
      amountPerPost: "${nairaSign}50",
      img: adPlayStoreIcon,
      bgColor: const Color.fromRGBO(254, 248, 234, 1),
      socialMediaIcons: [playStoreIconSmall],
      platforms: [playstore],
      subText:
          "Get unlimited real people to download and review your apps on Google Play Store. To get started, enter your App download link.",
      perPostSubtitle: "per download & review",
      taskLabel: "Number of app reviews you want",
      linkText: "Enter your play store link",
      commentFieldLabel: "What kind of app reviews do you want?"),
  EngagementTask(
      title: "Get People to Share Your Facebook Post",
      bgColor: const Color.fromRGBO(234, 238, 255, 1),
      amountPerPost: "${nairaSign}100",
      img: adShareIcon,
      btnColor: const Color.fromRGBO(45, 91, 252, 1),
      socialMediaIcons: [fbIconSmallIcon],
      platforms: [facebook],
      perPostSubtitle: "per share",
      taskLabel: "Number of shares you want",
      linkText: "Enter your Facebook post link",
      subText:
          "Get unlimited real people to download and review your apps on Google Play Store. To get started, enter your App download link."),
  EngagementTask(
      title: "Get people to retweet your X posts.",
      bgColor: const Color.fromRGBO(234, 255, 243, 1),
      amountPerPost: "${nairaSign}100",
      img: adRetweetIcon,
      btnColor: const Color.fromRGBO(27, 151, 84, 1),
      socialMediaIcons: [xSmallIcon],
      platforms: [x],
      perPostSubtitle: "per retweet",
      taskLabel: "Number of retweets you want-",
      linkText: "Enter your twitter post link",
      subText:
          "Get unlimited number of real people to Retweet your X (twitter) posts to their own followers. To get started, enter your X (Twitter) post link"),
  EngagementTask(
      title: "Get people to join your WhatsApp group",
      bgColor: const Color.fromRGBO(234, 255, 243, 1),
      amountPerPost: "${nairaSign}100",
      img: adWhatsAppIcon,
      btnColor: const Color.fromRGBO(27, 151, 84, 1),
      socialMediaIcons: [whatsAppIconSmall],
      platforms: [whatsApp],
      taskLabel: "Number of WhatsApp group members you want",
      perPostSubtitle: "per whatsapp group member",
      linkText: "Enter your Whatsapp group invite link",
      subText:
          "Get unlimited number of real people to Join Your Whatsapp Group. Your Whatsapp Login Details are not needed. Simply enter the group link to get started."),
  EngagementTask(
      title: "Get users to join your Telegram group or channel",
      btnColor: const Color.fromRGBO(200, 146, 42, 1),
      amountPerPost: "${nairaSign}100",
      img: adTelegramIcon,
      bgColor: const Color.fromRGBO(254, 248, 234, 1),
      socialMediaIcons: [telegramIconSmall],
      platforms: [telegram],
      taskLabel: "Number of Telegram group members you want",
      perPostSubtitle: "per Telegram group/channel name",
      linkText: "Enter telegram group/channel link",
      subText:
          "Get unlimited number of real people to Join your Telegram Group. We do not require your telegram login details."),
  EngagementTask(
      title: "Get users to install and review your app on Apple iOS store",
      bgColor: const Color.fromRGBO(250, 234, 254, 1),
      amountPerPost: "${nairaSign}100",
      img: adAppStoreIcon,
      btnColor: const Color.fromRGBO(161, 5, 187, 1),
      socialMediaIcons: [appStoreIconSmall],
      platforms: [
        appStore,
      ],
      perPostSubtitle: "per Download and Review",
      linkText: "Enter apple store link",
      commentFieldLabel: "What kind of app reviews do you want?",
      subText:
          "Get unlimited number of real people to download and review your apps on Apple Store. To get started, enter the App Download Link."),
];
