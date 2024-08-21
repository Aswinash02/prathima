import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            hintText: "Enter Account Number",
            onChanged: kycController.onChangeBankDetails,
          ),
          const SizedBox(height: 10),
          const CustomText(
            text: "IFSC Code",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
            controller: kycController.ifscController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
            ],
            hintText: "Enter IFSC Code",
            onChanged: kycController.onChangeBankDetails,
          ),
          const SizedBox(height: 10),
          const CustomText(
            text: "Account Holder Name",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.accountHolderNameController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]')),
              ],
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
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]')),
            ],
            hintText: "Enter Bank Name",
          ),
          const SizedBox(height: 20),
          DocUploadContainer(
            textString: "Upload your Bank Pass book ",
            selectedFile: kycController.pickedPfPassBook,
            onTap: () {
              kycController.pickFiles(PickedFile.pfPassBook);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<KycController>(builder: (controller) {
            return Center(
                child: CustomButton(
              text: controller.isUpdateKyc ? "Update" : "Submit",
              loading: controller.kycLoadingState,
              onTap:
              // controller.kycLoadingState
              //     ? null
              //     :

                  () {
                      if (controller.isUpdateKyc) {
                        kycController.onSubmitUpdateKycForm();
                      } else {
                        kycController.onSubmitKycForm();
                      }
                    },
            ));
          })
        ],
      );
    });
  }
}
