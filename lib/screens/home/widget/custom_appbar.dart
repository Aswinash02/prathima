import 'package:flutter/material.dart';
import '../../../customs/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.leading,
      required this.title,
      this.actions,
      this.backgroundColor,
      this.titleColor,
      this.centerTitle,
      this.automaticallyImplyLeading});

  final Widget? leading;
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool? centerTitle;
  final bool? automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      centerTitle: centerTitle ?? false,
      title: CustomText(
        text: title,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: titleColor ?? Colors.white,
      ),
      actions: actions,
      backgroundColor: backgroundColor ?? Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      iconTheme: IconThemeData(color: titleColor ?? Colors.white),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
