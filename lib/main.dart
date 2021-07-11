import 'package:e_com_app_v_1_0/Services/ApiService.dart';
import 'package:flutter/material.dart';
import 'Models/UserModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late UserModel _user;
  late ApiService _service;

  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _service = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Please Fill The Following',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              controller: fnameController,
            ),
            TextField(
              controller: lnameController,
            ),
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
            ),
            TextField(
              controller: confPasswordController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String fname = fnameController.text;
          final String lname = lnameController.text;
          final String email = emailController.text;
          final String password = passwordController.text;
          final String confPassword = confPasswordController.text;
          UserModel user = await _service.createUser(
              fname, lname, email, password, confPassword);
          print(fnameController.text);
          setState(() {
            _user = user;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
