import 'package:flutter/material.dart';
import 'package:resmart/screens/Auth/login.dart';
import 'package:resmart/screens/HomePage/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);
  static String regRoute = '/';

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool? isLogin;

  Future<bool> verifyUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool val = prefs.containsKey('token');
    return val;
  }

  @override
  void initState() {
    verifyUser().then((value) {
      setState(() {
        isLogin = value;
        print(isLogin);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin == true) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
