import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/widgets/forms.dart';

String? verificationCode;

class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber({Key? key}) : super(key: key);
  static String route = '/change-phone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        elevation: 0,
        title: const Center(
          child: Text(
            'Change Phone Number',
            style: kHomeAppBarTextStyle,
          ),
        ),
      ),
      body: Column(
        children: [
          TwoFormFieldTemplate(
            formOneText: '07033411779',
            hideFormOneText: true,
            readOnlyOne: true,
            formTwoText: 'New phone number',
            onFieldOneChanged: (v) {},
            onFieldTwoChanged: (v) {},
            hideFormTwoText: true,
            showbottomText: false,
            onSubmit: () {},
            buttonTitle: 'Change phone number',
          ),
        ],
      ),
    );
  }
}
