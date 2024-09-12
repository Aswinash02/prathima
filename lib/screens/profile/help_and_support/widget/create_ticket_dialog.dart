import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/loan_agreement_screen/widget/loan_agreement_form.dart';
import 'package:prathima_loan_app/screens/profile/help_and_support/widget/priority_dropdown_button.dart';
import 'package:prathima_loan_app/utils/colors.dart';

void showCreateTicketDialog() {
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
          const CustomText(
            text: "Subject",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
              width: double.infinity,
              height: 35,
              child: CustomTextField(
                controller: Get.find<ProfileController>().subjectController,
                hintText: "Enter Subject",
                hintFontSize: 12,
              )),
          const SizedBox(
            height: 8,
          ),
          const CustomText(
            text: "Ticket File",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
              width: double.infinity,
              height: 35,
              child: GetBuilder<ProfileController>(builder: (controller) {
                return CustomTextField(
                  controller: TextEditingController(
                      text: controller.pickedTicketFile != null
                          ? controller.pickedTicketFile!.name
                          : ''),
                  readOnly: true,
                  hintText: "Select File",
                  hintFontSize: 12,
                  onTap: () {
                    controller.pickFiles("ticketFile");
                  },
                );
              })),
          const SizedBox(
            height: 8,
          ),
          const CustomText(
            text: "Priority",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 2,
          ),
          GetBuilder<ProfileController>(builder: (controller) {
            return PriorityTextField(
              itemList: controller.priorityLevel,
              hintText: "Select Priority",
              onChange: controller.onChangePriorityLevel,
              value: controller.selectedPriority,
              hintTextFontSize: 12,
            );
          }),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.find<ProfileController>().clearData();
            Get.back();
          },
          child: const CustomText(text: 'Cancel', color: MyTheme.accent_color),
        ),
        GetBuilder<ProfileController>(builder: (controller) {
          return CustomButton(
            loading: controller.createTicketLoadingState,
            onTap: () => controller.createTicket(),
            text: "Create",
            width: 70,
            height: 30,
            fontSize: 14,
            circularProgressSize: 15,
          );
        })
      ],
    ),
  ).then((_) => Get.find<ProfileController>().clearData());
}
