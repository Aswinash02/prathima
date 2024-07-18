import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Transaction",
        titleColor: MyTheme.blackColor,
        centerTitle: true,
      ),
    );
  }
}
