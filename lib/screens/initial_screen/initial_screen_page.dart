import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/controllers/network_controller.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/auth/signin_screen.dart';
import 'package:prathima_loan_app/screens/home/home_screen.dart';
import 'package:prathima_loan_app/screens/main_screen.dart';
import 'package:prathima_loan_app/screens/onboard/on_board_screen.dart';
import 'package:prathima_loan_app/screens/splash_screen.dart';
import 'package:prathima_loan_app/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Future<bool>? _introSeenFuture;
  bool? _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _introSeenFuture = _checkIntroSeen();
    ever(Get.find<ConnectivityService>().connectivityStatus, (result) {
      if (result == ConnectivityResult.none) {
        Get.offAllNamed(RouteHelper.noInternetScreen);
      } else {
        Get.offAllNamed(RouteHelper.introductionScreen);
      }
    });
  }

  Future<bool> _checkIntroSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('intro_seen') ?? false;
  }

  Future<void> _checkLoginStatus() async {
    bool isLoggedIn = await SharedPreference().getLogin();
    if (isLoggedIn == true) {
      await Get.find<KycController>().getKycStatus();
    }
    if (mounted) {
      setState(() {
        _isLoggedIn = isLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _introSeenFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else if (snapshot.data == true) {
          if (_isLoggedIn == null) {
            _checkLoginStatus();
            return const SplashScreen();
          } else if (_isLoggedIn == true) {
            return const MainScreen();
            // if (Get.find<KycController>().kycStatus != null &&
            //     Get.find<KycController>().kycStatus!.status != 0) {
            //   return const MainScreen();
            // } else {
            //   return const HomeScreen();
            // }
          } else {
            return const SignInScreen();
          }
        } else {
          return IntroductionPage();
        }
      },
    );
  }
}
