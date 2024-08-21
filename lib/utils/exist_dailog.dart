import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';

void showExitConfirmationDialog(BuildContext context) async {
  bool shouldPop = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const CustomText(
              text: 'Are you sure?',
              fontSize: 20,
            ),
            content: const Text('Do you want to exit tha App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const CustomText(
                  text: "No",
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const CustomText(text: 'Yes'),
              ),
            ],
          );
        },
      ) ??
      false; // Return false if dialog is dismissed

  if (shouldPop) {
    Navigator.of(context).maybePop();
  }
}
