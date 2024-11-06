import 'package:get/get.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:prathima_loan_app/data/model/login_model.dart';
import 'package:prathima_loan_app/utils/app_constant.dart';

class AuthRepository extends GetxService {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<void> saveUserToken({required String token}) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
  }

  Future<Response> sendOTP(String phone) async {
    var postBody = {
      "phone": phone,
    };

    return await apiClient.postData(
      AppConstants.signInUrl,
      postBody,
      headers: {
        "Content-Type": "application/json",
      },
    );
  }

  Future<Response> otpVerify(
      String phone, String otp, String deviceToken) async {
    var postBody = {
      "phone": phone,
      "otp": otp,
      "device_token": deviceToken,
    };

    return await apiClient.postData(
      AppConstants.otpVerifyUrl,
      postBody,
      headers: {
        "Content-Type": "application/json",
      },
    );
  }
}
