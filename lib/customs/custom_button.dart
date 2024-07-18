import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final Color color;
//   final Color textColor;
//   final double borderRadius;
//   final double padding;
//   final double horizontalPadding;
//   final double fontSize;
//
//   const CustomButton({
//     Key? key,
//     required this.text,
//     required this.onPressed,
//     this.color = MyTheme.mainColor,
//     this.textColor = Colors.white,
//     this.borderRadius = 8.0,
//     this.padding = 16.0,
//     this.horizontalPadding = 16.0,
//     this.fontSize = 16.0,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         primary: color,
//         padding: EdgeInsets.symmetric(vertical: padding,horizontal: horizontalPadding),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           color: textColor,
//           fontSize: fontSize,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      required this.text,
      this.color,
      this.textColor,
      this.height,
      this.width});

  final void Function()? onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50,
        child: Center(
          child: CustomText(
            text: text,
            color: textColor ?? MyTheme.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        decoration: BoxDecoration(
            color: color ?? MyTheme.mainColor,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
