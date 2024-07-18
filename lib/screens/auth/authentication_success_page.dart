import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/customs/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';



class AuthSuccessPage extends StatefulWidget {
  const AuthSuccessPage({super.key});

  @override
  State<AuthSuccessPage> createState() => _AuthSuccessPageState();
}

class _AuthSuccessPageState extends State<AuthSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: '',
          titleColor: Colors.black,
          automaticallyImplyLeading: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(
                        "assets/success_icon.png",
                      ),
                      height: 106,
                      width: 106,
                    ),
                    const CustomText(
                      text: "Success!",
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: CustomText(
                            text:
                                "Congratulations! You have been\n    successfully authenticated",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            maxLines: 2,
                            color: MyTheme.textfield_grey,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child:  CustomButton(
                        text: "Continue",
                        // fontSize: 16,
                        onTap: () {
                          Get.offAllNamed(RouteHelper.home);
                        },
                        // borderRadius: 20,
                        // horizontalPadding: 90,
                        // padding: 10,
                      )
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
