import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';

class PersonalLoanDetailForm extends StatelessWidget {
  const PersonalLoanDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: "Loan Account number"),
          SizedBox(height: 4,),
          CustomTextField(readOnly: true,),
          SizedBox(height: 8),
          CustomText(text: "Name"),
          SizedBox(height: 4,),
          CustomTextField(readOnly: true,),
          SizedBox(height: 8),
          CustomText(text: "Pre Closing loan amount"),
          SizedBox(height: 4,),
          CustomTextField(readOnly: true,),
          SizedBox(height: 8),
          CustomText(text: "Interest rate"),
          SizedBox(height: 4,),
          CustomTextField(readOnly: true,),
          SizedBox(height: 8), CustomText(text: "Loan Tenure"),
          SizedBox(height: 4,),
          CustomTextField(readOnly: true,),
        ],
      ),
    );
  }
}
