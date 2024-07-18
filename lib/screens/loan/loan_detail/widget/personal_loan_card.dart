import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class PersonalLoanCard extends StatelessWidget {
  const PersonalLoanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          gradient: MyTheme.buildLinearGradientLoanCard(),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Loan repayment",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  CustomText(
                    text: "₹14750.00",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  CustomText(
                    text: "Due March 20th, 2024",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ],
              ),
              circleContainer()
            ],
          ),
        ],
      ),
    );
  }

  Widget circleContainer() {
    return Container(
      height: 56,
      width: 56,
      child: Center(
        child: CustomText(
          text: "15 Days",
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 3),
      ),
    );
  }
}
