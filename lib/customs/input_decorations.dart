import 'package:flutter/material.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class InputDecorations {
  static InputDecoration buildInputDecoration_1({hint_text = ""}) {
    return InputDecoration(
        hintText: hint_text,
        filled: true,
        fillColor: MyTheme.white,
        hintStyle: const TextStyle(fontSize: 12.0, color: MyTheme.textfield_grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: MyTheme.textfield_grey,
              width: 0.2),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: MyTheme.accent_color,
              width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: MyTheme.textfield_grey,
              width: 0.2),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0));
  }

  static InputDecoration buildInputDecoration_phone({hint_text = ""}) {
    return InputDecoration(
        hintText: hint_text,
        hintStyle: const TextStyle(fontSize: 12.0, color: MyTheme.textfield_grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.textfield_grey, width: 0.5),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(6.0),
              bottomRight: Radius.circular(6.0)),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.accent_color, width: 0.5),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(6.0),
                bottomRight: Radius.circular(6.0))),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0));
  }
}