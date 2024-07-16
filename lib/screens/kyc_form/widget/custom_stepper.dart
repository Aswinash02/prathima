import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
                height: 80,
                child: EasyStepper(
                    activeStep: kycController.activeStep,
                    lineStyle: const LineStyle(
                      lineType: LineType.normal,
                      lineSpace: 0,
                      lineLength: 50,
                      finishedLineColor: Colors.black,
                      defaultLineColor: Colors.grey,
                    ),
                    activeStepTextColor: Colors.black87,
                    finishedStepTextColor: Colors.black87,
                    internalPadding: 0,
                    showLoadingAnimation: false,
                    stepRadius: 16,
                    showStepBorder: false,
                    steps: [
                      EasyStep(
                        customStep: Container(
                          decoration: BoxDecoration(
                            color: kycController.activeStep >= 0
                                ? Colors.black
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: kycController.activeStep >= 0
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        customTitle: CustomText(
                          text: 'Personal Details',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          color: kycController.activeStep >= 0
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      EasyStep(
                        customStep: Container(
                          decoration: BoxDecoration(
                            color: kycController.activeStep >= 1
                                ? Colors.black
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: kycController.activeStep >= 1
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        customTitle: CustomText(
                          text: 'Aadhar Details',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          color: kycController.activeStep >= 1
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      EasyStep(
                        customStep: Container(
                          decoration: BoxDecoration(
                            color: kycController.activeStep >= 2
                                ? Colors.black
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: kycController.activeStep >= 2
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        customTitle: CustomText(
                          text: 'Work Details',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          color: kycController.activeStep >= 2
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      EasyStep(
                        customStep: Container(
                          decoration: BoxDecoration(
                            color: kycController.activeStep >= 3
                                ? Colors.black
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: kycController.activeStep >= 3
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        customTitle: CustomText(
                          text: 'Bank Details',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          color: kycController.activeStep >= 3
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                    onStepReached: kycController.onStepReached)),
          ),
        ],
      );
    });
  }
}
