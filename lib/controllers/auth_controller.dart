import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/data/repository/auth_repository.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  bool _isKycVerified = false;

  bool get isKycVerified => _isKycVerified;
}
