import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  static showMessage(
      {required String message, Color? bgColor, Color? textColor}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: bgColor,
      textColor: textColor,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
