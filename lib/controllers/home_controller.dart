import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/data/api/api_checker.dart';
import 'package:prathima_loan_app/data/repository/home_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  int _currentIndex = 0;
  String _initialLoanAmount = '...';

  int get currentIndex => _currentIndex;

  String get initialLoanAmount => _initialLoanAmount;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Image(image: AssetImage("assets/icon/home.png")),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Image(image: AssetImage("assets/icon/loan.png")),
      label: 'Loan',
    ),
    const BottomNavigationBarItem(
      icon: Image(image: AssetImage("assets/icon/transaction.png")),
      label: 'Transaction',
    ),
    const BottomNavigationBarItem(
      icon: Image(image: AssetImage("assets/icon/person.png")),
      label: 'Profile',
    ),
  ];

  void updateIndex(int index) {
    _currentIndex = index;
    update();
  }

  Future<void> getInitialLoanAmount() async {
    var response = await homeRepository.getInitialLoanAmount();
    if (response.statusCode == 200) {
      var body = response.body;
      _initialLoanAmount = body['data'];
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void clearData() {
    _initialLoanAmount = '...';
    update();
  }

  void onTapLoanCard() {
    if (Get.find<KycController>().kycStatus != null) {
      print(Get.find<KycController>().kycStatus!.status);
      if (Get.find<KycController>().kycStatus!.status == 2) {
        Get.toNamed(RouteHelper.loanDetailsForm);
      } else {
        Get.toNamed(RouteHelper.kycDetail);
      }
    }
  }
}
