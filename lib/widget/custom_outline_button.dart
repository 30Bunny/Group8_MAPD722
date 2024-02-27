import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';

class CustomOutlineButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const CustomOutlineButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: kPrimaryColor,
            ),
            shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(8)))),
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: kPrimaryColor),
        ),
      ),
    );
  }
}
