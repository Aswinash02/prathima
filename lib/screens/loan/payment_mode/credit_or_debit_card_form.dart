import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class CreditOrDebitCardForm extends StatelessWidget {
  final String cardType;

  const CreditOrDebitCardForm({super.key, required this.cardType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "$cardType Card",
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              uiWidget(),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: creditOrDebitCardForm(),
              ),
              const Spacer(),
               Padding(
                padding: EdgeInsets.all(15.0),
                child: CustomButton(
                  text: "Proceed",
                  onTap: (){
                    Get.toNamed(RouteHelper.loanOTPVerificationScreen);
                  },
                ),
              ),
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 130,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Image(
                  image: AssetImage(cardType == "Credit"
                      ? "assets/img/credit_card.png"
                      : "assets/img/debit_card.png"),
                ),
              )),
        ],
      ),
    );
  }

  Widget creditOrDebitCardForm() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Card Number"),
        CustomTextField(),
        SizedBox(
          height: 6,
        ),
        CustomText(text: "Expire Date"),
        CustomTextField(),
        SizedBox(
          height: 6,
        ),
        CustomText(text: "CVV"),
        CustomTextField()
      ],
    );
  }
}
