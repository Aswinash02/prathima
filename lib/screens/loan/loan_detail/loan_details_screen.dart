import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/kyc_success_card.dart';
import 'package:prathima_loan_app/screens/loan/loan_detail/widget/loan_detail_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/shimmer/kyc_shimmer.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class LoanDetailsScreen extends StatefulWidget {
  final int id;

  const LoanDetailsScreen({super.key, required this.id});

  @override
  State<LoanDetailsScreen> createState() => _LoanDetailsScreenState();
}

class _LoanDetailsScreenState extends State<LoanDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCall();
  }

  Future<void> initCall() async {
    await Get.find<LoanController>().getLoanDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "Loan Detail",
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
              child: GetBuilder<LoanController>(builder: (controller) {
                return controller.loanDetailLoadingState
                    ? const KYCShimmerCard()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                            height: 550,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30.0, horizontal: 20),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomText(
                                      text: "Select your loan amount",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    GetBuilder<LoanController>(
                                        builder: (controller) {
                                      return SliderTheme(
                                          data:
                                              SliderTheme.of(context).copyWith(
                                            trackHeight: 12.0,
                                            thumbShape:
                                                const RoundSliderThumbShape(
                                                    enabledThumbRadius: 12.0),
                                            overlayShape:
                                                const RoundSliderOverlayShape(
                                                    overlayRadius: 24.0),
                                            activeTrackColor: MyTheme.mainColor,
                                            inactiveTrackColor: MyTheme
                                                .mainColor
                                                .withOpacity(0.3),
                                          ),
                                          child: Slider(
                                            value: controller
                                                    .loanAmountSliderValue ??
                                                0.0,
                                            min: controller.loanDetailDataList
                                                .first.minimumAmount!
                                                .toDouble(),
                                            max: controller.loanDetailDataList
                                                .first.maximumAmount!
                                                .toDouble(),
                                            divisions: ((controller
                                                            .loanDetailDataList
                                                            .first
                                                            .maximumAmount! -
                                                        controller
                                                            .loanDetailDataList
                                                            .first
                                                            .minimumAmount!) /
                                                    500)
                                                .round(),
                                            activeColor: MyTheme.mainColor,
                                            label: controller
                                                .loanAmountSliderValue!
                                                .round()
                                                .toString(),
                                            onChanged: (double value) {
                                              controller
                                                  .onChangeLoanAmountSlider(
                                                      (value / 500).round() *
                                                          500);
                                            },
                                          ));
                                    }),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CustomText(
                                              text: "Start",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: MyTheme.font_grey,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            CustomText(
                                              text:
                                                  "₹ ${controller.loanDetailDataList.first.minimumAmount}",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: MyTheme.font_grey,
                                            )
                                          ],
                                        ),
                                        GetBuilder<LoanController>(
                                            builder: (controller) {
                                          return CustomText(
                                            text:
                                                "₹ ${controller.loanAmountSliderValue!.toInt()}",
                                          );
                                        }),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const CustomText(
                                              text: "Limit",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: MyTheme.font_grey,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            CustomText(
                                              text:
                                                  "₹ ${controller.loanDetailDataList.first.maximumAmount}",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: MyTheme.font_grey,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const CustomText(
                                      text: "Life of Loan",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: SizedBox(
                                          height: 120,
                                          child: GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisSpacing: 8,
                                                      mainAxisSpacing: 8,
                                                      crossAxisCount: 3,
                                                      childAspectRatio: 2.0),
                                              itemCount: controller
                                                  .loanDetailDataList
                                                  .first
                                                  .loanTenure!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                final data = controller
                                                    .loanDetailDataList
                                                    .first
                                                    .loanTenure![index];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: MyTheme
                                                              .mainColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: Center(
                                                    child: CustomText(
                                                      text:
                                                          "${data.value} ${data.type}",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                );
                                              })),
                                    ),
                                    rowValue(
                                        title: 'Interest Rate',
                                        value:
                                            '₹ ${controller.loanDetailDataList.first.interestRate}'),
                                    rowValue(
                                        title: 'Processing Fee',
                                        value:
                                            '₹ ${controller.loanDetailDataList.first.processingFee}'),
                                    rowValue(
                                        title: 'Other Fee',
                                        value:
                                            '₹ ${controller.loanDetailDataList.first.otherFee}'),
                                    const SizedBox(height: 20),
                                    Center(
                                        child: CustomButton(
                                      text: "Apply",
                                      loading: controller.checkLoanLoadingState,
                                      onTap: () =>
                                          controller.checkLoanExistOrNot(),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              })), // const Positioned(
          //     left: 0,
          //     right: 0,
          //     top: 120,
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 15.0),
          //       child: LoanDetailCard(),
          //     )),
        ],
      ),
    );
    //   Scaffold(
    //   appBar: const CustomAppBar(
    //     backgroundColor: MyTheme.mainColor,
    //     title: "Your Personal Loan Account",
    //   ),
    //   body: Stack(
    //     children: [
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: [
    //           uiWidget(),
    //           const SizedBox(
    //             height: 70,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 15.0),
    //             child: Column(
    //               children: [
    //                 Row(
    //                   children: [
    //                     const SizedBox(
    //                       width: 180,
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           CustomText(
    //                             text: "Personal Loan",
    //                             fontSize: 15,
    //                             fontWeight: FontWeight.w600,
    //                           ),
    //                           SizedBox(height: 4),
    //                           CustomText(
    //                             text: "upcoming Due",
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400,
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     const Column(
    //                       children: [
    //                         CustomText(
    //                           text: "10/04/2024",
    //                           fontWeight: FontWeight.w500,
    //                           fontSize: 12,
    //                         ),
    //                         CustomText(
    //                             text: "20,000",
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 12),
    //                       ],
    //                     ),
    //                     const Spacer(),
    //                     payButton(color: Colors.blue, text: "Pay")
    //                   ],
    //                 ),
    //                 const Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 20.0),
    //                   child: Divider(),
    //                 )
    //               ],
    //             ),
    //           ),
    //           const Spacer(),
    //           Padding(
    //             padding: EdgeInsets.all(15.0),
    //             child: CustomButton(
    //               text: "Pre Close",
    //               onTap: () {
    //                 Get.toNamed(RouteHelper.preClosingLoanAmountScreen);
    //               },
    //             ),
    //           )
    //         ],
    //       ),
    //       const Positioned(
    //           left: 0,
    //           right: 0,
    //           top: 120,
    //           child: Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 15.0),
    //             child: LoanDetailCard(),
    //           )),
    //     ],
    //   ),
    // );
  }

  Widget rowValue({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          CustomText(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const Spacer(),
          CustomText(
            text: value,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ],
      ),
    );
  }
}
