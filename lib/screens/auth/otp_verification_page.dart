import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: '',
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 40, bottom: 40, right: 60, left: 60),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: "Verification Code",
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
                      padding: const EdgeInsets.only(top: 30,bottom: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: OTPTextField(
                          keyboardType: TextInputType.number,
                          // controller: _verificationController,
                          length: 4,
                          fieldStyle: FieldStyle.box,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          // Adjust based on space
                          fieldWidth: 50,
                          // Adjust fieldWidth dynamically
                          outlineBorderRadius: 15,
                          style: TextStyle(fontSize: 16),
                          onChanged: (pin) {
                            print("Changed: " + pin);
                          },
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                            setState(() {
                              // otpPin = pin;
                            });
                          },
                        ),
                      ),
                    ),
                    CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        // Define what happens when the button is pressed
                        print('Button Pressed');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthSuccessPage()));
                      },
                      textColor: Colors.white,
                      borderRadius: 12.0,
                      padding: 20.0,
                      horizontalPadding: 80,
                      fontSize: 18.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
