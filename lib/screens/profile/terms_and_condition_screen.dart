import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/screens/profile/widget/profile_text_row.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Terms And Condition",
        titleColor: MyTheme.blackColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
        child: Column(
          children: [
            profileTextRow(
                text:
                    "Minim: 20 USD and up to 50% of the average last two month of salary."),
            const SizedBox(
              height: 4,
            ),
            profileTextRow(
                text:
                    "The duration of loan repayment is eligible for 1 month only."),
            const SizedBox(
              height: 4,
            ),
            profileTextRow(text: "Interest Rate will be 1.5% per month"),
            const SizedBox(
              height: 4,
            ),
            profileTextRow(text: "General Terms and conditions apply."),
            const SizedBox(
              height: 4,
            ),
            profileTextRow(
                text:
                    "Minim: 20 USD and up to 50% of the average last two month of salary."),
            const SizedBox(
              height: 4,
            ),
            profileTextRow(text: "Interest Rate will be 1.5% per month"),
            const SizedBox(
              height: 4,
            ),
            profileTextRow(text: "General Terms and conditions apply."),
            const SizedBox(
              height: 4,
            ),
            profileTextRow(
                text:
                    "Minim: 20 USD and up to 50% of the average last two month of salary."),
            const SizedBox(
              height: 4,
            ),
            profileTextRow(
                text:
                    "The duration of loan repayment is eligible for 1 month only."),
            const SizedBox(
              height: 4,
            ),
            profileTextRow(text: "Interest Rate will be 1.5% per month"),
          ],
        ),
      ),
    );
  }
}
