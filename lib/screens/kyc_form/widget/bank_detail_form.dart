import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/doc_upload_container.dart';

class BankDetailForm extends StatelessWidget {
  const BankDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Account Number",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.accountNumberController,
              hintText: "Enter Account Number"),
          const SizedBox(height: 10),
          const CustomText(
            text: "IFSC Code",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.ifscController,
              hintText: "Enter IFSC Code"),
          const SizedBox(height: 10),
          const CustomText(
            text: "Account Holder Name",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.accountHolderNameController,
              hintText: "Enter Account Holder Name"),
          const SizedBox(height: 10),
          const CustomText(
            text: "Bank Name",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
            controller: kycController.bankNameController,
            hintText: "Enter Bank Name",
          ),
          const SizedBox(height: 20),
          DocUploadContainer(
            textString: "Upload your Pf member Pass book ",
            selectedFile: kycController.pickedPfPassBook,
            onTap: () {
              kycController.pickFiles(PickedFile.pfPassBook);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: CustomButton(
            text: "Submit",
            onTap: () {
              kycController.onSubmitKycForm();
            },
          ))
        ],
      );
    });
  }
}
