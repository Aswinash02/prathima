import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/profile/help_and_support/widget/profile_container.dart';
import 'package:prathima_loan_app/utils/colors.dart';

Widget referenceContainer() {
  return GetBuilder<ProfileController>(builder: (controller) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.shade400)),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Reported By :",
            color: MyTheme.font_grey,
            fontSize: 18,
          ),
          const SizedBox(
            height: 5,
          ),
          profileContainer(
            isAdmin: false,
            name: controller.viewTicketData!.user ?? '',
          ),
          const SizedBox(
            height: 6,
          ),
          const CustomText(
            text: "Assigned To :",
            color: MyTheme.font_grey,
            fontSize: 18,
          ),
          const SizedBox(
            height: 5,
          ),
          profileContainer(
            isAdmin: true,
            name: "Admin",
          ),
          const SizedBox(
            height: 6,
          ),
          const CustomText(
            text: "Created On :",
            color: MyTheme.font_grey,
            fontSize: 18,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: controller.viewTicketData!.createdAt ?? '',
            fontSize: 16,
          ),
          const SizedBox(
            height: 10,
          ),
          // const CustomText(
          //   text: "Updated On :",
          //   color: MyTheme.font_grey,
          //   fontSize: 18,
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // const CustomText(
          //   text: "09-Aug-2024 12:10:PM",
          //   fontSize: 16,
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          const CustomText(
            text: "Status :",
            color: MyTheme.font_grey,
            fontSize: 18,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: controller.viewTicketData!.status.toString(),
            fontSize: 16,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            text: "Priority :",
            color: MyTheme.font_grey,
            fontSize: 18,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: controller.viewTicketData!.priority ?? '',
            fontSize: 16,
          ),
        ],
      ),
    );
  });
}
