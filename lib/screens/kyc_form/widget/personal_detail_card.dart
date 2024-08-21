import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/aadhar_detail_card.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/personal_detail_form.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/shimmer/kyc_shimmer.dart';

class PersonalDetailCard extends StatelessWidget {
  const PersonalDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          height: 550,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Personal Details",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "Please enter your bank account details with"
                        " which you are going to make payment for investment.",
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    maxLines: 3,
                    color: MyTheme.font_grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PersonalDetailForm()
                  // GetBuilder<KycController>(builder: (controller) {
                  //   return controller.kycDataLoadingState
                  //       ? const ShimmerListView()
                  //       : const PersonalDetailForm();
                  // }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
