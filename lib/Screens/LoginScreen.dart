import 'dart:ffi';

import 'package:e_com_app_v_1_0/Screens/HomeScreen.dart';
import 'package:e_com_app_v_1_0/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_shopify/flutter_simple_shopify.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  ShopifyAuth auth = ShopifyAuth.instance;
  ShopifyCustomer customer = ShopifyCustomer.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.network(
                  "https://www.pngkit.com/png/full/981-9818240_your-logo-retulp-bus-stop.png",
                  width: 200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormFieldCustom(controller: emailController),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormFieldCustom(controller: passwordController),
                  ElevatedButton(
                    onPressed: () async {
                      await auth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
