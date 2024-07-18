import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/home_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return BottomNavigationBar(
        items: controller.items,
        currentIndex: controller.currentIndex,
        onTap: (index) {
          controller.updateIndex(index);
        },
      );
    });
  }
}
