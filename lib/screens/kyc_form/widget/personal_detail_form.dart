import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/doc_upload_container.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/custom_dropdown.dart';

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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]')),
              ],
              controller: kycController.nameController,
              readOnly: true,
              hintText: "Enter Name"),
          const SizedBox(height: 10),
          const CustomText(
            text: "Gender",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
              controller: kycController.genderController,
              readOnly: true,
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
            hintText: "Enter Date Of Birth",
            suffixIcon: const Icon(Icons.calendar_month),
            readOnly: true,
            // onTap: () {
            //   kycController.datePicker(context);
            // },
          ),
          const SizedBox(height: 10),
          const CustomText(
            text: "Address",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
            controller: kycController.addressController,
            readOnly: true,
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
          DropdownField(
              itemList: kycController.houseType,
              hintText: "Select Address",
              onChange: kycController.onChangeHouseType,
              value: kycController.selectedAddress),
          const SizedBox(
            height: 10,
          ),
          kycController.selectedAddress == "Rent House"
              ? const SizedBox()
              : DocUploadContainer(
                  textString: 'Upload Your Property tax receipt',
                  selectedFile: kycController.pickedTaxReceipt,
                  onTap: () {
                    kycController.pickFiles(PickedFile.taxReceipt);
                  },
                ),
          const SizedBox(height: 20),
          Center(
              child: CustomButton(
            text: "Next",
            onTap: () {
              kycController.onTapPersonalForm();
            },
          ))
        ],
      );
    });
  }
}
