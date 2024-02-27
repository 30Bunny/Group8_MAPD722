import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const CustomElevatedButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
        ),
        child: Text(buttonText,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white)),
      ),
    );
  }
}
