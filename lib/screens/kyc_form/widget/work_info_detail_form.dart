import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/doc_upload_container.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/upolad_payslip_container.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class WorkInfoDetailForm extends StatelessWidget {
  const WorkInfoDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Employment Type",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.employmentTypeController,
              hintText: "Enter Position"),
          const SizedBox(height: 10),
          const CustomText(
            text: "Company Name",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.companyNameController,
              hintText: "Enter Company Name"),
          const SizedBox(height: 10),
          const CustomText(
            text: "Company Email ID",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.companyEmailController,
              hintText: "Enter Company Email ID"),
          const SizedBox(height: 10),
          const CustomText(
            text: "Company Location",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
            controller: kycController.companyLocationController,
            hintText: "Enter Company Location",
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          const CustomText(
            text: "PaySlip",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text: "Upload Past 3 month Payslip ",
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: MyTheme.font_grey,
          ),
          const SizedBox(
            height: 10,
          ),
          UploadPaySlipContainer(
            textString: 'Upload Your Past 3 month Payslip',
            onTapMonth1: () {
              kycController.pickFiles(PickedFile.paySlipMonth1);
            },
            onTapMonth2: () {
              kycController.pickFiles(PickedFile.paySlipMonth2);
            },
            onTapMonth3: () {
              kycController.pickFiles(PickedFile.paySlipMonth3);
            },
            selectedPaySlip1: kycController.pickedPaySlipMonth1,
            selectedPaySlip2: kycController.pickedPaySlipMonth2,
            selectedPaySlip3: kycController.pickedPaySlipMonth3,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            text: "Upload ID Card",
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: MyTheme.font_grey,
          ),
          const SizedBox(
            height: 10,
          ),
          DocUploadContainer(
            textString: "Upload Your ID Card",
            selectedFile: kycController.pickedIdCard,
            onTap: () {
              kycController.pickFiles(PickedFile.idCard);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: CustomButton(
            text: "Submit",
            onTap: () {
              kycController.onStepReached(3);
            },
          ))
        ],
      );
    });
  }
}
