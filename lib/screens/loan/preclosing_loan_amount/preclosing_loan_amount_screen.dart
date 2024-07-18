import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/loan/preclosing_loan_amount/widget/payment_method_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class PreClosingLoanAmountScreen extends StatelessWidget {
  const PreClosingLoanAmountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "PreClosing Loan Amount",
      ),
      body: Stack(
        children: [
          Column(
            children: [
              uiWidget(),
              const SizedBox(
                height: 60,
              ),
              paymentMode(
                  mode: "Debit", value: 'Debit'),
              const SizedBox(
                height: 20,
              ),
              paymentMode(
                  mode: "Credit", value: 'Credit'),
              const SizedBox(
                height: 20,
              ),
              paymentMode(mode: "Net Banking", value: "Net Banking"),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: GetBuilder<LoanController>(builder: (controller) {
                  return CustomButton(
                    text: "Proceed",
                    color: controller.selectedMode == ''
                        ? MyTheme.font_grey
                        : MyTheme.mainColor,
                    onTap: controller.selectedMode == ''
                        ? null
                        : () {
                      print('controller.selectedMode ${controller.selectedMode}');
                            Get.toNamed(RouteHelper.getCreditOrDebitCardFormRoute(controller.selectedMode));
                          },
                  );
                }),
              ),
            ],
          ),
          const Positioned(
            left: 20,
            top: 70,
            child: CustomText(
              text: "Make A Payment",
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: MyTheme.white,
            ),
          ),
          const Positioned(
              left: 0, right: 0, top: 130, child: PaymentMethodCard()),
        ],
      ),
    );
  }

  Widget paymentMode({required String mode, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GetBuilder<LoanController>(builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.onChangeMode(value);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: Row(
                  children: [
                    CustomText(text: mode),
                    const Spacer(),
                    Radio<String>(
                        value: value,
                        onChanged: controller.onChangeMode,
                        groupValue: controller.selectedMode,
                        activeColor: MyTheme.mainColor)
                  ],
                )),
          ),
        );
      }),
    );
  }
}
