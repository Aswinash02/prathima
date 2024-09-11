import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/api/api_checker.dart';
import 'package:prathima_loan_app/data/model/phone_number_model.dart';
import 'package:prathima_loan_app/data/repository/auth_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/data/model/login_model.dart';
import 'package:prathima_loan_app/data/model/signup_model.dart';
import 'package:prathima_loan_app/screens/auth/widget/phone_number_dialog.dart';
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
  bool _isDialogShown = false;

  // bool _signInWithOTP = false;
  bool _loadingState = false;
  String? _otp;

  // bool get signInWithOTP => _signInWithOTP;

  bool get loadingState => _loadingState;

  String? get otp => _otp;

  void register() async {
    String name = signUpNameCon.text;
    // String email = signUpEmailCon.text;
    String number = signUpPhoneCon.text;
    // String password = signUpPasswordCon.text;
    // String confirmPassword = signUpPasswordConfirmCon.text;

    if (name.isEmpty) {
      showCustomSnackBar("Enter Your Name");
    }
    // else if (email.isEmpty) {
    //   showCustomSnackBar("Enter Your Email");
    // } else if (!GetUtils.isEmail(email)) {
    //   showCustomSnackBar("Enter Valid Email Id");
    // }
    else if (number.isEmpty) {
      showCustomSnackBar("Enter Your Phone Number");
    } else if (number.length < 10) {
      showCustomSnackBar("Enter Valid Phone Number");
    }
    // else if (password == "") {
    //   showCustomSnackBar("Enter Password");
    // } else if (password.length < 8) {
    //   showCustomSnackBar("Password Length atleast greater than 8 characters");
    // } else if (confirmPassword == "") {
    //   showCustomSnackBar("Enter Confirm Password");
    // } else if (password != confirmPassword) {
    //   showCustomSnackBar("Password does not matched");
    // }
    else {
      _loadingState = true;
      update();
      var response = await authRepository.getSignupResponse(name, number);
      SignupResponse signupResponse = SignupResponse.fromJson(response.body);
      if (response.statusCode == 201) {
        showCustomSnackBar(signupResponse.message, isError: false);
        authRepository.saveUserToken(token: signupResponse.token!);
        sharedPreference.setUserData(jsonEncode(signupResponse.toJson()));
        clearControllerData();
        Get.toNamed(RouteHelper.verificationOtp);
      } else if (signupResponse.errors != null) {
        showCustomSnackBar(signupResponse.errors!.first);
      } else {
        ApiChecker.checkApi(response);
      }
    }
    _loadingState = false;
    update();
  }

  static const platform = MethodChannel('com.example.siminfo');

  Future<void> getSimInfo() async {
    if (_isDialogShown) return;

    try {
      final List<dynamic>? result = await platform.invokeMethod<List<dynamic>>('getSimInfo');
      if (result != null) {
        PhoneNumberModel data = PhoneNumberModel.fromJson(result);
        if (data.data!.isNotEmpty) {
          if(data.data!.length == 1 && data.data!.first.phoneNumber != null){
            _isDialogShown = true;
             showPhoneNumberDialog(data);
          }else{
            _isDialogShown = true;
            showPhoneNumberDialog(data);
          }
        }
      }
    } on PlatformException catch (_) {}
  }

  void changeDialogStatus(){
    _isDialogShown = false;
  }

  void onSelectPhoneNumber(String phoneNumber) {
    signInPhoneCon.text = phoneNumber;
    update();
  }

  void login() async {
    String email = signInEmailCon.text;
    String password = signInPasswordCon.text;

    if (email.isEmpty) {
      showCustomSnackBar("Enter Your Email");
      return;
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar("Enter Valid Email Id");
      return;
    } else if (password == "") {
      showCustomSnackBar("Enter Password");
      return;
    } else if (password.length < 8) {
      showCustomSnackBar("Password Length atleast greater than 8 characters");
      return;
    } else {
      _loadingState = true;
      update();
      LoginResponse loginResponse =
          await authRepository.getLoginResponse(email, password);
      if (loginResponse.result == false) {
        showCustomSnackBar(loginResponse.message);
      } else {
        showCustomSnackBar(loginResponse.message, isError: false);
        authRepository.saveUserToken(token: loginResponse.token!);
        sharedPreference.setUserData(jsonEncode(loginResponse.toJson()));
        sharedPreference.setLogin(true);
        Get.offAllNamed(RouteHelper.initial);
        // await Get.find<KycController>().getKycStatus();
        // if (Get.find<KycController>().kycStatus!.status != 0) {
        //   Get.offAllNamed(RouteHelper.initial);
        // } else {
        //   Get.offAllNamed(RouteHelper.home);
        // }
        clearControllerData();
      }
    }
    _loadingState = false;
    update();
  }

  Future<void> sendOtp() async {
    Get.focusScope?.unfocus();
    String phone = signInPhoneCon.text;
    if (phone == "") {
      showCustomSnackBar("Enter Phone Number");
    } else if (phone.length < 10) {
      showCustomSnackBar("Invalid Phone Number");
    } else {
      _loadingState = true;
      update();
      var response = await authRepository.sendOTP(phone);
      var responseBody = response.body;
      if (responseBody["result"] == false) {
        showCustomSnackBar(responseBody["message"]);
      } else {
        print('otp ------- ${responseBody["OTP"]}');
        showCustomSnackBar(responseBody["OTP"].toString(), isError: false);
        showCustomSnackBar(responseBody["message"], isError: false);
        Get.toNamed(RouteHelper.verificationOtp,
            arguments: {'signInWithPhone': true, 'phone': phone});
        signInPhoneCon.clear();
      }
    }
    _loadingState = false;
    update();
  }

  void signInWithPhone(String phone) async {
    if (otp != null) {
      _loadingState = true;
      update();
      LoginResponse loginResponse =
          await authRepository.signInWithPhone(phone, otp!);
      if (loginResponse.result == false) {
        showCustomSnackBar(loginResponse.message);
      } else {
        authRepository.saveUserToken(token: loginResponse.token!);
        showCustomSnackBar(loginResponse.message, isError: false);
        sharedPreference.setUserData(jsonEncode(loginResponse.toJson()));
        Get.offAllNamed(RouteHelper.authSuccessScreen);
        sharedPreference.setLogin(true);
      }
    } else {
      showCustomSnackBar("Enter Valid OTP");
    }
    _loadingState = false;
    update();
  }

  Future<LoginResponse> userData() async {
    String userData = await sharedPreference.getUserData();
    return LoginResponse.fromJson(jsonDecode(userData));
  }

  void verifyEmail() async {
    LoginResponse user = await userData();
    if (otp != null) {
      _loadingState = true;
      update();
      Map<String, dynamic> emailVerify =
          await authRepository.verifyEmail(user.user!.email!, otp!);
      if (emailVerify['message'] == "OTP verified successfully!") {
        showCustomSnackBar(emailVerify['message'], isError: false);
        sharedPreference.setLogin(true);
        Get.offAllNamed(RouteHelper.authSuccessScreen);
      } else {
        showCustomSnackBar(emailVerify['message']);
      }
    } else {
      showCustomSnackBar("Enter Valid OTP");
    }
    _loadingState = false;
    update();
  }

  // void onChangeSignInMethod() {
  //   _signInWithOTP = !_signInWithOTP;
  //   update();
  // }

  Future<void> clearUserData() async {
    await sharedPreference.setLogin(false);
    await sharedPreference.setUserData("");
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
