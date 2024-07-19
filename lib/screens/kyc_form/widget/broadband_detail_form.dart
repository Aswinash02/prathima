import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/doc_upload_container.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class BroadBandDetailForm extends StatelessWidget {
  const BroadBandDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Recent Broadband bill",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text:
                "Please upload your Recent BoardBand Bill below for completing KYC.",
            fontSize: 13,
            fontWeight: FontWeight.w500,
            maxLines: 3,
            color: MyTheme.font_grey,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text: "BoardBand Bill Number",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.broadBandBillNumberController,
              hintText: "Enter BoardBand Bill Number"),
          const SizedBox(
            height: 10,
          ),
          DocUploadContainer(
            textString: 'Upload Broadband Bill photo',
            selectedFile: kycController.pickedBroadBandSlip,
            onTap: () {
              kycController.pickFiles(PickedFile.broadBandSlip);
            },
          ),
        ],
      );
    });
  }
}
