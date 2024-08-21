import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';

Widget homePageLoanCard() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red.withOpacity(0.1)),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: const CustomText(
            text: "PL",
            fontWeight: FontWeight.w900,
            fontSize: 22,
            color: Colors.white,
          ),
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 10,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: "Personal Loan",
                fontSize: 20,
                fontWeight: FontWeight.w600),
            CustomText(
                text: "1 Day Left / Pay Now",
                fontSize: 13,
                fontWeight: FontWeight.w400)
          ],
        ),
        const Spacer(),
        Column(
          children: [
            const CustomText(
              text: "₹ 20000.00",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            button(),
          ],
        )
      ],
    ),
  );
}

Widget button() {
  return Container(
    width: 50,
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    child: const Center(
      child: CustomText(
        text: "Pay",
        fontWeight: FontWeight.w500,
        fontSize: 10,
        color: Colors.white,
      ),
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6), color: Colors.blue),
  );
}
