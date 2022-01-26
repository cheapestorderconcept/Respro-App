// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/Auth/reset_password.dart';
import 'package:resmart/screens/Auth/signup.dart';

class MyFormField extends StatelessWidget {
  MyFormField(
      {Key? key,
      this.enabledBorder = false,
      this.borderSide = BorderSide.none,
      this.formHeight = 50,
      @required this.onChanged,
      @required this.validator,
      this.obscureText = false,
      this.filled = true,
      this.hintText,
      this.readOnly = false,
      this.hintStyle,
      this.keyBoardType,
      this.formWidth = 100,
      this.fillColor = kFormPrimaryColor,
      this.color = kFormPrimaryColor})
      : super(key: key);
  bool enabledBorder = false;
  double formHeight = 50;
  double formWidth = 200;
  bool filled = true;
  bool obscureText = false;
  Color fillColor = Colors.grey;
  Color color;
  BorderSide borderSide;
  Function(String?)? onChanged;
  TextStyle? hintStyle;
  String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final bool readOnly;
  String? hintText = 'Please supply hint text';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          height: formHeight,
          width: formWidth,
          child: TextFormField(
            keyboardType: keyBoardType,
            onChanged: onChanged,
            validator: validator,
            readOnly: readOnly,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              filled: filled,
              fillColor: fillColor,
              border: OutlineInputBorder(
                borderSide: borderSide,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          decoration: const BoxDecoration()),
    );
  }
}

class MyTextArea extends StatelessWidget {
  MyTextArea(
      {Key? key,
      this.enabledBorder = false,
      this.borderSide = BorderSide.none,
      this.formHeight = 50,
      @required this.onChanged,
      @required this.validator,
      this.obscureText = false,
      this.filled = true,
      this.hintText,
      this.hintStyle,
      this.maxLines,
      this.keyBoardType,
      this.formWidth = 100,
      this.fillColor = kFormPrimaryColor,
      this.color = kFormPrimaryColor})
      : super(key: key);
  bool enabledBorder = false;
  double formHeight = 50;
  double formWidth = 200;
  bool filled = true;
  bool obscureText = false;
  Color fillColor = Colors.grey;
  Color color;
  BorderSide borderSide;
  int? maxLines;
  Function(String?)? onChanged;
  TextStyle? hintStyle;
  String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  String? hintText = 'Please supply hint text';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          height: formHeight,
          width: formWidth,
          child: TextFormField(
            maxLines: maxLines,
            minLines: 6,
            keyboardType: keyBoardType,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              filled: filled,
              fillColor: fillColor,
              border: OutlineInputBorder(
                borderSide: borderSide,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          decoration: const BoxDecoration()),
    );
  }
}

class MyFormTitle extends StatelessWidget {
  MyFormTitle({Key? key, @required this.label}) : super(key: key);

  String? label;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$label',
      style: kGeneralFormrTitleStyle,
    );
  }
}

class MyFormButton extends StatelessWidget {
  MyFormButton(
      {Key? key,
      @required this.label,
      this.height = 100,
      this.obscureText = false,
      this.width = 100,
      @required this.onPressed})
      : super(key: key);
  String? label;
  double height = 100;
  double width = 100;
  bool obscureText = false;
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      height: height,
      width: width,
      child: ElevatedButton(
        child: Text(
          '$label',
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            kPrimaryBodyColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {Key? key,
      @required this.dropdownValue,
      @required this.onChanged,
      this.formHeight = 50,
      this.formWidth = 350,
      this.items = const ['text', 'text'],
      this.color = kFormPrimaryColor})
      : super(key: key);
  String? dropdownValue;
  List<String> items = ['text', 'text'];
  Function(String?)? onChanged;
  Color color = kFormPrimaryColor;
  double formHeight = 60;
  double formWidth = 350;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: formHeight,
        width: formWidth,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 16,
          elevation: 10,
          style:
              const TextStyle(color: Colors.black, fontSize: kGeneralFontSize),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: kFontSize12WeightBold,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {Key? key,
      @required this.onClicked,
      @required this.label,
      this.color = Colors.black})
      : super(key: key);
  Function()? onClicked;
  String? label;
  Color color = kPrimaryBodyColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Text(
        '$label',
        style: TextStyle(color: color, fontSize: 14),
      ),
    );
  }
}

class TwoFormFieldTemplate extends StatelessWidget {
  const TwoFormFieldTemplate(
      {Key? key,
      this.appBarTitle = '',
      required this.onSubmit,
      required this.buttonTitle,
      required this.formOneText,
      required this.hideFormOneText,
      required this.hideFormTwoText,
      required this.showbottomText,
      this.readOnlyOne = false,
      required this.onFieldOneChanged,
      required this.onFieldTwoChanged,
      required this.formTwoText})
      : super(key: key);

  final String appBarTitle;
  final String buttonTitle;
  final String formOneText;
  final bool hideFormOneText;
  final bool hideFormTwoText;
  final String formTwoText;
  final Function()? onSubmit;
  final Function(String? val)? onFieldOneChanged;
  final Function(String? val)? onFieldTwoChanged;
  final bool showbottomText;
  final bool readOnlyOne;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: <Widget>[
          MyFormField(
            validator: (validate) {},
            formWidth: 350,
            onChanged: onFieldOneChanged,
            keyBoardType: TextInputType.emailAddress,
            hintText: formOneText,
            readOnly: readOnlyOne,
            hintStyle: kGeneralHinrStyle,
            obscureText: hideFormOneText,
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
          MyFormField(
            validator: (validate) {},
            formWidth: 350,
            obscureText: hideFormTwoText,
            // readOnly: readOnly,
            onChanged: onFieldTwoChanged,
            hintText: formTwoText,
            hintStyle: kGeneralHinrStyle,
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, bottom: 20.0, right: 10.0),
            child: MyFormButton(
              width: double.infinity,
              height: 60,
              onPressed: onSubmit,
              label: buttonTitle,
              
            ),
          ),
          if (showbottomText == true)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomTextButton(
                  onClicked: () {
                    Navigator.pushNamed(context, ResetPassword.route);
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
    );
  }
}
