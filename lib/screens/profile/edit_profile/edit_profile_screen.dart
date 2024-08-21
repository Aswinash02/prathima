import 'package:flutter/material.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/profile/edit_profile/widget/edit_profile_form.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyTheme.mainColor,
      appBar: CustomAppBar(
        title: "Personal Details",
        titleColor: MyTheme.white,
        backgroundColor: MyTheme.mainColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          EditProfileForm(),
        ],
      ),
    );
  }
}
