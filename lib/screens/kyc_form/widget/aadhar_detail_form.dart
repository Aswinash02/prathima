import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/doc_upload_container.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class AadhaarDetailForm extends StatelessWidget {
  const AadhaarDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Aadhaar Card ",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text:
                "Please upload your Aadhaar card below for completing your KYC.",
            fontSize: 13,
            fontWeight: FontWeight.w500,
            maxLines: 3,
            color: MyTheme.font_grey,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text: "Aadhaar Card Number",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
            controller: kycController.aadhaarNumberController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(12)
            ],
            hintText: "Enter Aadhaar Number",
            onChanged: kycController.aadhaarOnChange,
            keyboardType: TextInputType.number,
            suffixIcon: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: kycController.loadingState
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : kycController.aadhaarVerified
                          ? Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          kycController.isEnableOTP
              ? Wrap(
                  children: [
                    const CustomText(
                      text: "Enter OTP",
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 2),
                      child: CustomTextField(
                        controller: kycController.aadhaarNumberOTPController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6)
                        ],
                        hintText: "Enter OTP",
                        onChanged: kycController.aadhaarOTPOnChange,
                        keyboardType: TextInputType.number,
                        suffixIcon: kycController.otpLoadingState
                            ? const Wrap(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: MyTheme.mainColor,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          DocUploadContainer(
            textString: 'Upload aadhaar card Front photo ',
            selectedFile: kycController.pickedAadhaarCard,
            onTap: () {
              kycController.pickFiles(PickedFile.aadhaarCard);
            },
          ),
        ],
      );
    });
  }
}
