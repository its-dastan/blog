// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.isLoggedIn,
    this.user,
  });

  bool? isLoggedIn;
  User? user;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        isLoggedIn: json["isLoggedIn"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "isLoggedIn": isLoggedIn,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.email,
    this.v,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobile: json["mobile"],
        email: json["email"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "mobile": mobile,
        "email": email,
        "__v": v,
      };
}
