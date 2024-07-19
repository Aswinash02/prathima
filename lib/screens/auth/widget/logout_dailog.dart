import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GetBuilder<AuthController>(builder: (controller) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Column(
            children: [
              Icon(
                Icons.logout,
                color: MyTheme.mainColor,
                size: 50,
              ),
              SizedBox(height: 15),
              Text(
                'Are You Sure to Logout?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Get.back();
                await controller.clearUserData();
                Get.offAllNamed(RouteHelper.login);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      });
    },
  );
}
