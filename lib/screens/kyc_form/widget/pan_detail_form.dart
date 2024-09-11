import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/doc_upload_container.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class PanDetailForm extends StatelessWidget {
  const PanDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Pan Card ",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text:
                "Please verify your Pan Number And upload your PAN card below for completing your  KYC.",
            fontSize: 13,
            fontWeight: FontWeight.w500,
            maxLines: 3,
            color: MyTheme.font_grey,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text: "PAN Card Number",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
            controller: kycController.panNumberController,
            hintText: "Enter PAN Card Number",
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
              LengthLimitingTextInputFormatter(10)
            ],
            onChanged: kycController.onChangePan,
            suffixIcon: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: kycController.panLoadingState
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : kycController.isPanVerified
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
          !kycController.isPanVerified &&
                  kycController.panNumberController.text.length == 10 &&
                  !kycController.panLoadingState
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () => kycController.panVerify(),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: CustomText(
                        text: "resend",
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: MyTheme.mainColor,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            height: 10,
          ),
          kycController.isPanVerified
              ? DocUploadContainer(
                  textString: 'Upload PAN card Front photo',
                  selectedFile: kycController.pickedPanCard,
                  onTap: () {
                    kycController.pickFiles(PickedFile.panCard);
                  },
                )
              : const SizedBox(),
        ],
      );
    });
  }
}
