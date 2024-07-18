import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:prathima_loan_app/screens/auth/signin_screen.dart';
import 'package:prathima_loan_app/screens/onboard/widget/page_view_model_widget.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionPage extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
        pages: [
          IntroductionScreenWidget().getPageViewModel("assets/img/intro_1.png",
              "Very fast Loan application process with less back and forth runnings and paperwork"),
          IntroductionScreenWidget().getPageViewModel("assets/img/intro_2.png",
              "Interest Fees between the range of 2.5% to 30% which depend on the loan amount"),
          IntroductionScreenWidget().getPageViewModel("assets/img/intro_3.png",
              "Loan App allows you easy access to loan up to the amount of 5 million naira"),
        ],
        onDone: () => _onIntroEnd(context),
        showSkipButton: true,
        dotsFlex: 0,
        nextFlex: 0,
        skip: const Text(
          'Skip',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: MyTheme.accent_color),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: MyTheme.accent_color,
        ),
        done: const Text(
          'Done',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: MyTheme.accent_color),
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeColor: MyTheme.accent_color,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }

  void _onIntroEnd(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('intro_seen', true);
    Get.off(() => const SignInScreen());
  }
}
