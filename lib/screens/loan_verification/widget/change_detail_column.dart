import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';

Widget changeDetailColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        text: "Details",
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return detailRow(key: 'Jun Month', value: '₹2500');
          })
    ],
  );
}

Widget detailRow({required String key, required String value}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      children: [
        CustomText(
          text: key,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        Spacer(),
        CustomText(
          text: value,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        )
      ],
    ),
  );
}
