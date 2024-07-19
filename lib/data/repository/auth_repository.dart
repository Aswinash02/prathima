import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:prathima_loan_app/models/login_model.dart';
import 'package:prathima_loan_app/models/signup_model.dart';
import 'package:prathima_loan_app/utils/app_constant.dart';

class AuthRepository extends GetxService {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future getSignupResponse(
    String name,
    String email,
    String phone,
    String password,
    String confirmPassword,
  ) async {
    var postBody = jsonEncode({
      "name": name,
      "email": email,
      "phone_number": phone,
      "password": password,
      "password_confirmation": confirmPassword,
    });

    final response = await ApiClient.post(
        endPoint: AppConstants.signUpUrl,
        headers: {
          "Content-Type": "application/json",
        },
        body: postBody);
    print("signup response=======>${response.body}");
    return signupResponseFromJson(response.body);
  }

  Future<LoginResponse> getLoginResponse(String email, String password) async {
    var postBody = jsonEncode({
      "email": email,
      "password": password,
    });

    final response = await ApiClient.post(
        endPoint: AppConstants.signInUrl,
        headers: {
          "Content-Type": "application/json",
        },
        body: postBody);
    print("login Response=============>${response.body}");
    return loginResponseFromJson(response.body);
  }

  Future<String> sendOTP(String phone) async {
    var postBody = jsonEncode({
      "phone_number": phone,
    });

    final response = await ApiClient.post(
      endPoint: AppConstants.signInWithPhoneUrl,
      headers: {
        "Content-Type": "application/json",
      },
      body: postBody,
    );
    return response.body;
  }

  Future<LoginResponse> signInWithPhone(String phone, String otp) async {
    var postBody = jsonEncode({
      "phone_number": phone,
      "otp": otp,
    });

    final response = await ApiClient.post(
        endPoint: AppConstants.signInUrl,
        headers: {
          "Content-Type": "application/json",
        },
        body: postBody);
    print("login Response=============>${response.body}");
    return loginResponseFromJson(response.body);
  }
}
