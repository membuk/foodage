import 'package:flutter/material.dart';

class Utils {
  static AppColor appColor = const AppColor();
  static TextStyles textStyles = TextStyles();
}

class AppColor {
  const AppColor();

  final Color primaryColor = const Color.fromRGBO(21, 88, 97, 1);
  final Color inactiveColor = const Color.fromRGBO(117, 117, 117, 1);
  final Color textColor = Colors.black;
  final Color foregroundColor = const Color.fromRGBO(66, 165, 245, 1);
  final Color backgroundColor = const Color.fromRGBO(163, 220, 214, 1);

  final Color successColor = Colors.green;
  final Color errorColor = Colors.red;
}

class TextStyles {
  TextStyles();

  final TextStyle headingStyle = TextStyle(
      color: Utils.appColor.textColor,
      fontWeight: FontWeight.bold,
      fontSize: 16);
  final TextStyle textStyle = TextStyle(color: Utils.appColor.textColor);
  final TextStyle boldTextStyle =
      TextStyle(color: Utils.appColor.textColor, fontWeight: FontWeight.bold);
}
