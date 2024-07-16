import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/aadhar_detail_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/bank_detail_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/kyc_success_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/loan_approved_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/personal_detail_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/custom_stepper.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/work_info_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class PersonalDetailScreen extends StatelessWidget {
  const PersonalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "KYC Verification",
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              uiWidget(),
            ],
          ),
          const CustomStepper(),
          Positioned(
              left: 0,
              right: 0,
              top: 130,
              child:
                  // LoanApprovedCard()
                  // KycSuccessCard()
                  //
                  GetBuilder<KycController>(builder: (kycController) {
                return kycController.activeStep == 0
                    ? PersonalDetailCard()
                    : kycController.activeStep == 1
                        ? AadhaarDetailCard()
                        : kycController.activeStep == 2
                            ? WorkInfoDetailCard()
                            : BankDetailCard();
              })
              // AadhaarDetailCard()
              // PersonalDetailCard()
              ),
        ],
      ),
    );
  }
}
