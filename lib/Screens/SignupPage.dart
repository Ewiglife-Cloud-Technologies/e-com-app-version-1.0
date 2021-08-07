import 'package:flutter/material.dart';
import 'package:flutter_simple_shopify/flutter_simple_shopify.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController passwrodController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  ShopifyAuth auth = ShopifyAuth.instance;
  ShopifyUser user;

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
                  await auth.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwrodController.text);
                  print(emailController.text + passwrodController.text);
                },
                child: Text('Sign up'))
          ],
        ),
      ),
    );
  }
}
