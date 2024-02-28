import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  final bool showButton;
  final String? buttonText;
  final Function()? onButtonTap;
  final Color buttonTextColor;
  const CommonAppBar({super.key, this.title, this.buttonText, this.onButtonTap, this.showButton = false, this.buttonTextColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      title: title == null ? null : Text(title ?? "", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400)),
      centerTitle: true,
      actions: [
        if(showButton)TextButton(onPressed: onButtonTap, child: Text(buttonText ?? "", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: buttonTextColor),))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
