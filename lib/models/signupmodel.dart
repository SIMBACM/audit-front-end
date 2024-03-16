// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  String username;
  String email;
  String password;
  String confirmPassword;

  Posts({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    username: json["username"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["confirm_password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "password": password,
    "confirm_password": confirmPassword,
  };
}
