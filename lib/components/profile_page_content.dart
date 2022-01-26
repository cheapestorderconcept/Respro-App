import 'package:flutter/material.dart';

class ProfilePageContent extends StatelessWidget {
  const ProfilePageContent(
      {Key? key,
      required this.pageContent,
      required this.onPressed,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.rightBorderColor = Colors.yellow,
      this.leftBorderColor = Colors.yellow,
      this.sizedBox = const SizedBox(),
      this.rightIcon,
      this.iconSpace = 0.0,
      this.leftIcon})
      : super(key: key);

  final String pageContent;
  final Function() onPressed;
  final IconData? rightIcon;
  final IconData? leftIcon;
  final Color rightBorderColor;
  final double iconSpace;
  final SizedBox sizedBox;
  final Color leftBorderColor;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: rightBorderColor,
              )),
              child: Icon(
                rightIcon,
                color: Colors.black,
                size: 20,
              ),
            ),
            if (iconSpace > 1)
              SizedBox(
                width: iconSpace,
              ),
            Text(
              pageContent,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: leftBorderColor,
              )),
              child: Icon(
                leftIcon,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
