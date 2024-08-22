import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/kyc_failure_card.dart';
import 'package:prathima_loan_app/screens/loan_verification/widget/due_detail_cart.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/loan_Amount_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/shimmer/card_shimmer.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class LoanDetailsForm extends StatefulWidget {
  const LoanDetailsForm({super.key});

  @override
  State<LoanDetailsForm> createState() => _LoanDetailsFormState();
}

class _LoanDetailsFormState extends State<LoanDetailsForm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCall();
  }

  Future<void> initCall() async {
    await Get.find<LoanController>().getApprovedLoanData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.find<LoanController>().calledDispose();
    super.dispose();
  }

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
            Positioned(
                left: 0,
                right: 0,
                top: 130,
                child: loanController.loadingState
                    ? const CardShimmer()
                    : const DueDetailCard()),
          ],
        );
      }),
    );
  }
}
