// To parse this JSON data, do
//
//     final accessToken = accessTokenFromMap(jsonString);

import 'dart:convert';

class AccessToken {
  AccessToken({
    required this.oldPwd,
    required this.newPwd,
  });

  String oldPwd;
  String newPwd;

  factory AccessToken.fromJson(String str) =>
      AccessToken.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccessToken.fromMap(Map<String, dynamic> json) => AccessToken(
        oldPwd: json["oldPwd"],
        newPwd: json["newPwd"],
      );

  Map<String, dynamic> toMap() => {
        "oldPwd": oldPwd,
        "newPwd": newPwd,
      };
}

class User {
  String old;
  String newPassword;
  User(
    this.old,
    this.newPassword,
  );
  Map toJson() => {
        'oldPwd': old,
        'newPwd': newPassword,
      };
}
