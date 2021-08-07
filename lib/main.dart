import 'package:e_com_app_v_1_0/Screens/LoginScreen.dart';
import 'package:e_com_app_v_1_0/Screens/SignupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_shopify/flutter_simple_shopify.dart';

void main() {
  ShopifyConfig.setConfig("2d87beb704d0a57383d77427cc9017ed",
      "humera-stagging.myshopify.com", "2020-04");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}
