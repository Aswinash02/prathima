import 'package:flutter/material.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Contact Us",
        titleColor: MyTheme.blackColor,
      ),
    );
  }
}
