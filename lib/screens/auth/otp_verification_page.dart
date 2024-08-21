import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../customs/custom_button.dart';
import 'authentication_success_page.dart';

class VerificationOtpPage extends StatefulWidget {
  const VerificationOtpPage({super.key});

  @override
  State<VerificationOtpPage> createState() => _VerificationOtpPageState();
}

class _VerificationOtpPageState extends State<VerificationOtpPage> {
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: '',
          titleColor: Colors.black,
          automaticallyImplyLeading: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 40, right: 60, left: 60),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        CustomText(
                          text: "Verification Code",
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          CustomText(
                            text:
                                "We have sent the verification\ncode to your email address",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            maxLines: 2,
                            color: MyTheme.textfield_grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: OTPTextField(
                            keyboardType: TextInputType.number,
                            controller:
                                Get.find<AuthController>().otpController,
                            length: 4,
                            fieldStyle: FieldStyle.box,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldWidth: 50,
                            outlineBorderRadius: 15,
                            style: const TextStyle(fontSize: 16),
                            onChanged: (String otp) {},
                            onCompleted: Get.find<AuthController>().setOTP),
                      ),
                    ),
                    GetBuilder<AuthController>(builder: (controller) {
                      return CustomButton(
                        text: "Verify OTP",
                        loading: controller.loadingState,
                        onTap: () {
                          if (args != null && args['signInWithPhone'] == true) {
                            controller.signInWithPhone(args['phone']);
                          } else {
                            controller.verifyEmail();
                          }
                        },
                      );
                    })
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
