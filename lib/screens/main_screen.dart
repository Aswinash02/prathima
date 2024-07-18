import 'package:flutter/material.dart';
import 'package:prathima_loan_app/screens/home/home_screen.dart';
import 'package:prathima_loan_app/screens/loan/loan_screen.dart';
import 'package:prathima_loan_app/screens/profile/profile_screen.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

import 'transaction/transaction_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
    return Scaffold(
      body: children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CustomIcon(
              icon: "assets/icon/home_icon.png",
              color: _selectedIndex == 0 ? MyTheme.mainColor : MyTheme.grey_153,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(
              icon: "assets/icon/loan_icon.png",
              height: 25,
              width: 25,
              color: _selectedIndex == 1 ? MyTheme.mainColor : MyTheme.grey_153,
            ),
            label: 'Loan',
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(
              icon: "assets/icon/transaction_icon.png",
              color: _selectedIndex == 2 ? MyTheme.mainColor : MyTheme.grey_153,
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(
              icon: "assets/icon/profile_icon.png",
              height: 25,
              width: 25,
              color: _selectedIndex == 3 ? MyTheme.mainColor : MyTheme.grey_153,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MyTheme.mainColor,
        unselectedItemColor: MyTheme.medium_grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
