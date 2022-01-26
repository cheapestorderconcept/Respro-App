import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/Auth/login.dart';
import 'package:resmart/screens/Auth/reset_password.dart';
import 'package:resmart/utils/api_service.dart';
import 'package:resmart/utils/helpers/helpers.dart';
import 'package:resmart/widgets/forms.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? userEmail;
String? userpassword;
String? dropdownValue = 'Individual';
String? firstName;
String? lastName;
String? phoneNumber;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  static String regRoute = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  ApiService apiService = ApiService();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formState,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70.0),
              child: Column(
                children: <Widget>[
                  MyFormField(
                    validator: (validate) {
                      validate!.isEmpty ? 'Enter this field' : null;
                    },
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
                    validator: (validate) {
                      validate!.isEmpty ? 'Enter this field' : null;
                    },
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
                    validator: (validate) {
                      validate!.isEmpty ? 'Enter this field' : null;
                    },
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
                    validator: (validate) {
                      validate!.isEmpty ? 'Enter this field' : null;
                    },
                    formWidth: 350,
                    onChanged: (phonenumber) {
                      phoneNumber = phonenumber;
                    },
                    hintText: 'Please enter phone number',
                    hintStyle: kGeneralHinrStyle,
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  MyFormField(
                    validator: (validate) {
                      validate!.isEmpty ? 'Enter this field' : null;
                    },
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
                      onPressed: () async {
                        if (formState.currentState!.validate()) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          //Helpers(context).showProgress(context);
                          var response = await apiService.signUp(
                              email: userEmail,
                              firstname: firstName,
                              lastname: lastName,
                              password: userpassword,
                              phonenumber: phoneNumber.toString());
                          //Navigator.pop(context);
                          //print(response.data);
                          if (response.statusCode == 200 ||
                              response.statusCode == 201 ||
                              response.statusCode == 202) {
                            String token = response.data['data']['token'];
                            prefs.setString('token', token);
                            Fluttertoast.showToast(
                                msg: response.statusMessage.toString(),
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 10,
                                backgroundColor: Colors.amber,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          } else {
                            print('here');
                            Fluttertoast.showToast(
                                msg: response.statusMessage.toString(),
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 10,
                                backgroundColor: Colors.amber,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Helpers(context).showError(
                                context, response.statusMessage.toString());
                          }
                        }
                      },
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
      ),
    );
  }
}
