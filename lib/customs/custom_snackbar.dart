import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/dimensions.dart';

void showCustomSnackBar(String? message,
    {bool isError = true, bool getXSnackBar = true}) {
  if (message != null && message.isNotEmpty) {
    if (getXSnackBar) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: isError ? Colors.red : MyTheme.mainColor,
        message: message,
        maxWidth: 500,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.only(
            left: Dimensions.paddingSizeSmall,
            right: Dimensions.paddingSizeSmall,
            bottom: 100),
        borderRadius: Dimensions.radiusSmall,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
      ));
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.only(
          right: Dimensions.paddingSizeSmall,
          top: Dimensions.paddingSizeSmall,
          bottom: Dimensions.paddingSizeSmall,
          left: Dimensions.paddingSizeSmall,
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : MyTheme.mainColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
        content: Text(message, style: const TextStyle(color: Colors.white)),
      ));
    }
  }
}
