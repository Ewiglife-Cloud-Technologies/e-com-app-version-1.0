import 'package:e_com_app_v_1_0/Models/UserModel.dart';
import 'package:e_com_app_v_1_0/Services/ApiService.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPassController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  UserModel model;
  ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextFormField(
              controller: fnameController,
            ),
            MyTextFormField(
              controller: lnamecontroller,
            ),
            MyTextFormField(
              controller: emailController,
            ),
            MyTextFormField(
              controller: passwordController,
            ),
            MyTextFormField(
              controller: confPassController,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    model.firstName = fnameController.text;
                    model.lastName = lnamecontroller.text;
                    model.email = emailController.text;
                    model.password = passwordController.text;
                    apiService.createUser(model);
                  });
                },
                child: Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  TextEditingController controller;
  MyTextFormField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
