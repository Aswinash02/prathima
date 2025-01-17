import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';

class LoanApprovedCard extends StatelessWidget {
  const LoanApprovedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
              children: [
                const Image(image: AssetImage("assets/img/success_img.png")),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "congratulations",
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
                const SizedBox(
                  height: 40,
                ),
                const CustomText(
                  text:
                      "Thanks for submitting your document we’ll verify it and Credit Your Loan Amount "
                      "After Physical Verification Done Which Done With in 24 Hours",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<KycController>(builder: (kycController) {
                  return Center(
                      child: CustomButton(
                    text: "Back to home",
                    onTap: () {
                      Get.offAllNamed(RouteHelper.initial);
                    },
                  ));
                }),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
