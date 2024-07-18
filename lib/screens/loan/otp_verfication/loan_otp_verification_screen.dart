import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/ui_widget.dart';

class LoanOTPVerificationScreen extends StatelessWidget {
  const LoanOTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: MyTheme.mainColor,
        title: "Enter OTP",
      ),
      body: GetBuilder<LoanController>(builder: (loanController) {
        return GetBuilder<KycController>(builder: (kycController) {
          return Stack(
            children: [
              ListView(
                children: [
                  uiWidget(),
                  SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: OTPTextField(
                      keyboardType: TextInputType.number,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      length: 4,
                      fieldStyle: FieldStyle.box,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 50,
                      outlineBorderRadius: 15,
                      style: const TextStyle(fontSize: 16),
                      onChanged: (pin) {
                        print("Changed: $pin");
                      },
                      onCompleted: (pin) {
                        print("Completed: $pin");
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomButton(
                      text: "Confirm",
                      onTap: () {
                        Get.offAllNamed(RouteHelper.preCloseLoanSuccessScreen);
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 20,
                right: 0,
                top: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomText(
                      text: "Verification Code",
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: MyTheme.white,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: "We have sent the verification",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: MyTheme.white,
                    ),
                    CustomText(
                      text: "code to your email address",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: MyTheme.white,
                    ),
                  ],
                ),
              ),
            ],
          );
        });
      }),
    );
  }
}
