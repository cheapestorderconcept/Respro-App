import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/widgets/forms.dart';

String? verificationCode;
String? email;
String? password;

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);
  static const String route = '/reset-password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        elevation: 0,
        title: const Center(
          child: Text(
            'Password Reset',
            style: kHomeAppBarTextStyle,
          ),
        ),
      ),
      body: Column(
        children: [
          TwoFormFieldTemplate(
            formOneText: 'Enter your email address',
            hideFormOneText: true,
            formTwoText: 'Enter verification code',
            onFieldOneChanged: (v) {},
            onFieldTwoChanged: (v) {
              verificationCode = v;
            },
            hideFormTwoText: true,
            showbottomText: false,
            onSubmit: () {},
            buttonTitle: 'Reset Password',
          ),
          MyFormField(
            onChanged: (v) {
              password = v;
            },
            validator: (v) {},
            hintText: 'Enter new password',
          ),
        ],
      ),
    );
  }
}
