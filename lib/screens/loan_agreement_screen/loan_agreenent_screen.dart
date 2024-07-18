import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/screens/loan_agreement_screen/widget/loan_agreement_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class LoanAgreementScreen extends StatelessWidget {
  const LoanAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "Loan Agreement",
      ),
      body: Stack(
        children: [
          Column(
            children: [
              uiWidget(),
            ],
          ),
          const Positioned(
              left: 0,
              right: 0,
              top: 130,
              child: LoanAgreementCard()),
        ],
      ),
    );
  }
}
