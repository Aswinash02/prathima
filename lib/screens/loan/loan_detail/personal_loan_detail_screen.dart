import 'package:flutter/material.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/screens/loan/loan_detail/widget/personal_loan_card.dart';
import 'package:prathima_loan_app/screens/loan/loan_detail/widget/personal_loan_detail_form.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class PersonalLoanDetailScreen extends StatelessWidget {
  const PersonalLoanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Personal Loan Details",
        titleColor: MyTheme.white,
        backgroundColor: MyTheme.mainColor,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              uiWidget(),
              const SizedBox(
                height: 10,
              ),
              const PersonalLoanDetailForm(),
              // const Spacer(),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
              //   child: CustomButton(text: "Pre Close"),
              // ),
            ],
          ),
          const Positioned(
              left: 0,
              right: 0,
              top: 90,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: PersonalLoanCard(),
              )),
        ],
      ),
    );
  }
}
