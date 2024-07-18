import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/home/widget/home_appbar.dart';
import 'package:prathima_loan_app/screens/home/widget/loan_detail_container.dart';
import 'package:prathima_loan_app/screens/home/widget/offer_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.loanDetailsForm),
                  child: Image(image: AssetImage("assets/img/loan_card.png"))),
              const SizedBox(height: 10),
              const CustomText(
                text: "Loan Details",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  loanDetailContainer(
                      loanType: 'Personal Loan',
                      icon: 'assets/icon/personal_loan_icon.png'),
                  loanDetailContainer(
                      loanType: 'Home Loan',
                      icon: 'assets/icon/home_loan_icon.png'),
                  loanDetailContainer(
                      loanType: 'Vehicle Loan',
                      icon: 'assets/icon/vehicle_loan_icon.png'),
                  loanDetailContainer(
                      loanType: 'Business Loan',
                      icon: 'assets/icon/business_loan_icon.png'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              offerCard(),
            ],
          ),
        ),
      ),
    );
  }
}
