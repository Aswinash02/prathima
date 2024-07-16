import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:prathima_loan_app/data/repository/auth_repository.dart';
import 'package:prathima_loan_app/data/repository/kyc_repository.dart';
import 'package:prathima_loan_app/data/repository/loan_repository.dart';

Future<void> init() async {
  // ApiClient
  Get.lazyPut(() => ApiClient(baseUrl: ''));

  // Repository
  Get.lazyPut(() => AuthRepository(apiClient: Get.find()));
  Get.lazyPut(() => LoanRepository(apiClient: Get.find()));
  Get.lazyPut(() => KycRepository(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => AuthController(authRepository: Get.find()));
  Get.lazyPut(() => LoanController(loanRepository: Get.find()));
  Get.lazyPut(() => KycController(kycRepository: Get.find()));
}
