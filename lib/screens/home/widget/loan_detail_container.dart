import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

Widget loanDetailContainer(
    {required String loanType,
    required String icon,
    required void Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: MyTheme.mainColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CustomIcon(
            icon: icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            width: 75,
            child: Center(
                child: CustomText(
                    text: loanType,
                    maxLines: 2,
                    fontSize: 12,
                    textAlign: TextAlign.center)))
      ],
    ),
  );
}
