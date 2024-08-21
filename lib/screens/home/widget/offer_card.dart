import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';

Widget offerCard() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
            height: 146,
            color: Colors.white,
            child: Image(image: AssetImage("assets/img/offer_card.png"))),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              CustomText(
                text: "View",
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(width: 5),
              CustomText(
                text: "loan Center",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
              SizedBox(width: 5),
              CustomText(
                text: "and about New offers",
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
