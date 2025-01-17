import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/aadhar_detail_form.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/broadband_detail_form.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/driving_license_detail_form.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/gas_slip_detail_form.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/pan_detail_form.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/smart_card_detail_form.dart';

class AadhaarDetailCard extends StatelessWidget {
  const AadhaarDetailCard({super.key});

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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AadhaarDetailForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  const PanDetailForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SmartCardDetailForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  const DrivingLicenseDetailForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  const GasDetailForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  const BroadBandDetailForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(child:
                      GetBuilder<KycController>(builder: (kycController) {
                    return CustomButton(
                      text: "Next",
                      onTap: () {
                        kycController.onTapAadhaarForm();
                      },
                    );
                  })),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    text: "If you are facing any difficulties please get in",
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "touch with us on ",
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      GestureDetector(
                        onTap: () => Get.find<KycController>().onTapWhatsapp(),
                        child: const CustomText(
                          text: "Whatsapp",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
