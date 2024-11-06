import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/home_controller.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/home/widget/carousel_slider.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/home/widget/init_permission_dialog.dart';
import 'package:prathima_loan_app/screens/home/widget/loan_detail_container.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/shimmer/home_screen_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initCall();
    });
  }

  Future<void> initCall() async {

    // await Get.find<HomeController>().getInitialLoanAmount();
    await Get.find<LoanController>().getLoanType();
    // _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
    //   await Get.find<KycController>().getKycStatus();
    // });
    await Get.find<KycController>().getKycStatus();
  }



  Future<void> _onRefresh() async {
    Get.find<HomeController>().clearData();
    await initCall();
  }

  @override
  void dispose() {
    // TODO: implement deactivate
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "PRATHIMA FINANCE",
        titleColor: Colors.black,
        centerTitle: true,
      ),
      body: GetBuilder<LoanController>(builder: (controller) {
        return controller.homeLoadingState
            ? const HomeScreenShimmer()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: RefreshIndicator(
                  color: MyTheme.mainColor,
                  onRefresh: _onRefresh,
                  child: ListView(
                    children: [
                      const HomeCarouselSlider(),
                      const SizedBox(
                        height: 15,
                      ),
                      // GestureDetector(
                      //     onTap: () => Get.find<HomeController>().onTapLoanCard(),
                      //     child: const LoanCard()),
                      // const SizedBox(height: 10),
                      const CustomText(
                        text: "Loan",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 110,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:
                              GetBuilder<LoanController>(builder: (controller) {
                            return Row(
                                children: List.generate(
                                    controller.loanTypesList.length, (index) {
                              return loanDetailContainer(
                                loanType:
                                    controller.loanTypesList[index].name ?? '',
                                icon: 'assets/icon/credit_score_icon.png',
                                onTap: () =>
                                    controller.onTapLoanContainer(index),
                              );
                            })
                                // GestureDetector(
                                //   onTap: () {
                                //     Get.toNamed(RouteHelper.creditScoreScreen);
                                //   },
                                //   child: loanDetailContainer(
                                //     loanType: 'Credit\nScore',
                                //     icon: 'assets/icon/credit_score_icon.png',
                                //   ),
                                // ),
                                // loanDetailContainer(
                                //   loanType: 'Personal\nLoan',
                                //   icon: 'assets/icon/personal_loan_icon.png',
                                // ),
                                // loanDetailContainer(
                                //   loanType: 'Home\nLoan',
                                //   icon: 'assets/icon/home_loan_icon.png',
                                // ),
                                // loanDetailContainer(
                                //   loanType: 'Vehicle\nLoan',
                                //   icon: 'assets/icon/vehicle_loan_icon.png',
                                // ),
                                // loanDetailContainer(
                                //   loanType: 'Business\nLoan',
                                //   icon: 'assets/icon/business_loan_icon.png',
                                // ),
                                // ],
                                );
                          }),
                        ),
                      ),
                      // const SizedBox(height: 5),
                      // offerCard(),
                      // const SizedBox(height: 20),
                      // homePageLoanCard(),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
