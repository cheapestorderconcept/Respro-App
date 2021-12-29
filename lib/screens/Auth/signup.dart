import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/Auth/login.dart';
import 'package:resmart/widgets/forms.dart';

String? userEmail;
String? userpassword;
String? dropdownValue = 'Individual';
String? firstName;
String? lastName;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  static String regRoute = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Column(
              children: <Widget>[
                MyFormField(
                  validator: (validate) {},
                  formWidth: 350,
                  onChanged: (firstname) {
                    firstName = firstname;
                  },
                  hintText: 'Please enter first name',
                  hintStyle: kGeneralHinrStyle,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                MyFormField(
                  validator: (validate) {},
                  formWidth: 350,
                  onChanged: (lastname) {
                    lastName = lastname;
                  },
                  hintText: 'Please enter last name',
                  hintStyle: kGeneralHinrStyle,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                MyFormField(
                  validator: (validate) {},
                  formWidth: 350,
                  onChanged: (email) {
                    userEmail = email;
                  },
                  hintText: 'Please Enter email',
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
                CustomDropDown(
                    color: Colors.grey.shade200,
                    dropdownValue: dropdownValue,
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                    items: const [
                      "Individual",
                      'Property Owner',
                      'Estate Agent',
                      'Property Developer',
                      'Employer',
                      'Worker'
                    ]),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, bottom: 20.0, right: 10),
                  child: MyFormButton(
                    width: double.infinity,
                    height: 60,
                    onPressed: () {},
                    label: 'Create Account',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 30,
                    ),
                    CustomTextButton(
                      color: Colors.black,
                      onClicked: () {
                        Navigator.pushNamed(context, LoginPage.loginRoute);
                      },
                      label: "Already have an account? Log In",
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
