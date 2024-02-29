import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validation;
  final FormFieldSetter<String>? onSaved;
  final bool enabled;
  final IconData? suffixIconData;
  final Color? suffixIconColor;
  final bool readOnly;
  final Function()? onTap;
  final int maxLines;
  final String? hint;

  const CustomTextField(
      {super.key,
      required this.labelText,
      this.controller,
      this.validation,
      this.onSaved,
      this.enabled = true,
      this.readOnly = false,
      this.onTap,
      this.suffixIconData,
      this.suffixIconColor,
      this.maxLines = 1,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.0),
      decoration: InputDecoration(
          hintText: hint ?? labelText,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.0, color: Colors.grey),
          //errorStyle: const TextStyle(color: kRedColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(8.0),
          ),
          suffixIcon: Icon(suffixIconData),
          suffixIconColor: suffixIconColor ?? Colors.black26,),
      validator: validation,
      onSaved: onSaved,
      enabled: enabled,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
    );
  }
}
