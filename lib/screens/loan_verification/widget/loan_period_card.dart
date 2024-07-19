import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class LoanPeriodCard extends StatelessWidget {
  const LoanPeriodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Loan period",
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: MyTheme.font_grey,
            ),
            const CustomText(
                text: "5 Months", fontWeight: FontWeight.w600, fontSize: 18),
            GetBuilder<LoanController>(builder: (loanController) {
              return SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 12.0,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 24.0),
                  activeTrackColor: MyTheme.mainColor,
                  inactiveTrackColor: MyTheme.mainColor.withOpacity(0.3),
                ),
                child: Slider(
                    value: loanController.dueMonthSliderValue,
                    min: 2,
                    max: 5,
                    divisions: 100,
                    activeColor: MyTheme.mainColor,
                    label:
                        loanController.dueMonthSliderValue.round().toString(),
                    onChanged: loanController.onChangeDueMonthSlider),
              );
            }),
            const Row(
              children: [
                CustomText(
                  text: "2 Months",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: MyTheme.font_grey,
                ),
                Spacer(),
                CustomText(
                  text: "5 Months",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: MyTheme.font_grey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
