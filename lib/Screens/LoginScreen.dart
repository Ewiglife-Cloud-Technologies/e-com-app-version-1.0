import 'package:e_com_app_v_1_0/Screens/HomeScreen.dart';
import 'package:e_com_app_v_1_0/Screens/SignupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_shopify/flutter_simple_shopify.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwrodController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  ShopifyAuth auth = ShopifyAuth.instance;
  ShopifyCustomer customer = ShopifyCustomer.instance;
  ShopifyUser _shopifyUser = ShopifyUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
            ),
            TextFormField(
              controller: passwrodController,
            ),
            ElevatedButton(
                onPressed: () async {
                  await auth.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwrodController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
