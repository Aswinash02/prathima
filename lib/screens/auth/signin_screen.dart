import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/input_decorations.dart';
import 'package:prathima_loan_app/utils/colors.dart';

import 'otp_verification_page.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 40),
                    child: Image(
                      image: AssetImage(
                        "assets/login_main_image.png",
                      ),
                      height: 250,
                      width: 210,
                    ),
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "OTP Verification",
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0, top: 40),
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
                    child: Container(
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
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
                    child: Container(
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
                  CustomButton(
                    text: 'Continue',
                    onPressed: () {
                      // Define what happens when the button is pressed
                      print('Button Pressed');
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationOtpPage()));
                    },
                    textColor: Colors.white,
                    borderRadius: 12.0,
                    padding: 20.0,
                    horizontalPadding: 100,
                    fontSize: 18.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
