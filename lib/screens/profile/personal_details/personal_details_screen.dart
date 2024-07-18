import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/screens/profile/personal_details/widget/personal_detail_form.dart';
import 'package:prathima_loan_app/screens/profile/widget/profile_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "Personal Details",
        titleColor: MyTheme.blackColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileCard(),
              SizedBox(height: 20,),
              PersonalDetailForm()],
          ),
        ),
      ),
    );
  }
}
