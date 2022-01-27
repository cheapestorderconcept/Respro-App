import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/Auth/reset_password.dart';
import 'package:resmart/screens/Auth/signup.dart';
import 'package:resmart/screens/HomePage/home.dart';
import 'package:resmart/utils/api_service.dart';
import 'package:resmart/widgets/forms.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? userEmail;
String? userpassword;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String loginRoute = '/login';

  static ApiService apiService = ApiService();
  static GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formState,
        child: TwoFormFieldTemplate(
          onSubmit: () async {
            if (formState.currentState!.validate()) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              var response = await apiService.logIn(
                email: userEmail,
                password: userpassword,
              );
              //print(response.data);
              if (response.statusCode == 200 ||
                  response.statusCode == 201 ||
                  response.statusCode == 202) {
                //String token = response.data["token"];

                String token = response.data['data']['token'];
                            prefs.setString('token', token);
                await Fluttertoast.showToast(
                    msg: response.data["response_message"].toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kPrimaryBodyColor,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
                return;
              }
              if (response.statusCode == 400 ||
                  response.statusCode == 401 ||
                  response.statusCode == 500) {
               await Fluttertoast.showToast(
                    msg: response.data["response_message"].toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kPrimaryBodyColor,
                    textColor: Colors.white,
                    fontSize: 16.0);
                return;
              }
            }
          },
          formOneText: 'Please enter email',
          formTwoText: 'Please Enter Password',
          onFieldOneChanged: (v) {
            userEmail = v;
          },
          onFieldTwoChanged: (v) {
            userpassword = v;
          },
          hideFormOneText: false,
          hideFormTwoText: true,
          showbottomText: true,
          buttonTitle: 'Login',
        ),
      ),
    );
  }
}
