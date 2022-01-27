import 'package:flutter/material.dart';
import 'package:resmart/components/profile_page_content.dart';
import 'package:resmart/screens/Auth/change_password.dart';
import 'package:resmart/screens/Auth/change_phone.dart';
import 'package:resmart/screens/Auth/email_verification.dart';
import 'package:resmart/utils/api_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static String settingsRoute = '/settings';
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        foregroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text(
              'Settings',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Icon(
              Icons.chevron_left_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: GestureDetector(
              child: Icon(
                Icons.settings_sharp,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProfilePageContent(
                  pageContent: 'Change Phone Number',
                  onPressed: () {
                    Navigator.pushNamed(context, ChangePhoneNumber.route);
                  },
                  iconSpace: 10,
                  rightIcon: Icons.phone,
                  rightBorderColor: Colors.transparent,
                  leftBorderColor: Colors.transparent,
                ),
                ProfilePageContent(
                  pageContent: 'Change Password',
                  iconSpace: 10,
                  onPressed: () {
                    Navigator.pushNamed(context, ChangePasswordPage.route);
                  },
                  rightIcon: Icons.lock_outline,
                  rightBorderColor: Colors.transparent,
                  leftBorderColor: Colors.transparent,
                ),
                ProfilePageContent(
                  pageContent: 'Verify Email',
                  iconSpace: 10,
                  onPressed: () {
                    Navigator.pushNamed(context, EmailVerificationPage.route);
                  },
                  rightIcon: Icons.email_outlined,
                  rightBorderColor: Colors.transparent,
                  leftBorderColor: Colors.transparent,
                ),
                const Divider(
                  height: 10,
                  color: Colors.black,
                ),
                ProfilePageContent(
                  iconSpace: 10,
                  pageContent: 'Contact us',
                  onPressed: () {},
                  rightIcon: Icons.person_outlined,
                  rightBorderColor: Colors.transparent,
                  leftBorderColor: Colors.transparent,
                ),
                ProfilePageContent(
                  iconSpace: 10,
                  pageContent: 'Delete Account',
                  onPressed: () {},
                  rightIcon: Icons.delete_outlined,
                  rightBorderColor: Colors.transparent,
                  leftBorderColor: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
