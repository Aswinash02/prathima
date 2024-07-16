import 'package:get/get.dart';
import 'package:prathima_loan_app/screens/auth/authentication_success_page.dart';
import 'package:prathima_loan_app/screens/auth/otp_verification_page.dart';
import 'package:prathima_loan_app/screens/auth/signin_screen.dart';
import 'package:prathima_loan_app/screens/home/home_page.dart';
import 'package:prathima_loan_app/screens/kyc_form/personal_details_screen.dart';
import 'package:prathima_loan_app/screens/loan/loan_details_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String authSuccess = '/authSuccess';
  static const String verificationOtp = '/verificationOtp';
  static const String home = '/home';
  static const String personalDetail = '/personalDetail';
  static const String loanDetailsScreen = '/loanDetailsScreen';
  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SignInScreen()),
    GetPage(name: verificationOtp, page: () => const VerificationOtpPage()),
    GetPage(name: authSuccess, page: () => const AuthSuccessPage()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: loanDetailsScreen, page: () => const LoanDetailsScreen()),
    GetPage(name: personalDetail, page: () => const PersonalDetailScreen()),
  ];
}
