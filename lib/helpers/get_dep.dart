import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/controllers/home_controller.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/controllers/loan_agreement_controller.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:prathima_loan_app/data/repository/auth_repository.dart';
import 'package:prathima_loan_app/data/repository/home_repository.dart';
import 'package:prathima_loan_app/data/repository/kyc_repository.dart';
import 'package:prathima_loan_app/data/repository/loan_agreement_repository.dart';
import 'package:prathima_loan_app/data/repository/loan_repository.dart';

Future<void> init() async {
  // ApiClient
  Get.lazyPut(() => ApiClient(baseUrl: ''));

  // Repository
  Get.lazyPut(() => HomeRepository(apiClient: Get.find()));
  Get.lazyPut(() => AuthRepository(apiClient: Get.find()));
  Get.lazyPut(() => LoanRepository(apiClient: Get.find()));
  Get.lazyPut(() => KycRepository(apiClient: Get.find()));
  Get.lazyPut(() => LoanAgreementRepository(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => HomeController(homeRepository: Get.find()));
  Get.lazyPut(() => AuthController(authRepository: Get.find()));
  Get.lazyPut(() => LoanController(loanRepository: Get.find()));
  Get.lazyPut(() => KycController(kycRepository: Get.find()));
  Get.lazyPut(
      () => LoanAgreementController(loanAgreementRepository: Get.find()));
}
