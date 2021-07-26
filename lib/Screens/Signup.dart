import 'package:e_com_app_v_1_0/Models/UserModel.dart';
import 'package:e_com_app_v_1_0/Services/ApiService.dart';
import 'package:e_com_app_v_1_0/Utils/FormHelper.dart';
import 'package:e_com_app_v_1_0/Utils/progressHud.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  ApiService apiService;
  UserModel model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  void initState() {
    apiService = ApiService();
    model = UserModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: true,
        title: Text('Sign Up'),
      ),
      body: ProgressHUD(
        child: Form(
          key: globalKey,
          child: _formUI(),
        ),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    );
  }

  Widget _formUI() {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHelper.fieldLabel('First Name'),
              FormHelper.textInput(
                  context,
                  model.firstName,
                  (value) => {
                        this.model.firstName = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return 'Please Enter First Name.';
                }
                return null;
              }),
              FormHelper.fieldLabel('Last Name'),
              FormHelper.textInput(
                  context,
                  model.lastName,
                  (value) => {
                        this.model.lastName = value,
                      }, onValidate: (value) {
                return null;
              }, text: 'Last Name'),
              FormHelper.fieldLabel('Email'),
              FormHelper.textInput(
                  context,
                  model.email,
                  (value) => {
                        this.model.email = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return 'Please Enter Valid Email.';
                }
                if (value.isNotEmpty && !value.toString().isNotEmpty) {
                  return 'please Enter Valid Email Id.';
                }
                return null;
              }),
              FormHelper.fieldLabel('Password'),
              FormHelper.textInput(
                context,
                model.password,
                (value) => {
                  this.model.password = value,
                },
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please Enter Password.';
                  }
                  return null;
                },
                obscureText: hidePassword,
                suffixIcon: IconButton(
                    color: Theme.of(context).accentColor.withOpacity(0.4),
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    }),
              ),
              FormHelper.fieldLabel('Confirm Password'),
              FormHelper.textInput(
                context,
                model.passwordConfirmation,
                (value) => {
                  this.model.passwordConfirmation = value,
                },
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please Enter Password.';
                  }
                  return null;
                },
                obscureText: hidePassword,
                suffixIcon: IconButton(
                    color: Theme.of(context).accentColor.withOpacity(0.4),
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: FormHelper.saveButton('Register', () {
                  if (validateAndSave()) {
                    print(model.toJson());
                    setState(() {
                      isApiCallProcess = true;
                    });

                    apiService.createUser(model).then((ret) {
                      setState(() {
                        isApiCallProcess = false;
                      });
                      if (ret) {
                        FormHelper.showMessage(context, 'Shopify App',
                            'Registration Successfull', 'ok', () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Home()));
                        });
                      } else {
                        FormHelper.showMessage(context, 'Shopify App',
                            'Email Id Already Registered.', 'ok', () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Home()));
                        });
                      }
                    });
                  }
                }),
              )
            ],
          ),
        ),
      ),
    ));
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
