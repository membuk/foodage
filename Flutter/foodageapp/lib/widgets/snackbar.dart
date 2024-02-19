import 'package:flutter/material.dart';
import 'package:foodageapp/providers/routes.dart';
import 'package:foodageapp/providers/utils.dart';

class AlertWidgets {
  static void showSnackbar(String text,
      {Color backgroundColor = Colors.grey, int sec = 5}) {
    final SnackBar snackBar = SnackBar(
      backgroundColor: backgroundColor,
      duration: Duration(seconds: sec),
      content: Text(text),
    );

    ScaffoldMessenger.of(Routes.navigatorKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(Routes.navigatorKey.currentContext!)
        .showSnackBar(snackBar);
  }

  static void showError({String? text, Object? error}) {
    late String errText;

    if (error != null) {
      errText = error.toString();
    } else if (text != null) {
      errText = text;
    } else {
      errText = "Hata";
    }

    return showSnackbar(errText, backgroundColor: Utils.appColor.errorColor);
  }

  static void showSuccess({required String text}) {
    return showSnackbar(text, backgroundColor: Utils.appColor.successColor);
  }
}
