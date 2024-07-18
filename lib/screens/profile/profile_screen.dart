import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/profile/widget/profile_card.dart';
import 'package:prathima_loan_app/screens/profile/widget/profile_option.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profile',
        titleColor: MyTheme.blackColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              const ProfileCard(),
              const SizedBox(
                height: 20,
              ),
              ProfileOption(
                option: "Loan History",
                icon: "assets/icon/person_circle_icon.png",
                onTap: () {},
              ),
              ProfileOption(
                option: "About Us",
                icon: "assets/icon/about_as_icon.png",
                onTap: () {
                  Get.toNamed(RouteHelper.aboutUsScreen);
                },
              ),
              ProfileOption(
                option: "Help &  Support",
                icon: "assets/icon/help_and_support_icon.png",
                onTap: () {},
              ),
              ProfileOption(
                option: "Terms and Condition",
                icon: "assets/icon/privacy_icon.png",
                onTap: () {
                  Get.toNamed(RouteHelper.termsAndConditionScreen);
                },
              ),
              ProfileOption(
                option: "Contact Us",
                icon: "assets/icon/contact_us_icon.png",
                onTap: () {},
              ),
              ProfileOption(
                option: "Privacy Policy",
                icon: "assets/icon/privacy_icon.png",
                onTap: () {
                  Get.toNamed(RouteHelper.privacyPolicyScreen);
                },
              ),
              ProfileOption(
                option: "Sign out",
                icon: "assets/icon/log_out_icon.png",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
