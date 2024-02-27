
import 'package:flutter/material.dart';

TextStyle? loginTitleTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.labelMedium?.copyWith(
      color: Colors.white,
      fontSize: 32);
}