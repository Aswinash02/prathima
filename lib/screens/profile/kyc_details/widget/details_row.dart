import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';

Widget detailsRow({required String title, required String value,double? titleWidth}) {
  return Row(
    children: [
      SizedBox(
        width: titleWidth ?? 100,
        child: CustomText(
          text: title,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomText(
          text: ':',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      Expanded(
          child: SizedBox(
        child: CustomText(
          text: value,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ))
    ],
  );
}
