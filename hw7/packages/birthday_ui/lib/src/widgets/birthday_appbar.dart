import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

class BirthdayAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BirthdayAppBar({
    super.key,
    this.actions,
    this.leading,
    this.title,
    this.centerTitle = false,
    this.backgroundColor = kWhiteColor,
  });

  final List<Widget>? actions;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
