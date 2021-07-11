// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.customer,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  String customer;
  String firstName;
  String lastName;
  String email;
  String password;
  String passwordConfirmation;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        customer: json[""],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "customer": {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
        }
      };
}

class Customer {
  Customer({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  String firstName;
  String lastName;
  String email;
  String password;
  String passwordConfirmation;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
