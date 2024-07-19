import 'package:flutter/material.dart';
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
            text: "Please upload your PAN card below for completing your  KYC.",
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
            // onChanged: (String value) {
            //   kycController.panNumberController.text = value;
            // },
          ),
          const SizedBox(
            height: 10,
          ),
          DocUploadContainer(
            textString: 'Upload PAN card Front photo',
            selectedFile: kycController.pickedPanCard,
            onTap: () {
              kycController.pickFiles(PickedFile.panCard);
            },
          ),
        ],
      );
    });
  }
}
