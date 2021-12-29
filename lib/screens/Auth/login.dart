import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/Auth/reset_password.dart';
import 'package:resmart/screens/Auth/signup.dart';
import 'package:resmart/widgets/forms.dart';

String? userEmail;
String? userpassword;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String loginRoute = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        foregroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 200),
            child: Column(
              children: <Widget>[
                MyFormField(
                  validator: (validate) {},
                  formWidth: 350,
                  onChanged: (email) {
                    userEmail = email;
                  },
                  keyBoardType: TextInputType.emailAddress,
                  hintText: 'Please enter email',
                  hintStyle: kGeneralHinrStyle,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                MyFormField(
                  validator: (validate) {},
                  formWidth: 350,
                  obscureText: true,
                  onChanged: (password) {
                    userpassword = password;
                  },
                  hintText: 'Please Enter password',
                  hintStyle: kGeneralHinrStyle,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, bottom: 20.0, right: 10.0),
                  child: MyFormButton(
                    width: double.infinity,
                    height: 60,
                    onPressed: () {},
                    label: 'Login',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTextButton(
                      onClicked: () {
                        Navigator.pushNamed(
                            context, ResetPassword.resetPasswordRoute);
                      },
                      label: "Forgot Password?",
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    CustomTextButton(
                      color: Colors.black,
                      onClicked: () {
                        Navigator.pushNamed(context, SignupPage.regRoute);
                      },
                      label: "Register",
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
