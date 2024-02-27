import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
}