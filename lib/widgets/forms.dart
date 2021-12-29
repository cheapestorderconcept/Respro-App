// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';

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
