import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/doc_upload_container.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/house_type_dropdown.dart';

class PersonalDetailForm extends StatelessWidget {
  const PersonalDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Name",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.nameController, hintText: "Enter Name"),
          const SizedBox(height: 10),
          const CustomText(
            text: "Gender",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.genderController,
              hintText: "Enter Gender"),
          const SizedBox(height: 10),
          const CustomText(
            text: "Date of Birth",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.dobController,
              hintText: "Enter Date Of Birth"),
          const SizedBox(height: 10),
          const CustomText(
            text: "Address",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
            controller: kycController.dobController,
            hintText: "Enter Address",
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          const CustomText(
            text: "House Type",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          const HouseTypeDropdown(),
          const SizedBox(
            height: 10,
          ),
          DocUploadContainer(
            textString: 'Upload Your Property tax receipt',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          Center(
              child: CustomButton(
            text: "Submit",
            // fontSize: 16,
            onTap: () {
              kycController.onStepReached(1);
            },
            // borderRadius: 20,
            // horizontalPadding: 90,
            // padding: 10,
          ))
        ],
      );
    });
  }
}
