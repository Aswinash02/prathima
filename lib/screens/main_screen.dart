import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/home_controller.dart';
import 'package:prathima_loan_app/screens/home/home_screen.dart';
import 'package:prathima_loan_app/screens/home/widget/init_permission_dialog.dart';
import 'package:prathima_loan_app/screens/loan/loan_screen.dart';
import 'package:prathima_loan_app/screens/profile/profile_screen.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

import 'transaction/transaction_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initCall();
    });
  }

  Future<void> initCall() async {
    await Get.find<HomeController>().permissionDialog();

  }

  int _selectedIndex = 0;

  static const List<Widget> children = <Widget>[
    HomeScreen(),
    LoanScreen(),
    TransactionScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          _selectedIndex = 0;
          setState(() {});
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 25,
                child: CustomIcon(
                  icon: "assets/icon/home_icon.png",
                  color: _selectedIndex == 0
                      ? MyTheme.mainColor
                      : MyTheme.grey_153,
                ),
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 25,
                child: CustomIcon(
                  icon: "assets/icon/loan_icon.png",
                  color: _selectedIndex == 1
                      ? MyTheme.mainColor
                      : MyTheme.grey_153,
                ),
              ),
              label: 'Loan',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 25,
                child: CustomIcon(
                  icon: "assets/icon/transaction_icon.png",
                  color: _selectedIndex == 2
                      ? MyTheme.mainColor
                      : MyTheme.grey_153,
                ),
              ),
              label: 'Transaction',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 25,
                child: CustomIcon(
                  icon: "assets/icon/loan_history_icon.png",
                  height: 25,
                  width: 25,
                  color: _selectedIndex == 3
                      ? MyTheme.mainColor
                      : MyTheme.grey_153,
                ),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyTheme.mainColor,
          unselectedItemColor: MyTheme.grey_153,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
