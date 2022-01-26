import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/widgets/forms.dart';

String? verificationCode;

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);
  static String route = '/email-verification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        elevation: 0,
        title: const Center(
          child: Text(
            'Verify your Email',
            style: kHomeAppBarTextStyle,
          ),
        ),
      ),
      body: Column(
        children: [
          TwoFormFieldTemplate(
            appBarTitle: 'Verify Email',
            formOneText: 'bolexguy@gmail.com',
            hideFormOneText: true,
            readOnlyOne: true,
            formTwoText: 'Verification code',
            onFieldOneChanged: (v) {},
            onFieldTwoChanged: (v) {},
            hideFormTwoText: false,
            showbottomText: false,
            onSubmit: () {},
            buttonTitle: 'Verify Email',
          ),
        ],
      ),
    );
  }
}
