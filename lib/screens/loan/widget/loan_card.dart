import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/data/model/all_loan_model.dart';
import 'package:prathima_loan_app/screens/loan/widget/view_button.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class LoanCard extends StatelessWidget {
  const LoanCard({super.key, required this.data});

  final LoanData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: MyTheme.mainColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          CustomText(
            text: data.loanType ?? '',
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
                    text: "Minimum Amount",
                    fontSize: 15,
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
                      child: Center(
                        child: CustomText(
                          text: "₹ ${data.minimumAmount}",
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
                    text: "Maximum Amount",
                    fontSize: 15,
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
                      child: Center(
                        child: CustomText(
                          text: "₹ ${data.maximumAmount}",
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: MyTheme.white,
                        ),
                      )),
                ],
              )
            ],
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8.0),
          //   child: CustomText(
          //     text: "EMI Date : 12th of Every Month",
          //     fontWeight: FontWeight.w500,
          //     fontSize: 12,
          //     color: MyTheme.white,
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                text: "Interest Rate : ₹ ${data.interestRate}",
                color: MyTheme.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              viewButton(data.id!),
            ],
          )
        ],
      ),
    );
  }
}
