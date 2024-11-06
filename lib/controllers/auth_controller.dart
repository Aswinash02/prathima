import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/api/api_checker.dart';
import 'package:prathima_loan_app/data/model/phone_number_model.dart';
import 'package:prathima_loan_app/data/repository/auth_repository.dart';
import 'package:prathima_loan_app/data/repository/firebase_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/data/model/login_model.dart';
import 'package:prathima_loan_app/screens/auth/widget/phone_number_dialog.dart';
import 'package:prathima_loan_app/utils/shared_preferences.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  final sharedPreference = SharedPreference();

  TextEditingController phoneCon = TextEditingController();

  OtpFieldController? otpController = OtpFieldController();

  bool showPassword = false;
  bool showConfirmPassword = false;
  bool _isDialogShown = false;

  bool _loadingState = false;
  String? _otp;

  bool get loadingState => _loadingState;

  String? get otp => _otp;

  static const platform = MethodChannel('com.example.siminfo');

  Future<void> getSimInfo() async {
    if (_isDialogShown) return;

    try {
      final List<dynamic>? result =
          await platform.invokeMethod<List<dynamic>>('getSimInfo');
      if (result != null) {
        PhoneNumberModel data = PhoneNumberModel.fromJson(result);
        if (data.data!.isNotEmpty) {
          if (data.data!.length == 1 && data.data!.first.phoneNumber != null) {
            _isDialogShown = true;
            showPhoneNumberDialog(data);
          } else {
            _isDialogShown = true;
            showPhoneNumberDialog(data);
          }
        }
      }
    } on PlatformException catch (_) {}
  }

  void changeDialogStatus() {
    _isDialogShown = false;
  }

  void onSelectPhoneNumber(String phoneNumber) {
    phoneCon.text = phoneNumber;
    update();
  }

  Future<void> sendOtp() async {
    Get.focusScope?.unfocus();
    String phone = phoneCon.text;
    if (phone == "") {
      showCustomSnackBar("Enter Phone Number");
    } else if (phone.length < 10) {
      showCustomSnackBar("Invalid Phone Number");
    } else {
      _loadingState = true;
      update();
      var response = await authRepository.sendOTP(phone);
      print('response.body -------- > ${response.body}');
      if (response.body["success"] == false) {
        showCustomSnackBar(response.body["message"]);
      } else {
        print('otp ------- ${response.body["otp"]}');
        showCustomSnackBar(response.body["otp"].toString(), isError: false);
        showCustomSnackBar(response.body["message"], isError: false);
        Get.toNamed(RouteHelper.verificationOtp, arguments: {'phone': phone});
        phoneCon.clear();
      }
    }
    _loadingState = false;
    update();
  }

  void signInWithPhone(String phone) async {
    if (otp != null) {
      _loadingState = true;
      update();
      String deviceToken = await FirebaseRepository().getToken();
      var response = await authRepository.otpVerify(phone, otp!, deviceToken);
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.body);
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
        ApiChecker.checkApi(response);
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

  Future<void> clearUserData() async {
    await sharedPreference.setLogin(false);
    await sharedPreference.setUserData("");
  }

  void setOTP(String otp) {
    _otp = otp;
    update();
  }
}
