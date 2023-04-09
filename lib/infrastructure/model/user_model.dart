// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) =>
    json.encode(data.toJson(data.uid.toString()));

class UserModel {
  UserModel({
    this.uid,
    this.fullName,
    this.emailAddress,
  });

  String? uid;
  String? fullName;
  String? emailAddress;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        fullName: json["fullName"],
        emailAddress: json["emailAddress"],
      );

  Map<String, dynamic> toJson(String uID) => {
        "uid": uID,
        "fullName": fullName,
        "emailAddress": emailAddress,
      };
}
