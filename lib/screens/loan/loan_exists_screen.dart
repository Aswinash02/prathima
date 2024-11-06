import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class LoanExistsScreen extends StatelessWidget {
  const LoanExistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed(RouteHelper.initial);
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: MyTheme.mainColor,
          title: "Loan Exists",
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: () => Get.toNamed(RouteHelper.initial),
              child: const Icon(Icons.arrow_back)),
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                uiWidget(),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 130,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 550,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          text: 'Already you have applied for a loan'),
                      const SizedBox(height: 40),
                      Center(
                          child: CustomButton(
                        text: "Back to Home",

                        onTap: () => Get.toNamed(RouteHelper.initial),
                        // controller.checkLoanExistOrNot(),
                      )),
                    ],
                  ),
                ),
              ),
            ), // const Positioned(
          ],
        ),
      ),
    );
  }
}
