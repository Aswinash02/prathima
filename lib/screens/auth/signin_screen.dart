import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/input_decorations.dart';
import 'package:prathima_loan_app/data/model/phone_number_model.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/auth/widget/phone_number_dialog.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCall();
  }

  Future<void> initCall() async {
    await Get.find<AuthController>().getSimInfo();
  }

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
                    const CustomText(
                      text: "Login",
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 10.0),
                    //   child: Row(
                    //     children: [
                    //       CustomText(
                    //         text:
                    //         "Enter email and phone number to\nsend one time Password",
                    //         fontWeight: FontWeight.w700,
                    //         fontSize: 18,
                    //         maxLines: 2,
                    //         color: MyTheme.textfield_grey,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Wrap(
                      children: [
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 4.0, top: 40),
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
                              onChanged: (String str) {
                                if (str.length == 10) {
                                  FocusScope.of(context).unfocus();
                                }
                              },
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
                    ),
                    // controller.signInWithOTP
                    //     ? Wrap(
                    //         children: [
                    //           const Row(
                    //             children: [
                    //               Padding(
                    //                 padding:
                    //                     EdgeInsets.only(bottom: 4.0, top: 40),
                    //                 child: Text(
                    //                   "Phone Number",
                    //                   style: TextStyle(
                    //                       color: MyTheme.mainColor,
                    //                       fontWeight: FontWeight.w600),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(bottom: 8.0),
                    //             child: SizedBox(
                    //               height: 36,
                    //               child: TextField(
                    //                 controller: controller.signInPhoneCon,
                    //                 autofocus: false,
                    //                 onChanged: (String str) {
                    //                   if (str.length == 10) {
                    //                     FocusScope.of(context).unfocus();
                    //                   }
                    //                 },
                    //                 keyboardType: TextInputType.number,
                    //                 decoration:
                    //                     InputDecorations.buildInputDecoration_1(
                    //                         hint_text: "Enter Phone Number"),
                    //                 inputFormatters: [
                    //                   LengthLimitingTextInputFormatter(10),
                    //                   FilteringTextInputFormatter.digitsOnly,
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     : Wrap(
                    //         children: [
                    //           const Row(
                    //             children: [
                    //               Padding(
                    //                 padding:
                    //                     EdgeInsets.only(bottom: 4.0, top: 40),
                    //                 child: Text(
                    //                   "Mail Id",
                    //                   style: TextStyle(
                    //                       color: MyTheme.mainColor,
                    //                       fontWeight: FontWeight.w600),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(bottom: 8.0),
                    //             child: SizedBox(
                    //               height: 36,
                    //               child: TextField(
                    //                 controller: controller.signInEmailCon,
                    //                 autofocus: false,
                    //                 decoration:
                    //                     InputDecorations.buildInputDecoration_1(
                    //                         hint_text: "Enter Email"),
                    //                 inputFormatters: [
                    //                   FilteringTextInputFormatter.allow(
                    //                       RegExp(r'[a-zA-Z0-9@._-]')),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //           const Row(
                    //             children: [
                    //               Padding(
                    //                 padding: EdgeInsets.only(bottom: 4.0),
                    //                 child: Text(
                    //                   "Password",
                    //                   style: TextStyle(
                    //                       color: MyTheme.mainColor,
                    //                       fontWeight: FontWeight.w600),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(bottom: 8.0),
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.end,
                    //               children: [
                    //                 SizedBox(
                    //                   height: 36,
                    //                   child: TextField(
                    //                     controller:
                    //                         controller.signInPasswordCon,
                    //                     autofocus: false,
                    //                     obscureText: !controller.showPassword,
                    //                     enableSuggestions: false,
                    //                     autocorrect: false,
                    //                     decoration: InputDecorations
                    //                             .buildInputDecoration_1(
                    //                                 hint_text:
                    //                                     "• • • • • • • •")
                    //                         .copyWith(
                    //                             suffixIcon: InkWell(
                    //                       onTap: () {
                    //                         controller.showPassword =
                    //                             !controller.showPassword;
                    //                         setState(() {});
                    //                       },
                    //                       child: Icon(
                    //                         controller.showPassword
                    //                             ? Icons.visibility_off_outlined
                    //                             : Icons.visibility_outlined,
                    //                         color: MyTheme.mainColor,
                    //                         size: 15,
                    //                       ),
                    //                     )),
                    //                   ),
                    //                 ),
                    //                 const Text(
                    //                   "Password Must Contain atleast 8 Characters",
                    //                   style: TextStyle(
                    //                       color: MyTheme.textfield_grey,
                    //                       fontStyle: FontStyle.italic),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    // Align(
                    //     alignment: Alignment.centerRight,
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         controller.onChangeSignInMethod();
                    //       },
                    //       child: CustomText(
                    //         text: controller.signInWithOTP
                    //             ? "SignIn With Email"
                    //             : "SignIn With OTP",
                    //         color: MyTheme.mainColor,
                    //       ),
                    //     )),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AuthController>(builder: (controller) {
                      return CustomButton(
                        // text: controller.signInWithOTP ? "Send OTP" : "Sign In",
                        text: "Send OTP",
                        loading: controller.loadingState,
                        onTap: () {
                          controller.sendOtp();
                          // if (controller.signInWithOTP) {
                          //   controller.sendOtp();
                          // } else {
                          //   controller.login();
                          // }
                        },
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                            child: Text(
                          "Don't have an account?",
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
                          onTap: () => Get.toNamed(RouteHelper.signUp),
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
