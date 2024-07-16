import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/screens/loan/widget/loan_detail_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class LoanDetailsScreen extends StatelessWidget {
  const LoanDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "Loan For You",
      ),
      body: GetBuilder<LoanController>(builder: (loanController) {
        return Stack(
          children: [
            Column(
              children: [
                uiWidget(),
              ],
            ),
            const Positioned(
                left: 0, right: 0, top: 130, child: LoanDetailCard()),
          ],
        );
      }),
    );
  }
}
