import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {

  static String? getFormattedDate(DateTime? dateTime, DateFormat formatter) {
    if (dateTime == null) return "";

    String? formatted;
    try {
      formatted = formatter.format(dateTime);
    } catch (e) {
      print(e);
    }
    return formatted;
  }

  static bool isValidEmail(String? value) {
    if (value == null || value.isEmpty) return false;
    RegExp exp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        caseSensitive: false);
    return exp.hasMatch(value);
  }

  static bool isValidPassword(String? value) {
    if (value == null || value.isEmpty) return false;
    RegExp exp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    return exp.hasMatch(value);
  }

  static bool isValidMobile(String? value) {
    if (value == null || value.isEmpty) return false;
    RegExp exp = RegExp(r"^[0-9]{3}[0-9]{3}[0-9]{4}$");
    return exp.hasMatch(value);
  }

  static failureMsg(BuildContext context, String message,
      {Color? color}) {
    showMsg(context, message, color: color ?? const Color(0xffD32F2F));
  }

  static successMsg(BuildContext context, String message) {
    showMsg(context, message, color: const Color(0xff43A047));
  }

  static showMsg(BuildContext context, String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: color != null ? Colors.white : null),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    ));
  }

  static bool isIOS(){
    return Platform.isIOS;
  }

}