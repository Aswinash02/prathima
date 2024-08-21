import 'package:flutter/material.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Prathima Finance",
          style: TextStyle(fontSize: 20, color: MyTheme.mainColor),
        ),
      ),
    );
  }
}
