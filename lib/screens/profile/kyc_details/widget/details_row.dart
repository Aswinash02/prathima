import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';

Widget detailsRow({
  required String title,
  required String value,
  double? titleWidth,
  double? fontSize,
  double? valueFontSize,
  double? fontPadding,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: titleWidth ?? 100,
        child: CustomText(
          text: title,
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 18,
        ),
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 8.0, vertical: fontPadding ?? 8.0),
        child: CustomText(
          text: ':',
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 18,
        ),
      ),
      Expanded(
          child: SizedBox(
        child: CustomText(
          text: value,
          fontWeight: FontWeight.w600,
          fontSize: valueFontSize ?? 14,
          maxLines: 100,
        ),
      ))
    ],
  );
}
