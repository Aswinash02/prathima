import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/loan/widget/loan_card.dart';
import 'package:prathima_loan_app/screens/loan/widget/toggle_switch.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/shimmer/loan_card_shimmer.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key, this.index});

  final int? index;

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCall();
  }

  Future<void> initCall() async {
    if (widget.index == null) {
      Get.find<LoanController>().onChangeIndex(0);
    }
    await Get.find<LoanController>().getAllLoan(
        widget.index ?? Get.find<LoanController>().loanTypesList[0 + 1].id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Loan",
        titleColor: MyTheme.blackColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            toggleSwitch(),
            Expanded(
              child: GetBuilder<LoanController>(builder: (controller) {
                return controller.getLoanLoadingState
                    ? const LoanCardShimmer()
                    : controller.loanList.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 250,
                                  width: 200,
                                  child: Image.asset(
                                      "assets/img/no_data_found_image.png"),
                                ),
                                const CustomText(
                                  text: "No Loan Found",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                )
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: ListView.builder(
                                itemCount: controller.loanList.length,
                                itemBuilder: (context, index) {
                                  final data = controller.loanList[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: LoanCard(
                                      data: data,
                                    ),
                                  );
                                }),
                          );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
