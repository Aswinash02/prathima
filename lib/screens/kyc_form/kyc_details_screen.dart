import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/aadhar_detail_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/bank_detail_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/kyc_failure_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/kyc_submit_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/kyc_success_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/personal_detail_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/custom_stepper.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/work_info_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/shimmer/kyc_shimmer.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class KycVerificationScreen extends StatefulWidget {
  const KycVerificationScreen({super.key});

  @override
  State<KycVerificationScreen> createState() => _KycVerificationScreenState();
}

class _KycVerificationScreenState extends State<KycVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "KYC Verification",
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Get.find<KycController>().setAmount == true
                  ? Get.find<KycController>().onPressedBack()
                  : Get.back();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              uiWidget(),
            ],
          ),
          GetBuilder<KycController>(builder: (controller) {
            return controller.kycDataLoadingState
                // ||
                //     controller.setAmount == false
                ? const SizedBox()
                : controller.kycStatus?.status == 0 ||
                        (controller.kycStatus?.status == 2 &&
                            controller.isUpdateKyc)
                    ? const CustomStepper()
                    : const SizedBox();
          }),
          Positioned(
            left: 0,
            right: 0,
            top: 130,
            child: GetBuilder<KycController>(
              builder: (controller) {
                return controller.kycDataLoadingState
                    ? const KYCShimmerCard()
                    :
                controller.kycStatus?.status == 0 ||
                            (controller.kycStatus?.status == 2 &&
                                controller.isUpdateKyc)
                        ?
                        // controller.setAmount == false
                        //             ? const LoanAmountCard()
                        //             :
                        controller.activeStep == 0
                            ? const AadhaarDetailCard()
                            : controller.activeStep == 1
                                ? const PersonalDetailCard()
                                : controller.activeStep == 2
                                    ? const WorkInfoDetailCard()
                                    : const BankDetailCard()
                        : controller.kycStatus?.status == 1
                            ? const KycSubmitCard()
                            : controller.kycStatus?.status == 2
                                ? const KycFailureCard()
                                : const KycSuccessCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
