import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';

class KycFailureCard extends StatelessWidget {
  const KycFailureCard({super.key});

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
                const Image(image: AssetImage("assets/img/failure_img.png")),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "Kyc Failed",
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
                const SizedBox(
                  height: 40,
                ),
                GetBuilder<KycController>(builder: (controller) {
                  return CustomText(
                    text: controller.kycStatus!.reason ?? '',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    maxLines: 8,
                    textAlign: TextAlign.center,
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<KycController>(builder: (kycController) {
                  return Center(
                      child: CustomButton(
                    text: "Update Kyc",
                    onTap: () {
                      kycController.onTapUpdateKyc();
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
