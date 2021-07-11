import 'dart:convert';

import 'package:e_com_app_v_1_0/Models/UserModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserModel> createUser(String fname, String lname, String email,
      String password, String confPassword) async {
    final String apiUrl =
        'https://faf10d485cc52aaf28f257a4d5261dbb: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@ewiglife-demostore.myshopify.com/admin/api/2021-07/customers.json';
    final response = await http.post(Uri.parse(apiUrl), headers: {
      "Accepts": "application/json"
    }, body: {
      "customer": {
        "first_name": fname,
        "last_name": lname,
        "email": email,
        "password": password,
        "password_confirmation": confPassword
      }
    });
    print(fname);
    if (response.statusCode == 201) {
      final String responseString = response.body;

      return userModelFromJson(responseString);
    } else {
      throw ("");
    }
  }
}
