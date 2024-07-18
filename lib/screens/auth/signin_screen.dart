import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/input_decorations.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';

import 'otp_verification_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          GetBuilder<AuthController>(builder: (authController) {
            return SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 40, bottom: 40),
                      child: Image(
                        image: AssetImage(
                          "assets/login_main_image.png",
                        ),
                        height: 250,
                        width: 210,
                      ),
                    ),
                    const Row(
                      children: [
                        CustomText(
                          text: "OTP Verification",
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
                                "Enter email and phone number to\nsend one time Password",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            maxLines: 2,
                            color: MyTheme.textfield_grey,
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 4.0, top: 40),
                          child: Text(
                            "Mail Id",
                            style: TextStyle(
                                color: MyTheme.accent_color,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        height: 36,
                        child: TextField(
                          controller: authController.emailController,
                          autofocus: false,
                          decoration: InputDecorations.buildInputDecoration_1(
                              hint_text: "Enter Email"),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z0-9@._-]')),
                            // Allow letters, digits, '@', '.', '_', and '-'
                          ],
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            "Phone",
                            style: TextStyle(
                                color: MyTheme.accent_color,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        height: 36,
                        child: TextField(
                          controller: authController.phoneController,
                          autofocus: false,
                          decoration: InputDecorations.buildInputDecoration_1(
                              hint_text: "Enter Mobile No."),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            // Allow only digits
                          ],
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Continue",
                      // fontSize: 16,
                      onTap: () {
                        Get.toNamed(RouteHelper.verificationOtp);
                      },
                      // borderRadius: 20,
                      // horizontalPadding: 90,
                      // padding: 10,
                    )
                    // CustomButton(
                    //   text: 'Continue',
                    //   onPressed: () {
                    //     Get.toNamed(RouteHelper.verificationOtp);
                    //   },
                    //   textColor: Colors.white,
                    //   borderRadius: 12.0,
                    //   padding: 20.0,
                    //   horizontalPadding: 100,
                    //   fontSize: 18.0,
                    // ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
