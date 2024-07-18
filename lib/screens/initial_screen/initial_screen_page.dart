import 'package:flutter/material.dart';
import 'package:prathima_loan_app/screens/auth/signin_screen.dart';
import 'package:prathima_loan_app/screens/onboard/on_board_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkIntroSeen(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data == true) {
          return const SignInScreen();
        } else {
          return IntroductionPage();
        }
      },
    );
  }

  Future<bool> _checkIntroSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('intro_seen') ?? false;
  }
}