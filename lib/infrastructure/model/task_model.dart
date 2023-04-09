// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) =>
    json.encode(data.toJson(data.taskId.toString()));

class TaskModel {
  TaskModel({
    this.taskId,
    this.taskName,
    this.taskImage,
    this.dateTime,
    this.isCompleted,
  });

  String? taskId;
  String? taskName;
  String? taskImage;
  Timestamp? dateTime;
  bool? isCompleted;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        taskId: json["taskId"],
        taskName: json["taskName"],
        taskImage: json["taskImage"],
        dateTime: json["dateTime"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson(String taskID) => {
        "taskId": taskID,
        "taskName": taskName,
        "taskImage": taskImage,
        "dateTime": dateTime,
        "isCompleted": isCompleted,
      };
}
