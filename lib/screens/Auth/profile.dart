import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:resmart/components/profile_page_content.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/model/user_model.dart';
import 'package:resmart/screens/Auth/login.dart';
import 'package:resmart/screens/Auth/settings.dart';
import 'package:resmart/utils/api_service.dart';
import 'package:resmart/utils/helpers/fetch_mage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ApiService apiService = ApiService();
  UserModel? userModel;

  Future<Map<String, dynamic>> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('token');
    print(userToken);
    var response = await apiService.profile(token: userToken!);
    print('data: ${response.data['data']}');
    await prefs.setString('userData', response.data.toString());
    //final data = Map<String, dynamic>.from(response.data);
    return response.data['data'];
  }

  @override
  void initState() {
    getProfile().then((value) async {
      setState(() {
        userModel = UserModel.fromData(value);
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (userModel == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: kPrimaryBodyColor,
          ),
        ),
      );
    } else {
      var data = userModel;
      print(data);
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          foregroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                  ),
                ),
                child: const Icon(
                  Icons.chevron_left_outlined,
                  color: kIconColor,
                  size: kIconSize,
                ),
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.more_horiz,
                  size: kIconSize,
                  color: kIconColor,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 100.0, horizontal: 15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Container(
                          decoration: const BoxDecoration(),
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            child: fetchImage(
                              'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        userModel!.firstName + ' ' + userModel!.lastName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        userModel!.email,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    ProfilePageContent(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      rightIcon: Icons.privacy_tip_outlined,
                      onPressed: () {},
                      leftIcon: Icons.chevron_right_outlined,
                      pageContent: 'Privacy',
                    ),
                    ProfilePageContent(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      rightIcon: Icons.settings_outlined,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, SettingsPage.settingsRoute);
                      },
                      leftIcon: Icons.chevron_right_outlined,
                      pageContent: 'Settings',
                    ),
                    ProfilePageContent(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      rightIcon: Icons.logout_outlined,
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.remove('token');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      leftIcon: Icons.chevron_right_outlined,
                      pageContent: 'Logout',
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
}
