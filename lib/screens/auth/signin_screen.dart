import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/input_decorations.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/auth/signup_screen.dart';
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
          GetBuilder<AuthController>(builder: (controller) {
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
                    controller.signInWithOTP
                        ? Wrap(
                            children: [
                              const Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 4.0, top: 40),
                                    child: Text(
                                      "Phone Number",
                                      style: TextStyle(
                                          color: MyTheme.mainColor,
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
                                    controller: controller.signInPhoneCon,
                                    autofocus: false,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        InputDecorations.buildInputDecoration_1(
                                            hint_text: "Enter Phone Number"),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Wrap(
                            children: [
                              const Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 4.0, top: 40),
                                    child: Text(
                                      "Mail Id",
                                      style: TextStyle(
                                          color: MyTheme.mainColor,
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
                                    controller: controller.signInEmailCon,
                                    autofocus: false,
                                    decoration:
                                        InputDecorations.buildInputDecoration_1(
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
                                      "Password",
                                      style: TextStyle(
                                          color: MyTheme.mainColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 36,
                                      child: TextField(
                                        controller:
                                            controller.signInPasswordCon,
                                        autofocus: false,
                                        obscureText: !controller.showPassword,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        decoration: InputDecorations
                                                .buildInputDecoration_1(
                                                    hint_text:
                                                        "• • • • • • • •")
                                            .copyWith(
                                                suffixIcon: InkWell(
                                          onTap: () {
                                            controller.showPassword =
                                                !controller.showPassword;
                                            setState(() {});
                                          },
                                          child: Icon(
                                            controller.showPassword
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: MyTheme.mainColor,
                                            size: 15,
                                          ),
                                        )),
                                      ),
                                    ),
                                    const Text(
                                      "Password Must Contain atleast 8 Characters",
                                      style: TextStyle(
                                          color: MyTheme.textfield_grey,
                                          fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            controller.onChangeSignInMethod();
                          },
                          child: CustomText(
                            text: controller.signInWithOTP
                                ? "SignIn With Email"
                                : "SignIn With OTP",
                            color: MyTheme.mainColor,
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: controller.signInWithOTP ? "Send OTP" : "Sign In",
                      onTap: () {
                        if (controller.signInWithOTP) {
                          controller.sendOtp();
                        } else {
                          controller.login();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                            child: Text(
                          "Already Have an account?",
                          style:
                              TextStyle(color: MyTheme.font_grey, fontSize: 12),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: MyTheme.mainColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          onTap: () {
                            Get.toNamed(RouteHelper.signUp);
                          },
                        ),
                      ],
                    ),
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
