import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.keyboardType,
      this.readOnly,
      this.hintTextColor,
      this.inputFormatters,
      this.maxLines,
      this.onChanged, this.suffixIcon, this.onTap});

  final TextEditingController? controller;
  final String? hintText;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: inputFormatters,
      readOnly: readOnly ?? false,
      cursorColor: MyTheme.grey_153,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines ?? 1,
      textAlign: TextAlign.left,
      onTap: onTap,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor ?? MyTheme.grey_153),
        contentPadding: const EdgeInsets.all(12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
