import 'package:e_com_app_v_1_0/Models/UserModel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Your Name'),
      ),
    );
  }
}
