import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/aadhar_detail_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/bank_detail_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/kyc_success_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/loan_approved_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/personal_detail_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/custom_stepper.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/work_info_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class KycDetailScreen extends StatelessWidget {
  const KycDetailScreen({super.key});

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
            child: GetBuilder<KycController>(builder: (kycController) {
              return kycController.activeStep == 0
                  ? const PersonalDetailCard()
                  : kycController.activeStep == 1
                  ? const AadhaarDetailCard()
                  : kycController.activeStep == 2
                  ? const WorkInfoDetailCard()
                  : kycController.activeStep == 3 &&
                  kycController.isKycVerified == false
                  ? const BankDetailCard()
                  : kycController.isLoanApproved == false
                  ? const KycSuccessCard()
                  : const KycLoanApprovedCard();
            },),),
        ],
      ),
    );
  }
}
