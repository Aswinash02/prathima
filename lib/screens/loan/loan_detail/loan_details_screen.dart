import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/loan/loan_detail/widget/loan_detail_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class LoanDetailsScreen extends StatelessWidget {
  const LoanDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "Your Personal Loan Account",
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              uiWidget(),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Personal Loan",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: 4),
                              CustomText(
                                text: "upcoming Due",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        const Column(
                          children: [
                            CustomText(
                              text: "10/04/2024",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            CustomText(
                                text: "20,000",
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ],
                        ),
                        const Spacer(),
                        payButton(color: Colors.blue, text: "Pay")
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: CustomButton(
                  text: "Pre Close",
                  onTap: () {
                    Get.toNamed(RouteHelper.preClosingLoanAmountScreen);
                  },
                ),
              )
            ],
          ),
          const Positioned(
              left: 0,
              right: 0,
              top: 120,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: LoanDetailCard(),
              )),
        ],
      ),
    );
  }

  Widget payButton({required Color color, required String text}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: CustomText(
          text: text,
          color: Colors.white,
        ),
      ),
    );
  }
}
