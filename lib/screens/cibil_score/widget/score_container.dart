import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

class ScoreContainer extends StatelessWidget {
  const ScoreContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(-5, -5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "What's impacting your score?",
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
          const SizedBox(
            height: 10,
          ),
          scoreCard(
              icon: "assets/icon/on_time_payment_icon.png",
              row1Key: "On-time Payments",
              row1Value: "95%",
              row2Key: "High Impact",
              row2Value: "Fair"),
          const Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Divider(),
          ),
          scoreCard(
              icon: "assets/icon/credit_age_icon.png",
              row1Key: "Credit Age",
              row1Value: "1 yr 11 mon",
              row2Key: "Medium Impact",
              row2Value: "Fair"),
          const Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Divider(),
          ),
          scoreCard(
              icon: "assets/icon/credit_mix_icon.png",
              row1Key: "Credit Mix",
              row1Value: "2",
              row2Key: "Low Impact",
              row2Value: "Average"),
          const Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Divider(),
          ),
          scoreCard(
              icon: "assets/icon/credit_enquiries.png",
              row1Key: "Credit Enquiries",
              row1Value: "0",
              row2Key: "Low Impact",
              row2Value: "Excellent"),
        ],
      ),
    );
  }

  Widget scoreCard({
    required String icon,
    required String row1Key,
    required String row1Value,
    required String row2Key,
    required String row2Value,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          CustomIcon(
            icon: icon,
            height: 25,
            width: 25,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Row(
                          children: [
                            CustomText(
                              text: row1Key,
                              fontWeight: FontWeight.w800,
                            ),
                            const Spacer(),
                            CustomText(text: row1Value),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Row(
                          children: [
                            CustomText(
                              text: row2Key,
                              fontSize: 12,
                              color: MyTheme.font_grey,
                            ),
                            const Spacer(),
                            CustomText(
                              text: row2Value,
                              fontSize: 12,
                              color: color ?? Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
