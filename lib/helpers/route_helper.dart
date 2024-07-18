import 'package:get/get.dart';
import 'package:prathima_loan_app/screens/auth/authentication_success_page.dart';
import 'package:prathima_loan_app/screens/auth/otp_verification_page.dart';
import 'package:prathima_loan_app/screens/auth/signin_screen.dart';
import 'package:prathima_loan_app/screens/home/home_screen.dart';
import 'package:prathima_loan_app/screens/initial_screen/initial_screen_page.dart';
import 'package:prathima_loan_app/screens/kyc_form/kyc_details_screen.dart';
import 'package:prathima_loan_app/screens/loan/loan_detail/loan_details_screen.dart';
import 'package:prathima_loan_app/screens/loan/payment_mode/credit_or_debit_card_form.dart';
import 'package:prathima_loan_app/screens/loan/preclosing_loan_amount/preclosing_loan_amount_screen.dart';
import 'package:prathima_loan_app/screens/loan_agreement_screen/loan_agreenent_screen.dart';
import 'package:prathima_loan_app/screens/loan_approved/loan_approved_screen.dart';
import 'package:prathima_loan_app/screens/loan_verification/loan_details_form.dart';
import 'package:prathima_loan_app/screens/main_screen.dart';
import 'package:prathima_loan_app/screens/profile/about_us_screen.dart';
import 'package:prathima_loan_app/screens/profile/personal_details/personal_details_screen.dart';
import 'package:prathima_loan_app/screens/profile/privacy_policy_screen.dart';
import 'package:prathima_loan_app/screens/profile/terms_and_condition_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String introductionScreen = '/introductionScreen';
  static const String login = '/loginIn';
  static const String authSuccess = '/authSuccess';
  static const String verificationOtp = '/verificationOtp';
  static const String home = '/home';
  static const String kycDetail = '/kycDetail';
  static const String loanDetailsForm = '/loanDetailsForm';
  static const String loanApprovedScreen = '/loanApprovedScreen';
  static const String loanAgreementScreen = '/loanAgreementScreen';
  static const String personalDetailsScreen = '/personalDetailsScreen';
  static const String aboutUsScreen = '/aboutUsScreen';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String termsAndConditionScreen = '/termsAndConditionScreen';
  static const String loanDetailsScreen = '/loanDetailsScreen';
  static const String creditOrDebitCardForm = '/creditOrDebitCardForm';
  static const String preClosingLoanAmountScreen =
      '/preClosingLoanAmountScreen';

  static String getCreditOrDebitCardFormRoute(String cardType) {
    return '$creditOrDebitCardForm?cardType=$cardType';
  }


  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainScreen()),
    GetPage(name: login, page: () => const SignInScreen()),
    GetPage(name: verificationOtp, page: () => const VerificationOtpPage()),
    GetPage(name: authSuccess, page: () => const AuthSuccessPage()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: loanDetailsForm, page: () => const LoanDetailsForm()),
    GetPage(name: kycDetail, page: () => const KycDetailScreen()),
    GetPage(name: loanApprovedScreen, page: () => const LoanApprovedScreen()),
    GetPage(name: loanAgreementScreen, page: () => const LoanAgreementScreen()),
    GetPage(name: aboutUsScreen, page: () => const AboutUsScreen()),
    GetPage(name: privacyPolicyScreen, page: () => const PrivacyPolicyScreen()),
    GetPage(name: loanDetailsScreen, page: () => const LoanDetailsScreen()),
    GetPage(name: introductionScreen, page: () => const InitialScreen()),    GetPage(
        name: creditOrDebitCardForm,
        page: () {
         return  CreditOrDebitCardForm(
           cardType: Get.parameters['cardType']!  ,
         );
  }),
    GetPage(
        name: preClosingLoanAmountScreen,
        page: () => const PreClosingLoanAmountScreen()),
    GetPage(
        name: termsAndConditionScreen,
        page: () => const TermsAndConditionScreen()),
    GetPage(
        name: personalDetailsScreen, page: () => const PersonalDetailsScreen()),
  ];
}
