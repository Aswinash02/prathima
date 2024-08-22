import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:prathima_loan_app/data/model/login_model.dart';
import 'package:prathima_loan_app/data/model/signup_model.dart';
import 'package:prathima_loan_app/utils/app_constant.dart';

class AuthRepository extends GetxService {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<Response> getSignupResponse(
    String name,
    String email,
    String phone,
    String password,
    String confirmPassword,
  ) async {
    var postBody = {
      "name": name,
      "email": email,
      "phone_number": phone,
      "password": password,
      "password_confirmation": confirmPassword,
    };
    print('postBody ======== ${postBody}');
    return await apiClient.postData(
      AppConstants.signUpUrl,
      postBody,
      headers: {
        "Content-Type": "application/json",
      },
    );
    // return SignupResponse.fromJson(response.body);
  }

  Future<LoginResponse> getLoginResponse(String email, String password) async {
    var postBody = {
      "email": email,
      "password": password,
    };

    final response = await apiClient.postData(
      AppConstants.signInUrl,
      postBody,
      headers: {
        "Content-Type": "application/json",
      },
    );
    return LoginResponse.fromJson(response.body);
  }

  Future<void> saveUserToken({required String token}) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
  }

  Future<Response> sendOTP(String phone) async {
    var postBody = {
      "phone_number": phone,
    };

    return await apiClient.postData(
      AppConstants.signInWithPhoneUrl,
      postBody,
      headers: {
        "Content-Type": "application/json",
      },
    );
  }

  Future<LoginResponse> signInWithPhone(String phone, String otp) async {
    var postBody = {
      "phone_number": phone,
      "otp": otp,
    };

    final response = await apiClient.postData(
      AppConstants.signInUrl,
      postBody,
      headers: {
        "Content-Type": "application/json",
      },
    );
    return LoginResponse.fromJson(response.body);
  }

  Future<Map<String, dynamic>> verifyEmail(String email, String otp) async {
    var postBody = {
      "email": email,
      "otp": otp,
    };

    final response = await apiClient.postData(
      AppConstants.emailVerifyUrl,
      postBody,
      headers: {
        "Content-Type": "application/json",
      },
    );
    return response.body;
  }
}
