import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/data/repository/home_repository.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

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
}
