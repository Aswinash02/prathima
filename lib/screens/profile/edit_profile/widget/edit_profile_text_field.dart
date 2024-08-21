import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class EditProfileTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const EditProfileTextField({
    super.key,
    this.controller,
    this.hintText,
    this.readOnly,
    this.onTap,
    this.keyboardType, this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        controller: controller,
        onTap: onTap,
        cursorColor: MyTheme.mainColor,
        cursorHeight: 20,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          suffixIcon: readOnly == true
              ? const SizedBox()
              : const Icon(
            Icons.edit,
            color: MyTheme.mainColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 15,
              color: readOnly == true ? MyTheme.mainColor : MyTheme.grey_153),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        ),
      ),
    );
  }
}
