import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/data/repository/auth_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/models/login_model.dart';
import 'package:prathima_loan_app/models/signup_model.dart';
import 'package:prathima_loan_app/repositories/auth_repository.dart';
import 'package:prathima_loan_app/utils/shared_preferences.dart';

import '../customs/custom_snackbar.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  bool _isKycVerified = false;

  bool get isKycVerified => _isKycVerified;

  void register() async {
    String firstName = nameController.text;
    String email = emailController.text;
    String number = phoneController.text;
    String password = passwordController.text;
    String confirmPassword = passwordConfirmController.text;

    if (firstName.isEmpty) {
      showCustomSnackBar("Enter Your Name");
    } else if (email.isEmpty) {
      showCustomSnackBar("Enter Your Email");
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar("Enter Valid Email Id");
    } else if (number.isEmpty) {
      showCustomSnackBar("Enter Your Phone Number");
    } else if (password == "") {
      showCustomSnackBar("Enter Password");
    } else if (confirmPassword == "") {
      showCustomSnackBar("Enter Confirm Password");
    } else if (password.length < 8) {
      showCustomSnackBar("Password Length atleast greater than 8 characters");
    } else if (password != confirmPassword) {
      showCustomSnackBar("Password does not matched");
    } else {
      SignupResponse signupResponse = await AuthRepositories()
          .getSignupResponse(
              firstName, email, number, password, confirmPassword);

      if (signupResponse.result == false) {
        showCustomSnackBar(signupResponse.message);
      } else {
        showCustomSnackBar(signupResponse.message);
        Get.toNamed(RouteHelper.verificationOtp);
      }
    }
  }

  void login() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty) {
      showCustomSnackBar("Enter Your Email");
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar("Enter Valid Email Id");
    } else if (password == "") {
      showCustomSnackBar("Enter Password");
    } else if (password.length < 8) {
      showCustomSnackBar("Password Length atleast greater than 8 characters");
    } else {
      LoginResponse loginResponse =
          await AuthRepositories().getLoginResponse(email, password);
      if (loginResponse.result == false) {
        showCustomSnackBar(loginResponse.message);
      } else {
        showCustomSnackBar(loginResponse.message);
        Get.toNamed(RouteHelper.verificationOtp);
        SharedPreference().setLogin(true);
        SharedPreference().setUserPhoneNo(loginResponse.user?.phoneNumber ?? '');
      }
    }
  }
}
