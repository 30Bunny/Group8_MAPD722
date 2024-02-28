import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:group8_mapd722/constant.dart';

class DialogUtil{
  static DialogUtil? _dialog;

  static DialogUtil? getInstance() {
    _dialog ??= DialogUtil();
    return _dialog;
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingFour
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 40.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..contentPadding = const EdgeInsets.all(8.0)
      ..maskType = EasyLoadingMaskType.clear
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  TransitionBuilder initLoader(){
    return EasyLoading.init();
  }

  void showLoaderDialog() {
    EasyLoading.show();
  }

  void dismissLoaderDialog() {
    EasyLoading.dismiss();
  }

  showAlertDialog(BuildContext context, String content,
      {String? buttonText, String? title, Function()? onButtonTap}) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kPrimaryDarkColor)),
      onPressed:  () => Navigator.pop(context),
    );
    Widget continueButton = TextButton(
      onPressed:  onButtonTap,
      child: Text(buttonText ?? "Continue", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kPrimaryDarkColor)),
    );

    // set up the AlertDialog for android
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      title: Text(title ?? "AlertDialog", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),),
      content: Text(content),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // set up the AlertDialog for IOS
    CupertinoAlertDialog alertIOS = CupertinoAlertDialog(
      title: Text(title ?? "AlertDialog", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),),
      content: Text(content),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    if (!Platform.isIOS) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return showCupertinoDialog(
      context: context,
      builder: (context) => alertIOS,
    );
  }
}