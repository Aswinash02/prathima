import 'package:flutter/material.dart';
import 'package:prathima_loan_app/screens/cibil_score/widget/meter_widget.dart';
import 'package:prathima_loan_app/screens/cibil_score/widget/score_container.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class CreditScoreScreen extends StatelessWidget {
  const CreditScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Credit Score",
        titleColor: MyTheme.blackColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            MeterWidget(),
            SizedBox(height: 40),
            ScoreContainer(),
          ],
        ),
      ),
    );
  }
}
