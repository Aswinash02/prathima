import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

Widget loanDetailContainer({required String loanType, required String icon}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(12),
        child: CustomIcon(
          icon: icon,
          color: Colors.white,
        ),
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: MyTheme.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
          width: 82,
          child: Center(
              child: CustomText(
            text: loanType,
            fontSize: 12,
          )))
    ],
  );
}
