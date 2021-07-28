import 'dart:convert';

LoginResponseModel loginFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.customerEmail,
    this.customerPassword,
  });

  String customerEmail;
  String customerPassword;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        customerEmail: json["customer[email]"],
        customerPassword: json["customer[password]"],
      );

  Map<String, dynamic> toJson() => {
        "customer[email]": customerEmail,
        "customer[password]": customerPassword,
      };
}
