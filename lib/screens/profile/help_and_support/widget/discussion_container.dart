import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/screens/profile/help_and_support/widget/profile_container.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

Widget discussionContainer() {
  return GetBuilder<ProfileController>(builder: (controller) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.shade400)),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Customer Support Discussion",
            fontSize: 22,
          ),
          const SizedBox(
            height: 5,
          ),
          if (controller.viewTicketData!.message!.data!.isNotEmpty)
            for (int i = 0;
                i < controller.viewTicketData!.message!.data!.length;
                i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: profileContainer(
                    isAdmin:
                        controller.viewTicketData!.message!.data![i].user ==
                                controller.viewTicketData!.user
                            ? false
                            : true,
                    name:
                        controller.viewTicketData!.message!.data![i].user ?? '',
                    dateAndTime:
                        controller.viewTicketData!.message!.data![i].createdAt,
                    message:
                        controller.viewTicketData!.message!.data![i].reply),
              ),
          const SizedBox(
            height: 20,
          ),
          controller.pickedMessageFile != null
              ? Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: 40,
                      width: 35,
                      child: const CustomIcon(
                        icon: 'assets/icon/file_icon.png',
                      ),
                    ),
                    Positioned(
                        top: -3,
                        right: -3,
                        child: GestureDetector(
                          onTap: () => controller.removePickedMessageFile(),
                          child: const Icon(
                            Icons.clear,
                            color: Colors.red,
                            size: 16,
                          ),
                        )),
                  ],
                )
              : const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: CustomTextField(
                  controller: controller.messageController,
                  maxLines: 2,
                  hintText: "Type here",
                ),
              ),
              GestureDetector(
                onTap: () => controller.pickFiles("message"),
                child: const CustomIcon(
                  icon: "assets/icon/attach_file_icon.png",
                  height: 40,
                  width: 40,
                ),
              ),
              CustomButton(
                text: "Add",
                width: 60,
                height: 40,
                fontSize: 16,
                circularProgressSize: 20,
                loading: controller.messageLoadingState,
                onTap: () => controller.sendMessage(),
              ),
            ],
          ),
        ],
      ),
    );
  });
}
