import 'package:flutter/material.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/loan/widget/loan_card.dart';
import 'package:prathima_loan_app/screens/loan/widget/toggle_switch.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Loan",
        titleColor: MyTheme.blackColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            toggleSwitch(),
            SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: LoanCard(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
