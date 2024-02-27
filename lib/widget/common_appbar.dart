import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  const CommonAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      title: title == null ? null : Text(title ?? "", style: Theme.of(context).textTheme.titleLarge?.copyWith( color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w400)),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
