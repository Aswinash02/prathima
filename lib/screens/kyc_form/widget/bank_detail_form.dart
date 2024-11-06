import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/doc_upload_container.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class BankDetailForm extends StatelessWidget {
  const BankDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Account Number",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
            controller: kycController.accountNumberController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            hintText: "Enter Account Number",
            suffixIcon: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: kycController.bankLoadingState
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : kycController.bankVerified
                          ? Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox(),
                ),
              ],
            ),
            onChanged: kycController.onChangeBankDetails,
          ),
          const SizedBox(height: 10),
          const CustomText(
            text: "IFSC Code",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          const SizedBox(height: 2),
          CustomTextField(
            controller: kycController.ifscController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
            ],
            hintText: "Enter IFSC Code",
            onChanged: kycController.onChangeBankDetails,
          ),
          const SizedBox(height: 10),
          kycController.bankVerified
              ? const SizedBox()
              : Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () async {
                          await kycController.bankVerify();
                        },
                        child: const CustomText(
                          text: "Verify",
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: MyTheme.mainColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 350,
                    )
                  ],
                ),
          kycController.bankVerified
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Account Holder Name",
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    const SizedBox(height: 2),
                    CustomTextField(
                        controller: kycController.accountHolderNameController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-z A-Z]')),
                        ],
                        readOnly: true,
                        hintText: "Enter Account Holder Name"),
                    const SizedBox(height: 10),
                    const CustomText(
                      text: "Bank Name",
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    const SizedBox(height: 2),
                    CustomTextField(
                      controller: kycController.bankNameController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]')),
                      ],
                      readOnly: true,
                      hintText: "Enter Bank Name",
                    ),
                    const SizedBox(height: 20),
                    DocUploadContainer(
                      textString: "Upload your Bank Pass book ",
                      selectedFile: kycController.pickedPfPassBook,
                      onTap: () {
                        kycController.pickFiles(PickedFile.pfPassBook);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: "Please sign",
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () =>
                              Get.toNamed(RouteHelper.promissoryLetter),
                          child: const CustomText(
                            text: "Promissory Letter",
                            decoration: TextDecoration.underline,
                            color: MyTheme.mainColor,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const CustomText(
                          text: "to confirm",
                        ),
                      ],
                    ),
                    const CustomText(
                      text: "your agreement",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    kycController.agreements != null
                        ? CustomText(
                            text:
                                "The amount of Rs.${kycController.agreements!.data![4].value} in processing fees. "
                                "If the loan is granted, the money will be returned.",
                            maxLines: 4,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<KycController>(builder: (controller) {
                      return Center(
                          child: CustomButton(
                        text: controller.isUpdateKyc
                            ? "Update"
                            : "PayNow & Submit",
                        loading: controller.kycLoadingState,
                        onTap: controller.kycLoadingState
                            ? null
                            : () {
                                kycController.kycAmountPaidStatus();
                                // if (controller.isUpdateKyc) {
                                //
                                //   kycController.onSubmitUpdateKycForm();
                                // } else {
                                //   kycController.kycAmountPaidStatus();
                                // }
                              },
                      ));
                    })
                  ],
                )
              : const SizedBox(),
        ],
      );
    });
  }
}
