import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/loan_verification/widget/due_detail_cart.dart';
import 'package:prathima_loan_app/screens/loan_verification/widget/loan_detail_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class LoanDetailsForm extends StatelessWidget {
  const LoanDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "Loan For You",
      ),
      body: GetBuilder<LoanController>(builder: (loanController) {
        return GetBuilder<KycController>(builder: (kycController) {
          return Stack(
            children: [
              Column(
                children: [
                  uiWidget(),
                ],
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 130,
                  child: kycController.isLoanApproved
                      ? const DueDetailCard()
                      : const LoanDetailCard()),
            ],
          );
        });
      }),
    );
  }
}
