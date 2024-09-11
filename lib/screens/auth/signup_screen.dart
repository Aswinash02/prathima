import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/input_decorations.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
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
      appBar: const CustomAppBar(
        title: '',
        titleColor: MyTheme.blackColor,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          GetBuilder<AuthController>(builder: (authController) {
            return SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 30,right: 30),
                child: Stack(
                  children: [
                    // Positioned(
                    //   top: 20,
                    //   left: 0,
                    //   child: GestureDetector(
                    //     onTap: () => Get.back(),
                    //     child: const SizedBox(
                    //       height: 40,
                    //       width: 40,
                    //       child: Icon(Icons.arrow_back),
                    //     ),
                    //   ),
                    // ),
                    Column(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only( bottom: 40),
                          child: Stack(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/login_main_image.png",
                                ),
                                height: 250,
                                width: 210,
                              ),
                            ],
                          ),
                        ),
                        const CustomText(
                          text: "Register",
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // const Padding(
                        //   padding: EdgeInsets.only(top: 10.0),
                        //   child: Row(
                        //     children: [
                        //       CustomText(
                        //         text:
                        //             "Enter email and phone number to\nsend one time Password",
                        //         fontWeight: FontWeight.w700,
                        //         fontSize: 18,
                        //         maxLines: 2,
                        //         color: MyTheme.textfield_grey,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                "Name",
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
                              controller: authController.signUpNameCon,
                              autofocus: false,
                              decoration:
                                  InputDecorations.buildInputDecoration_1(
                                      hint_text: "John Doe"),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z\s]')),
                                // Allow only letters and spaces
                              ],
                            ),
                          ),
                        ),
                        // const Row(
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsets.only(bottom: 4.0, top: 4.0),
                        //       child: Text(
                        //         "Mail Id",
                        //         style: TextStyle(
                        //             color: MyTheme.mainColor,
                        //             fontWeight: FontWeight.w600),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 8.0),
                        //   child: SizedBox(
                        //     height: 36,
                        //     child: TextField(
                        //       controller: authController.signUpEmailCon,
                        //       autofocus: false,
                        //       decoration:
                        //           InputDecorations.buildInputDecoration_1(
                        //               hint_text: "Enter Email"),
                        //       inputFormatters: [
                        //         FilteringTextInputFormatter.allow(
                        //             RegExp(r'[a-zA-Z0-9@._-]')),
                        //         // Allow letters, digits, '@', '.', '_', and '-'
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                "Phone",
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
                              controller: authController.signUpPhoneCon,
                              autofocus: false,
                              decoration:
                                  InputDecorations.buildInputDecoration_1(
                                      hint_text: "Enter Mobile No."),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                        // const Row(
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsets.only(bottom: 4.0),
                        //       child: Text(
                        //         "Password",
                        //         style: TextStyle(
                        //             color: MyTheme.mainColor,
                        //             fontWeight: FontWeight.w600),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 8.0),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.end,
                        //     children: [
                        //       SizedBox(
                        //         height: 36,
                        //         child: TextField(
                        //           controller: authController.signUpPasswordCon,
                        //           autofocus: false,
                        //           obscureText: !authController.showPassword,
                        //           enableSuggestions: false,
                        //           autocorrect: false,
                        //           decoration:
                        //               InputDecorations.buildInputDecoration_1(
                        //                       hint_text: "• • • • • • • •")
                        //                   .copyWith(
                        //                       suffixIcon: InkWell(
                        //             onTap: () {
                        //               authController.showPassword =
                        //                   !authController.showPassword;
                        //               setState(() {});
                        //             },
                        //             child: Icon(
                        //               authController.showPassword
                        //                   ? Icons.visibility_off_outlined
                        //                   : Icons.visibility_outlined,
                        //               color: MyTheme.mainColor,
                        //               size: 15,
                        //             ),
                        //           )),
                        //         ),
                        //       ),
                        //       const Text(
                        //         "Password Must Contain atleast 8 Characters",
                        //         style: TextStyle(
                        //             color: MyTheme.textfield_grey,
                        //             fontStyle: FontStyle.italic),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // const Row(
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsets.only(bottom: 4.0),
                        //       child: Text(
                        //         "Confirm Password",
                        //         style: TextStyle(
                        //             color: MyTheme.mainColor,
                        //             fontWeight: FontWeight.w600),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 8.0),
                        //   child: SizedBox(
                        //     height: 36,
                        //     child: TextField(
                        //       controller:
                        //           authController.signUpPasswordConfirmCon,
                        //       autofocus: false,
                        //       obscureText: !authController.showConfirmPassword,
                        //       enableSuggestions: false,
                        //       autocorrect: false,
                        //       decoration:
                        //           InputDecorations.buildInputDecoration_1(
                        //                   hint_text: "• • • • • • • •")
                        //               .copyWith(
                        //                   suffixIcon: InkWell(
                        //         onTap: () {
                        //           authController.showConfirmPassword =
                        //               !authController.showConfirmPassword;
                        //           setState(() {});
                        //         },
                        //         child: Icon(
                        //           authController.showConfirmPassword
                        //               ? Icons.visibility_off_outlined
                        //               : Icons.visibility_outlined,
                        //           color: MyTheme.mainColor,
                        //           size: 15,
                        //         ),
                        //       )),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (controller) {
                          return CustomButton(
                            text: "Sign Up",
                            loading: controller.loadingState,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              authController.register();
                            },
                          );
                        })
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
