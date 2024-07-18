import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/loan/widget/view_button.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class LoanCard extends StatelessWidget {
  const LoanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: MyTheme.mainColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          const CustomText(
            text: "Personal Loan",
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: MyTheme.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const CustomText(
                    text: "Loan Account Number",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: MyTheme.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: 120,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(6)),
                      child: const Center(
                        child: CustomText(
                          text: "PPR20202020",
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: MyTheme.white,
                        ),
                      )),
                ],
              ),
              Column(
                children: [
                  const CustomText(
                    text: "Outstanding Balance",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: MyTheme.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: 120,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(6)),
                      child: const Center(
                        child: CustomText(
                          text: "₹20,000.00",
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: MyTheme.white,
                        ),
                      )),
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CustomText(
              text: "EMI Date : 12th of Every Month",
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: MyTheme.white,
            ),
          ),
          const Divider(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomText(
                text: "Last Paid bill: 22/05/2024",
                color: MyTheme.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              viewButton(),
            ],
          )
        ],
      ),
    );
  }
}
