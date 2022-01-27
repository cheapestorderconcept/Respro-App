import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/HomePage/home.dart';
import 'package:resmart/utils/api_service.dart';
import 'package:resmart/widgets/forms.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? oldPassword;

String? newPassword;

class ChangePasswordPage extends StatelessWidget with ChangeNotifier {
  ChangePasswordPage({Key? key}) : super(key: key);
  static String route = '/change-password';
  static ApiService apiService = ApiService();
  static GlobalKey<FormState> formState = GlobalKey<FormState>();

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
      body: Form(
        key: formState,
        child: Column(
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
              onSubmit: () async {
                if (formState.currentState!.validate()) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String? userToken = prefs.getString('token');
                  if (oldPassword != newPassword) {
                    var response = await apiService.changePassword(
                        confirmPassword: newPassword,
                        newPassword: newPassword,
                        oldPassword: oldPassword,
                        token: userToken);
                    if (response.statusCode == 200 ||
                        response.statusCode == 201 ||
                        response.statusCode == 202) {
                      await Fluttertoast.showToast(
                          msg: response.data["response_message"].toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: kPrimaryBodyColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
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
                  } else {
                    await Fluttertoast.showToast(
                        msg: "Passwords should not match",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: kPrimaryBodyColor,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                }
              },
              buttonTitle: 'Change Password',
            ),
          ],
        ),
      ),
    );
  }
}
