import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/screens/loan_approved/widget/loan_approved_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class LoanApprovedScreen extends StatelessWidget {
  const LoanApprovedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "Loan Approved",
      ),
      body: Stack(
        children: [
          Column(
            children: [
              uiWidget(),
            ],
          ),
          Positioned(left: 0, right: 0, top: 130, child: LoanApprovedCard()),
        ],
      ),
    );
  }
}
