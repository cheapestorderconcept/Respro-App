import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/Auth/change_password.dart';
import 'package:resmart/screens/Auth/change_phone.dart';
import 'package:resmart/screens/Auth/email_verification.dart';
import 'package:resmart/screens/Auth/login.dart';
import 'package:resmart/screens/Auth/reset_password.dart';
import 'package:resmart/screens/Auth/root_page.dart';
import 'package:resmart/screens/Auth/settings.dart';
import 'package:resmart/screens/Auth/signup.dart';
import 'package:resmart/screens/Estate-management/property_search.dart';
import 'package:resmart/screens/Estate-management/property_search_result.dart';
import 'package:resmart/screens/HomePage/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kCompanyName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootPage(),
      routes: {
        SignupPage.regRoute: (context) => const SignupPage(),
        LoginPage.loginRoute: (context) => const LoginPage(),
        ResetPassword.route: (context) => const ResetPassword(),
        PropertiesSearchPage.propertySearchRoute: (context) =>
            PropertiesSearchPage(),
        SettingsPage.settingsRoute: (context) => const SettingsPage(),
        ChangePasswordPage.route: (context) =>  ChangePasswordPage(),
        ChangePhoneNumber.route: (context) => const ChangePhoneNumber(),
        EmailVerificationPage.route: (context) => const EmailVerificationPage(),
        PropertySearchResultPage.propertyResult: (context) =>
            const PropertySearchResultPage()
      },
    );
  }
}
