import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/auth/widget/logout_dailog.dart';
import 'package:prathima_loan_app/screens/profile/widget/profile_card.dart';
import 'package:prathima_loan_app/screens/profile/widget/profile_option.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/shimmer/profile_shimmer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProfileController>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profile',
        titleColor: MyTheme.blackColor,
        centerTitle: true,
      ),
      body: GetBuilder<ProfileController>(builder: (controller) {
        return controller.loadingState
            ? const ProfileSimmer()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Column(
                    children: [
                      const ProfileCard(),
                      const SizedBox(
                        height: 20,
                      ),
                      ProfileOption(
                        option: "Loan History",
                        icon: "assets/icon/loan_history_icon.png",
                        onTap: () {
                          Get.toNamed(RouteHelper.loanHistoryScreen);
                        },
                      ),
                      ProfileOption(
                        option: "About Us",
                        icon: "assets/icon/about_us_icon.png",
                        onTap: () {
                          Get.toNamed(RouteHelper.aboutUsScreen);
                        },
                      ),
                      ProfileOption(
                        option: "Help &  Support",
                        icon: "assets/icon/help_and_support_icon.png",
                        onTap: () {
                          Get.toNamed(RouteHelper.helpAndSupportScreen);
                        },
                      ),
                      ProfileOption(
                        option: "Terms and Condition",
                        icon: "assets/icon/terms_and_condition_icon.png",
                        onTap: () {
                          Get.toNamed(RouteHelper.termsAndConditionScreen);
                        },
                      ),
                      ProfileOption(
                        option: "Contact Us",
                        icon: "assets/icon/contact_us_icon.png",
                        onTap: () {
                          Get.toNamed(RouteHelper.contactUsScreenScreen);
                        },
                      ),
                      ProfileOption(
                        option: "Privacy Policy",
                        icon: "assets/icon/privacy_and_policy_icon.png",
                        onTap: () {
                          Get.toNamed(RouteHelper.privacyPolicyScreen);
                        },
                      ),
                      ProfileOption(
                        option: "Log out",
                        icon: "assets/icon/logout_icon.png",
                        onTap: () {
                          showLogoutDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
