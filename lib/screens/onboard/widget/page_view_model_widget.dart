import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class IntroductionScreenWidget {
  PageViewModel getPageViewModel(String imagePath, String text) {
    return PageViewModel(
      title: "",
      body: text,
      image: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
      decoration: const PageDecoration(
          contentMargin: EdgeInsets.symmetric(horizontal: 16),
          fullScreen: true,
          bodyFlex: 2,
          imageFlex: 3,
          safeArea: 100,
          bodyTextStyle: TextStyle(
              color: MyTheme.white, fontSize: 22, fontWeight: FontWeight.w400)),
    );
  }
}
