// import 'package:e_com_app_v_1_0/Models/UserModel.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_com_app_v_1_0/Models/UserModel.dart';

class ApiService {
  Future<bool> createUser(UserModel model) async {
    var uri =
        'https://4ebf96eaaf71f909a5d6996023b84a18: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@ewiglifeapptest.myshopify.com/admin/api/2021-07/customers.json';
    bool ret = false;

    try {
      var response = await Dio().post(
        uri,
        data: model.toJson(),
      );

      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }
}
