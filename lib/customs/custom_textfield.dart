import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.keyboardType,
      this.readOnly,
      this.hintTextColor,
      this.inputFormatters,
      this.maxLines});

  final TextEditingController controller;
  final String hintText;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: inputFormatters,
      readOnly: readOnly ?? false,
      cursorColor: MyTheme.grey_153,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor ?? MyTheme.grey_153),
        contentPadding: EdgeInsets.all(12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
