import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/home_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

void initPermissionDialog() {
  Get.find<HomeController>().changeDialogStatus(true);
  Get.dialog(
    barrierDismissible: false,
    alertDialog(
      onTap: () {
        Get.back();
      },
      buttonText: "Allow",
      title:
          "You will be asked for below permission next please allow to proceed",
    ),
  ).then((value) => Get.find<HomeController>().changeDialogStatus(false));
}

Widget permissionRow(
    {required String icon, required String title, required String value}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: MyTheme.grey_153.withOpacity(0.4))),
        child: CustomIcon(
          icon: icon,
          height: 25,
          width: 25,
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            CustomText(
              text: value,
              fontSize: 12,
              color: MyTheme.grey_153,
              maxLines: 6,
            )
          ],
        ),
      )
    ],
  );
}

Widget alertDialog(
    {required void Function() onTap,
    required String buttonText,
    required String title}) {
  return AlertDialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: SizedBox(
              height: 100,
              width: 70,
              child: Image(image: AssetImage("assets/icon/security_icon.jpg"))),
        ),
        CustomText(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        permissionRow(
            icon: 'assets/icon/location_icon.png',
            title: "Location",
            value: "We use and store this to identify "
                "serviceable locations which may help in faster approvals."),
        const SizedBox(height: 10),
        permissionRow(
            icon: 'assets/icon/contact_icon.png',
            title: "Contacts",
            value: "We use and store this to detect and evaluate risks "
                "to provide you with the best offers."),
        const SizedBox(height: 10),
        permissionRow(
            icon: 'assets/icon/sms_icon.png',
            title: "SMS",
            value:
                "We use and store your SMS data including (but not limited to)"
                " transactions, credits, debits, etc to evaluate creditworthiness"
                " to provide you with credit limits and personalized offers."),
        const SizedBox(height: 10),
        permissionRow(
            icon: 'assets/icon/storage_icon.png',
            title: "Storage",
            value: "We need storage access to save your documents "
                "and other relevant information securely."),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIcon(
              icon: "assets/icon/privacy_security_icon.png",
              color: Colors.green,
            ),
            SizedBox(width: 6),
            CustomText(
              text: "Your information is safe with us",
              fontSize: 12,
              color: Colors.green,
            )
          ],
        )
      ],
    ),
    actions: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: MyTheme.mainColor, borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: CustomText(
            text: buttonText,
            color: MyTheme.white,
          ),
        ),
      )
    ],
  );
}
