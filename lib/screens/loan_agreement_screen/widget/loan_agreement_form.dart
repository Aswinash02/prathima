import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class LoanAgreementForm extends StatelessWidget {
  const LoanAgreementForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
          text: "Schedule",
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(
          height: 15,
        ),
        loanAgreementTextFieldRow(
            text: 'Loan Agreement No', controller: TextEditingController()),
        const SizedBox(
          height: 10,
        ),
        loanAgreementTextFieldRow(
            text: 'Agreement Date', controller: TextEditingController()),
        const SizedBox(
          height: 10,
        ),
        loanAgreementTextFieldRow(
            text: 'Name and Address of the Lender',
            controller: TextEditingController()),
        const SizedBox(
          height: 10,
        ),
        loanAgreementTextFieldRow(
            text: 'Name and Address of the Borrower',
            controller: TextEditingController()),
        const SizedBox(
          height: 10,
        ),
        loanAgreementTextFieldRow(
            text: 'Nature of Business/ Occupation',
            controller: TextEditingController()),
        const SizedBox(
          height: 10,
        ),
        loanAgreementTextFieldRow(
            text: 'Purpose of Loan', controller: TextEditingController()),
        const SizedBox(
          height: 10,
        ),
        loanAgreementTextFieldRow(
            text: 'Loan Amount', controller: TextEditingController()),
        const SizedBox(
          height: 10,
        ),
        loanAgreementTextFieldRow(
            text: 'Annualized / Effective Rate of Interest',
            controller: TextEditingController()),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const CustomText(
              text: "Tenure : ",
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              width: 80,
              height: 20,
              child: CustomTextField(
                controller: TextEditingController(),
              ),
            ),
            const CustomText(
              text: " / Month",
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            const CustomText(
              text: "EMI Payable : Monthly",
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ],
        )
      ],
    );
  }

  Widget loanAgreementTextFieldRow(
      {required String text, required TextEditingController controller}) {
    return Row(
      children: [
        CustomText(
          text: text,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        CustomTextField(),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.keyboardType,
      this.readOnly,
      this.hintTextColor,
      this.inputFormatters,
      this.maxLines,
      this.onChanged,
      this.suffixIcon,
      this.hintFontSize,
      this.onTap});

  final TextEditingController? controller;
  final String? hintText;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final double? hintFontSize;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 25,
      child: TextField(
        controller: controller,
        inputFormatters: inputFormatters,
        readOnly: readOnly ?? false,
        cursorColor: MyTheme.grey_153,
        keyboardType: keyboardType ?? TextInputType.text,
        maxLines: maxLines ?? 1,
        textAlign: TextAlign.left,
        onTap: onTap,
        cursorHeight: 20,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
              color: hintTextColor ?? MyTheme.grey_153, fontSize: hintFontSize),
          contentPadding: const EdgeInsets.only(
            bottom: 6,
            top: -10,
            left: 5,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
