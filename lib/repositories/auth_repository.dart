import 'dart:convert';

import 'package:get/get.dart';
import 'package:prathima_loan_app/customs/custom_toest.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:prathima_loan_app/models/login_model.dart';
import 'package:prathima_loan_app/models/signup_model.dart';
import 'package:prathima_loan_app/screens/auth/otp_verification_page.dart';
import 'package:toast/toast.dart';

class AuthRepositories{
  Future getSignupResponse(
    String name,
    String email,
    String phone,
    String password,
    String confirmPassword,
  ) async {
    var post_body = jsonEncode({
      "name": name,
      "email": email,
      "phone_number": phone,
      "password": password,
      "password_confirmation": confirmPassword,
    });

    String url = ("https://prathima.v4inspire.com/api/auth/sign-up");
    final response = await ApiClient.post(
        url: url,
        headers: {
          "Content-Type": "application/json",
        },
        body: post_body);
    print("signup response=======>${response.body}");
    return signupResponseFromJson(response.body);
  }

  Future<LoginResponse> getLoginResponse(
      String email, String password) async {
    var post_body = jsonEncode({
      "email": email,
      "password": password,
    });

    String url = ("https://prathima.v4inspire.com/api/auth/login");
    final response = await ApiClient.post(
        url: url,
        headers: {
          "Content-Type": "application/json",
        },
        body: post_body);
    print("login Response=============>${response.body}");
    return loginResponseFromJson(response.body);
  }
}
