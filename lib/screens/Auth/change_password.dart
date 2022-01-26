import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/widgets/forms.dart';

String? oldPassword;

String? newPassword;

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);
  static String route = '/change-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        elevation: 0,
        title: const Center(
          child: Text(
            'Change Password',
            style: kHomeAppBarTextStyle,
          ),
        ),
      ),
      body: Column(
        children: [
          TwoFormFieldTemplate(
            appBarTitle: '',
            formOneText: 'Enter Old Password',
            hideFormOneText: true,
            formTwoText: 'Enter new password',
            onFieldOneChanged: (oldP) {
              oldPassword = oldP;
            },
            onFieldTwoChanged: (nP) {
              newPassword = nP;
            },
            hideFormTwoText: true,
            showbottomText: false,
            onSubmit: () {
              debugPrint(oldPassword);
              debugPrint(newPassword);
            },
            buttonTitle: 'Change Password',
          ),
        ],
      ),
    );
  }
}
