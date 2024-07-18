import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/input_decorations.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                          text: "Register Page",
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
                                "Enter email and phone number to send one time Password",
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
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            "Name",
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
                          controller: authController.nameController,
                          autofocus: false,
                          decoration: InputDecorations.buildInputDecoration_1(
                              hint_text: "John Doe"),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z\s]')),
                            // Allow only letters and spaces
                          ],
                        ),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: MyTheme.accent_color,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 36,
                            child: TextField(
                              controller: authController.passwordController,
                              autofocus: false,
                              obscureText: !authController.showPassword,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration:
                                  InputDecorations.buildInputDecoration_1(
                                          hint_text: "• • • • • • • •")
                                      .copyWith(
                                          suffixIcon: InkWell(
                                onTap: () {
                                  authController.showPassword =
                                      !authController.showPassword;
                                  setState(() {});
                                },
                                child: Icon(
                                  authController.showPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: MyTheme.accent_color,
                                ),
                              )),
                            ),
                          ),
                          Text(
                            "Password Must Contain atleast 6 Characters",
                            style: TextStyle(
                                color: MyTheme.textfield_grey,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                            color: MyTheme.accent_color,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: 36,
                        child: TextField(
                          controller: authController.passwordConfirmController,
                          autofocus: false,
                          obscureText: !authController.showConfirmPassword,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecorations.buildInputDecoration_1(
                                  hint_text: "• • • • • • • •")
                              .copyWith(
                                  suffixIcon: InkWell(
                            onTap: () {
                              authController.showConfirmPassword =
                                  !authController.showConfirmPassword;
                              setState(() {});
                            },
                            child: Icon(
                              authController.showConfirmPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: MyTheme.accent_color,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Continue",
                      onTap: () {
                        Get.toNamed(RouteHelper.verificationOtp);
                      },
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
