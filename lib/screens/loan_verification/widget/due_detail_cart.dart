import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/loan_verification/widget/change_detail_column.dart';
import 'package:prathima_loan_app/screens/loan_verification/widget/loan_period_card.dart';

import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

class DueDetailCard extends StatelessWidget {
  const DueDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GetBuilder<LoanController>(builder: (controller) {
        return Container(
          height: controller.selectedDueDate != null ? 550 : 420,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: GetBuilder<LoanController>(builder: (controller) {
                return controller.approvedLoanData!.status != false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: MyTheme.mainColor.withOpacity(0.1)),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: CustomIcon(
                                    icon: "assets/icon/briefcase.png",
                                    height: 30,
                                    width: 30,
                                    color: MyTheme.mainColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Amount you need from",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                  CustomText(
                                    text: "Prathima Finance",
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<LoanController>(builder: (controller) {
                            return Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomText(
                                      text: "Total Amount",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: MyTheme.font_grey,
                                    ),
                                    CustomText(
                                      text:
                                          "₹${controller.approvedLoanData!.loan!.approvedLoanAmount}",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                // const Spacer(),
                                // const Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     CustomText(
                                //       text: "Monthly Due",
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w400,
                                //       color: MyTheme.font_grey,
                                //     ),
                                //     CustomText(
                                //       text: "₹30000",
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.w600,
                                //     ),
                                //   ],
                                // )
                              ],
                            );
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 15,
                          ),
                          GetBuilder<LoanController>(builder: (controller) {
                            return controller.selectedDueDate == null
                                ? const SizedBox()
                                : Row(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CustomText(
                                              text: "Loan Term",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.font_grey,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.green,
                                                            shape: BoxShape
                                                                .circle),
                                                    child: const Icon(
                                                      Icons.arrow_upward,
                                                      size: 14,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  CustomText(
                                                    text: controller
                                                            .selectedDueDate!
                                                            .dueDate ??
                                                        '',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.green,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        height: 50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CustomText(
                                              text: "Interest Rate",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.font_grey,
                                            ),
                                            CustomText(
                                              text:
                                                  "${controller.selectedDueDate!.interestRate}%",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          const LoanPeriodCard(),
                          const SizedBox(height: 10),
                          controller.selectedDueDate == null
                              ? const SizedBox()
                              : changeDetailColumn(),
                          // GetBuilder<LoanController>(builder: (loanController) {
                          //   // print(
                          //   //     'loanController.isChangeDetail ${loanController.isChangeDetail}');
                          //   return LoanPeriodCard();
                          //   // loanController.isChangeDetail
                          //   //   ? changeDetailColumn()
                          //   //   : const LoanPeriodCard();
                          // }),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<LoanController>(builder: (loanController) {
                            return Center(
                                child: CustomButton(
                              text: "Proceed",
                              onTap: () {
                                loanController.dueProceed();
                              },
                            ));
                          })
                        ],
                      )
                    : Center(
                        child: CustomText(
                            text: controller.approvedLoanData!.message ?? ''),
                      );
              }),
            ),
          ),
        );
      }),
    );
  }
}
