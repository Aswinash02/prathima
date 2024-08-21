import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      Get.find<AuthController>().clearUserData();
      Get.offAllNamed(RouteHelper.login);
    } else {
      showCustomSnackBar(response.statusText);
    }
  }
}
