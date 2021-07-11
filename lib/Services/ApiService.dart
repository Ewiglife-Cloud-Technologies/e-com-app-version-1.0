// import 'package:e_com_app_v_1_0/Models/UserModel.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_com_app_v_1_0/Models/UserModel.dart';

class ApiService {
  Future<bool> createUser(UserModel model) async {
    var uri =
        'https://faf10d485cc52aaf28f257a4d5261dbb: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@ewiglife-demostore.myshopify.com/admin/api/2021-07/customers.json';
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
