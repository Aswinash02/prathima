import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:signature/signature.dart';

Future<void> signatureDialog() {
  return Get.dialog(
    GetBuilder<KycController>(builder: (controller) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        contentPadding: const EdgeInsets.all(4),
        content: Container(
          color: Colors.black,
          height: 400,
          child: Signature(controller: controller.signatureImageController),
        ),
        actionsPadding: const EdgeInsets.all(15),
        actions: [
          GestureDetector(
            onTap: () {
              controller.signatureImageController.clear();
              Get.back();
            },
            child: const CustomText(
              text: "Cancel",
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              controller.signatureImageController.clear();
            },
            child: const CustomText(
              text: "Clear",
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () => controller.onSaveSignature(),
            child: const CustomText(
              text: "Save",
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: Colors.green,
            ),
          ),
        ],
      );
    }),
  );
}
