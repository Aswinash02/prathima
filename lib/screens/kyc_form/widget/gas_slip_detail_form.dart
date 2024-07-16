import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/doc_upload_container.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class GasDetailForm extends StatelessWidget {
  const GasDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Recent Gas slip",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 20,
          ),
          CustomText(
            text:
                "Please upload your Recent Gas slip below for completing  KYC.",
            fontSize: 13,
            fontWeight: FontWeight.w500,
            maxLines: 3,
            color: MyTheme.font_grey,
          ),
          SizedBox(
            height: 20,
          ),
          const CustomText(
            text: "Recent Gas slip",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.gasSlipNumberController,
              hintText: "Enter Gas Slip Number"),
          SizedBox(
            height: 10,
          ),
          DocUploadContainer(
            textString: 'Upload Recent Gas Slip photo',
            onTap: () {},
          ),
        ],
      );
    });
  }
}
