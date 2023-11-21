// To parse this JSON data, do
//
//     final earningTaskCategoryModel = earningTaskCategoryModelFromJson(jsonString);

import 'dart:convert';

EarningTaskCategoryModel earningTaskCategoryModelFromJson(String str) =>
    EarningTaskCategoryModel.fromJson(json.decode(str));

class EarningTaskCategoryModel {
  dynamic status;
  dynamic message;
  List<EarningTaskCategoryData> data;

  EarningTaskCategoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EarningTaskCategoryModel.fromJson(Map<String, dynamic> json) =>
      EarningTaskCategoryModel(
        status: json["status"],
        message: json["message"],
        data: List<EarningTaskCategoryData>.from(
            json["data"].map((x) => EarningTaskCategoryData.fromJson(x))),
      );
}

class EarningTaskCategoryData {
  dynamic id;
  dynamic name;
  dynamic parentId;
  dynamic amountPerTask;
  dynamic amountPerTaskFormatted;
  dynamic description;
  dynamic deletedAt;
  int templateCount;
  dynamic totalTasks;
  EarningTaskCategoryAnalytics analytics;
  List<dynamic> children;

  EarningTaskCategoryData({
    required this.id,
    required this.name,
    required this.parentId,
    required this.amountPerTask,
    required this.amountPerTaskFormatted,
    required this.description,
    required this.deletedAt,
    required this.templateCount,
    required this.totalTasks,
    required this.analytics,
    required this.children,
  });

  factory EarningTaskCategoryData.fromJson(Map<String, dynamic> json) =>
      EarningTaskCategoryData(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        amountPerTask: json["amount_per_task"],
        amountPerTaskFormatted: json["amount_per_task_formatted"],
        description: json["description"],
        deletedAt: json["deleted_at"],
        templateCount: json["template_count"],
        totalTasks: json["total_tasks"],
        analytics: EarningTaskCategoryAnalytics.fromJson(json["analytics"]),
        children: List<dynamic>.from(json["children"].map((x) => x)),
      );
}

class EarningTaskCategoryAnalytics {
  dynamic completed;
  dynamic pending;
  dynamic review;
  dynamic cancelled;
  dynamic total;

  EarningTaskCategoryAnalytics(
      {required this.completed,
      required this.pending,
      required this.review,
      required this.cancelled,
      required this.total});

  factory EarningTaskCategoryAnalytics.fromJson(Map<String, dynamic> json) =>
      EarningTaskCategoryAnalytics(
          completed: json["completed"],
          pending: json["pending"],
          review: json["review"],
          cancelled: json["cancelled"],
          total: json['total']);
}
