import 'package:get/get.dart';
import 'package:prathima_loan_app/screens/auth/auth_success_screen.dart';
import 'package:prathima_loan_app/screens/auth/otp_verification_page.dart';
import 'package:prathima_loan_app/screens/auth/signin_screen.dart';
import 'package:prathima_loan_app/screens/auth/signup_screen.dart';
import 'package:prathima_loan_app/screens/home/home_screen.dart';
import 'package:prathima_loan_app/screens/initial_screen.dart';
import 'package:prathima_loan_app/screens/kyc_form/kyc_details_screen.dart';
import 'package:prathima_loan_app/screens/loan/loan_detail/loan_details_screen.dart';
import 'package:prathima_loan_app/screens/loan/loan_detail/personal_loan_detail_screen.dart';
import 'package:prathima_loan_app/screens/loan/otp_verfication/loan_otp_verification_screen.dart';
import 'package:prathima_loan_app/screens/loan/payment_mode/credit_or_debit_card_form.dart';
import 'package:prathima_loan_app/screens/loan/preclosing_loan_amount/pre_close_loan_success_screen.dart';
import 'package:prathima_loan_app/screens/loan/preclosing_loan_amount/preclosing_loan_amount_screen.dart';
import 'package:prathima_loan_app/screens/loan_agreement_screen/loan_agreenent_screen.dart';
import 'package:prathima_loan_app/screens/loan_approved/loan_approved_screen.dart';
import 'package:prathima_loan_app/screens/loan_verification/loan_details_form.dart';
import 'package:prathima_loan_app/screens/main_screen.dart';
import 'package:prathima_loan_app/screens/no_internet_screen.dart';
import 'package:prathima_loan_app/screens/profile/about_us_screen.dart';
import 'package:prathima_loan_app/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:prathima_loan_app/screens/profile/kyc_details/kyc_details_screen.dart';
import 'package:prathima_loan_app/screens/profile/loan_history.dart';
import 'package:prathima_loan_app/screens/profile/privacy_policy_screen.dart';
import 'package:prathima_loan_app/screens/profile/terms_and_condition_screen.dart';
import 'package:prathima_loan_app/screens/profile/widget/contact_us_screen.dart';
import 'package:prathima_loan_app/screens/profile/widget/help_and_support_screen.dart';
import 'package:prathima_loan_app/screens/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String introductionScreen = '/introductionScreen';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String authSuccessScreen = '/authSuccessScreen';
  static const String verificationOtp = '/verificationOtp';
  static const String home = '/home';
  static const String kycVerificationScreen = '/kycVerificationScreen';
  static const String loanDetailsForm = '/loanDetailsForm';
  static const String loanApprovedScreen = '/loanApprovedScreen';
  static const String loanAgreementScreen = '/loanAgreementScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String aboutUsScreen = '/aboutUsScreen';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String termsAndConditionScreen = '/termsAndConditionScreen';
  static const String loanDetailsScreen = '/loanDetailsScreen';
  static const String creditOrDebitCardForm = '/creditOrDebitCardForm';
  static const String loanOTPVerificationScreen = '/loanOTPVerificationScreen';
  static const String preCloseLoanSuccessScreen = '/preCloseLoanSuccessScreen';
  static const String personalLoanDetailScreen = '/PersonalLoanDetailScreen';
  static const String loanHistoryScreen = '/loanHistoryScreen';
  static const String noInternetScreen = '/noInternetScreen';
  static const String splashScreen = '/splashScreen';
  static const String helpAndSupportScreen = '/helpAndSupportScreen';
  static const String contactUsScreenScreen = '/contactUsScreenScreen';
  static const String preClosingLoanAmountScreen =
      '/preClosingLoanAmountScreen';
  static const String kycDetailsScreen = '/kycDetailsScreen';

  static String getCreditOrDebitCardFormRoute(String cardType) {
    return '$creditOrDebitCardForm?cardType=$cardType';
  }

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const MainScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: login,
      page: () => const SignInScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signUp,
      page: () => const SignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: verificationOtp,
      page: () => const VerificationOtpPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: authSuccessScreen,
      page: () => const AuthSuccessScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: loanDetailsForm,
      page: () => const LoanDetailsForm(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: kycVerificationScreen,
      page: () => const KycVerificationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: loanApprovedScreen,
      page: () => const LoanApprovedScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: loanAgreementScreen,
      page: () => const LoanAgreementScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: aboutUsScreen,
      page: () => const AboutUsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: privacyPolicyScreen,
      page: () => const PrivacyPolicyScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: helpAndSupportScreen,
      page: () => const HelpAndSupportScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: contactUsScreenScreen,
      page: () => const ContactUsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: loanDetailsScreen,
      page: () => const LoanDetailsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: loanHistoryScreen,
      page: () => const LoanHistoryScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: loanOTPVerificationScreen,
      page: () => const LoanOTPVerificationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: preCloseLoanSuccessScreen,
      page: () => const PreCloseLoanSuccessScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: introductionScreen,
      page: () => const InitialScreen(),
    ),
    GetPage(
      name: noInternetScreen,
      page: () => const NoInternetScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: personalLoanDetailScreen,
      page: () => const PersonalLoanDetailScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: creditOrDebitCardForm,
        page: () {
          return CreditOrDebitCardForm(
            cardType: Get.parameters['cardType']!,
          );
        },
        transition: Transition.rightToLeft),
    GetPage(
      name: preClosingLoanAmountScreen,
      page: () => const PreClosingLoanAmountScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: termsAndConditionScreen,
      page: () => const TermsAndConditionScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: editProfileScreen,
      page: () => const EditProfileScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: kycDetailsScreen,
      page: () => const KYCDetailsScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
