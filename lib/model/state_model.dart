// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) =>
    StateModel.fromJson(json.decode(str));

class StateModel {
  bool status;
  String message;
  List<StateData> data;

  StateModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        status: json["status"],
        message: json["message"],
        data: List<StateData>.from(
            json["data"].map((x) => StateData.fromJson(x))),
      );
}

class StateData {
  dynamic id;
  dynamic name;

  StateData({
    required this.id,
    required this.name,
  });

  factory StateData.fromJson(Map<String, dynamic> json) => StateData(
        id: json["id"],
        name: json["name"],
      );
}

final dummyState = StateData(id: "-1", name: "All States");
