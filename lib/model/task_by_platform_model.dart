// To parse this JSON data, do
//
//     final taskByPlatformModel = taskByPlatformModelFromJson(jsonString);

import 'dart:convert';

TaskByPlatformModel taskByPlatformModelFromJson(String str) =>
    TaskByPlatformModel.fromJson(json.decode(str));

class TaskByPlatformModel {
  dynamic status;
  dynamic message;
  List<TaskByPlatformData> data;

  TaskByPlatformModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TaskByPlatformModel.fromJson(Map<String, dynamic> json) =>
      TaskByPlatformModel(
        status: json["status"],
        message: json["message"],
        data: List<TaskByPlatformData>.from(
            json["data"].map((x) => TaskByPlatformData.fromJson(x))),
      );
}

class TaskByPlatformData {
  dynamic id;
  dynamic title;
  dynamic description;
  dynamic socialMedia;
  dynamic link;
  dynamic amount;
  dynamic action;
  dynamic numberOfLikes;
  String location;
  dynamic endDate;
  bool isAccepted;
  DateTime? expiryTime;
  dynamic coverImage;

  TaskByPlatformData({
    required this.id,
    required this.title,
    required this.description,
    required this.socialMedia,
    required this.link,
    required this.amount,
    required this.action,
    required this.numberOfLikes,
    required this.location,
    required this.endDate,
    required this.coverImage,
    this.isAccepted = false,
    this.expiryTime,
  });

  factory TaskByPlatformData.fromJson(Map<String, dynamic> json) =>
      TaskByPlatformData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        socialMedia: json["social_media"],
        link: json["link"],
        amount: json["amount"],
        action: json["action"],
        numberOfLikes: json["number_of_likes"],
        location: json["location"],
        endDate: json["end_date"],
        coverImage: json["cover_image"],
      );
}
