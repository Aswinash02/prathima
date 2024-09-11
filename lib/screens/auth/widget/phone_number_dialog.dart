import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/data/model/phone_number_model.dart';

void showPhoneNumberDialog(PhoneNumberModel value) {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Continue with',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.data!.length,
              itemBuilder: (context, index) {
                final data = value.data![index];
                final phoneNumber = data.phoneNumber?.substring(2);
                return phoneNumber != null
                    ? ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                          child: const Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        title: Text(
                          phoneNumber,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          Get.find<AuthController>()
                              .onSelectPhoneNumber(phoneNumber);
                          Get.back();
                        },
                      )
                    : const SizedBox();
              }),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Text(
              'NONE OF THE ABOVE',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    ),
  ).then((value) => Get.find<AuthController>().changeDialogStatus());
}
