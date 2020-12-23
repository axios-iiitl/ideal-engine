// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    this.token,
  });

  String token;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
