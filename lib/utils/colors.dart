import 'package:flutter/material.dart';

class MyTheme {
  /*configurable colors stars*/
  static const Color accent_color = Color(0xFF409CFF);
  static const Color mainColor = Color(0xFF000078);

  static const Color white = Color.fromRGBO(255, 255, 255, 1);

  static const Color grey_153 = Color.fromRGBO(153, 153, 153, 1);

  static const Color font_grey = Color.fromRGBO(107, 115, 119, 1);
  static const Color textfield_grey = Color.fromRGBO(209, 209, 209, 1);

  static Color color1 = Color(0xFFDBE0FF); // DBE0FF
  static Color color2 = Color(0xFFA3AFFF); // A3AFFF
  static Color loanCardGradientColor1 = Color(0xFFAFECFF);
  static Color loanCardGradientColor2 = Color(0xFF13AAFF);
  static Color searchBarColor = Color(0xFFF4F6F6);

  static Color mixedColor = Color.lerp(color1, color2, 0.5)!;

  static const Color blackColor = Colors.black;


  static LinearGradient buildLinearGradientLoanCard() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [MyTheme.loanCardGradientColor1, MyTheme.loanCardGradientColor2],
    );
  }
}
