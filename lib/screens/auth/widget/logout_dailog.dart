import 'package:flutter/material.dart';
import 'package:prathima_loan_app/utils/colors.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Logout'),
          ),
        ],
      );
    },
  );
}
