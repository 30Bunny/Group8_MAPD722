import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 96, fontWeight: FontWeight.w300, color: Colors.black),
        displayMedium: TextStyle(
            fontSize: 60, fontWeight: FontWeight.w400, color: Colors.black),
        displaySmall: TextStyle(
            fontSize: 48, fontWeight: FontWeight.w400, color: Colors.black),
        headlineMedium: TextStyle(
            fontSize: 34, fontWeight: FontWeight.w400, color: Colors.black),
        headlineSmall: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
        titleLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        bodyLarge: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
        bodyMedium: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87),
        bodySmall: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
        labelLarge: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: kPrimaryColor),
          titleTextStyle: TextStyle(color: kPrimaryColor)),
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor,
      primary: kPrimaryColor,
          onPrimary: Colors.white, // header text color
          error: Colors.red,));

  static final ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 96, fontWeight: FontWeight.w300, color: Colors.black),
      displayMedium: TextStyle(
          fontSize: 60, fontWeight: FontWeight.w400, color: Colors.black),
      displaySmall: TextStyle(
          fontSize: 48, fontWeight: FontWeight.w400, color: Colors.black),
      headlineMedium: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w400, color: Colors.black),
      headlineSmall: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
      labelLarge: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: kPrimaryColor),
        titleTextStyle: TextStyle(color: kPrimaryColor)),
    colorScheme: ColorScheme.fromSeed(
      seedColor: kPrimaryColor,
      brightness: Brightness.dark,
    ),
  );
}
