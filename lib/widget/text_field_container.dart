import 'package:flutter/material.dart';
import 'package:group8_mapd722/widget/custom_text_field.dart';

class TextFieldContainer extends StatelessWidget {
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
  final TextInputType? keyboardType;

  const TextFieldContainer(
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
      this.hint,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(labelText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),),
        ),
        CustomTextField(
          controller: controller,
          labelText: labelText,
          onSaved: onSaved,
          validation: validation,
          enabled: enabled,
          readOnly: readOnly,
          onTap: onTap,
          suffixIconColor: suffixIconColor,
          suffixIconData: suffixIconData,
          maxLines: maxLines,
          hint: hint,
          keyboardType: keyboardType,
        )
      ],
    );
  }
}
