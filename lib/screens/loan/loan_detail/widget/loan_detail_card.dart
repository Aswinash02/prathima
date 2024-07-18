import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class LoanDetailCard extends StatelessWidget {
  const LoanDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.personalLoanDetailScreen);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: MyTheme.mixedColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    CustomText(
                      text: "Personal Loan",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    CustomText(
                      text: "Loan Account Number",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all()),
                  child: const CustomText(
                    text: "PPR02022020202",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomText(
              text: "Outstanding Balance",
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            const CustomText(
              text: "₹8,00,000.00",
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
