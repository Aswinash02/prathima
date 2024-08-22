import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class AuthSuccessScreen extends StatefulWidget {
  const AuthSuccessScreen({super.key});

  @override
  State<AuthSuccessScreen> createState() => _AuthSuccessPageState();
}

class _AuthSuccessPageState extends State<AuthSuccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCall();
  }

  Future<void> initCall() async {
    await Get.find<KycController>().getKycStatus();
  }

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
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomButton(
                        text: "Continue",
                        onTap: () {
                          if (Get.find<KycController>().kycStatus!.status !=
                              0) {
                            Get.offAllNamed(RouteHelper.initial);
                          } else {
                            Get.offAllNamed(RouteHelper.home);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
