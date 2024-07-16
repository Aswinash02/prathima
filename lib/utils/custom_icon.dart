import 'package:flutter/material.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class CustomIcon extends StatelessWidget {
  final double? height;
  final double? width;
  final String icon;
  final Color? color;

  const CustomIcon(
      {super.key, this.height, this.width, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20,
      width: width ?? 20,
      child: Image(
        image: AssetImage(icon),
        color: color ?? MyTheme.blackColor,
      ),
    );
  }
}
