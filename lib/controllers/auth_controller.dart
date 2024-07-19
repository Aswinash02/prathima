import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/repository/auth_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/models/login_model.dart';
import 'package:prathima_loan_app/models/signup_model.dart';
import 'package:prathima_loan_app/utils/shared_preferences.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  final sharedPreference = SharedPreference();

  // Sign Up
  TextEditingController signUpPhoneCon = TextEditingController();
  TextEditingController signUpEmailCon = TextEditingController();
  TextEditingController signUpPasswordCon = TextEditingController();
  TextEditingController signUpPasswordConfirmCon = TextEditingController();
  TextEditingController signUpNameCon = TextEditingController();

  // Sign In
  TextEditingController signInPhoneCon = TextEditingController();
  TextEditingController signInEmailCon = TextEditingController();
  TextEditingController signInPasswordCon = TextEditingController();

  OtpFieldController? otpController = OtpFieldController();

  bool showPassword = false;
  bool showConfirmPassword = false;
  bool _signInWithOTP = false;
  String? _otp;

  bool _isKycVerified = false;

  bool get isKycVerified => _isKycVerified;

  bool get signInWithOTP => _signInWithOTP;

  String? get otp => _otp;

  void register() async {
    String firstName = signUpNameCon.text;
    String email = signUpEmailCon.text;
    String number = signUpPhoneCon.text;
    String password = signUpPasswordCon.text;
    String confirmPassword = signUpPasswordConfirmCon.text;

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
      SignupResponse signupResponse = await authRepository.getSignupResponse(
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
    String email = signInEmailCon.text;
    String password = signInPasswordCon.text;

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
          await authRepository.getLoginResponse(email, password);
      if (loginResponse.result == false) {
        showCustomSnackBar(loginResponse.message);
      } else {
        print(loginResponse.message);
        showCustomSnackBar(loginResponse.message, isError: false);
        Get.toNamed(RouteHelper.verificationOtp);
        sharedPreference.setLogin(true);
        sharedPreference.setUserToken(loginResponse.token ?? '');
        sharedPreference.setUserPhoneNo(loginResponse.user?.phoneNumber ?? '');
      }
    }
  }

  Future<void> sendOtp() async {
    String phone = signInPhoneCon.text;
    if (signInWithOTP == true && phone == "") {
      showCustomSnackBar("Enter Phone Number");
    } else if (signInWithOTP == true && phone.length < 10) {
      showCustomSnackBar("Invalid Phone Number");
    } else {
      String response = await authRepository.sendOTP(phone);
      var responseBody = jsonDecode(response);
      if (responseBody["result"] == false) {
        showCustomSnackBar(responseBody["message"]);
      } else {
        print('otp ------- ${responseBody["OTP"]}');
        showCustomSnackBar(responseBody["message"], isError: false);
        Get.toNamed(RouteHelper.verificationOtp,
            arguments: {'signInWithPhone': true, 'phone': phone});
        signInPhoneCon.clear();
      }
    }
  }

  void signInWithPhone(String phone) async {
    if (otp != null) {
      LoginResponse loginResponse =
          await authRepository.signInWithPhone(phone, otp!);
      if (loginResponse.result == false) {
        showCustomSnackBar(loginResponse.message);
      } else {
        showCustomSnackBar(loginResponse.message, isError: false);
        Get.offAllNamed(RouteHelper.authSuccess);
        sharedPreference.setLogin(true);
        sharedPreference.setUserPhoneNo(loginResponse.user?.phoneNumber ?? '');
      }
    }
  }

  void onChangeSignInMethod() {
    _signInWithOTP = !_signInWithOTP;
    update();
  }

  Future<void> clearUserData() async {
    sharedPreference.setLogin(false);
  }

  void clearControllerData() {
    signUpPhoneCon.clear();
    signUpNameCon.clear();
    signUpPasswordConfirmCon.clear();
    signUpPasswordCon.clear();
    signUpEmailCon.clear();
    signInPhoneCon.clear();
    signInEmailCon.clear();
    signInPasswordCon.clear();
  }

  void setOTP(String otp) {
    _otp = otp;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    clearControllerData();
    super.onClose();
  }
}
