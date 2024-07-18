import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';

class PersonalDetailForm extends StatelessWidget {
  const PersonalDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Account number",
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        SizedBox(
          height: 2,
        ),
        CustomTextField(
          hintText: "Account Number",
          readOnly: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomText(
          text: "IFSC Code",
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        SizedBox(
          height: 2,
        ),
        CustomTextField(
          hintText: "IFSC Code",
          readOnly: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomText(
          text: "First name",
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        SizedBox(
          height: 2,
        ),
        CustomTextField(
          hintText: "First name",
          readOnly: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomText(
          text: "Last name",
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        SizedBox(
          height: 2,
        ),
        CustomTextField(
          hintText: "Last name",
          readOnly: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomText(
          text: "Date of birth",
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        SizedBox(
          height: 2,
        ),
        CustomTextField(
          hintText: "Date of birth",
          readOnly: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomText(
          text: "Email Address",
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        SizedBox(
          height: 2,
        ),
        CustomTextField(
          hintText: "Email Address",
          readOnly: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomText(
          text: "Pan-Card",
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        SizedBox(
          height: 2,
        ),
        CustomTextField(
          hintText: "Pan-Card",
          readOnly: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomText(
          text: "Aadhar-Card",
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        SizedBox(
          height: 2,
        ),
        CustomTextField(
          hintText: "Aadhar-Card",
          readOnly: true,
        ),
        SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
