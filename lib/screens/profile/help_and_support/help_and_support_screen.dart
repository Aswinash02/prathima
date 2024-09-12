import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/profile/help_and_support/widget/create_ticket_dialog.dart';
import 'package:prathima_loan_app/screens/profile/help_and_support/widget/ticket_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Help & Support",
        titleColor: MyTheme.blackColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomButton(
              text: "+ Create",
              onTap: () => showCreateTicketDialog(),
              fontSize: 14,
              width: 75,
              height: 28,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Get.find<ProfileController>().supportTicketList.isEmpty
            ? const Center(
                child: CustomText(
                  text: "No Tickets Found",
                ),
              )
            : GetBuilder<ProfileController>(builder: (controller) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: CustomTextField(
                          controller: controller.searchController,
                          verticalContentPadding: 0,
                          horizontalContentPadding: 10,
                          onChanged: controller.searchTickets,
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search Tickets...",
                        ),
                      ),
                    ),
                    Expanded(
                      child: controller.searchController.text.isNotEmpty &&
                              controller.searchSupportTicketList.isEmpty
                          ? const Center(
                              child: CustomText(
                                text: "No Search Ticket Found",
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller
                                      .searchController.text.isEmpty
                                  ? controller.supportTicketList.length
                                  : controller.searchSupportTicketList.length,
                              itemBuilder: (context, index) {
                                final data = controller
                                        .searchController.text.isEmpty
                                    ? controller.supportTicketList[index]
                                    : controller.searchSupportTicketList[index];
                                return ticketCard(data);
                              },
                            ),
                    ),
                  ],
                );
              }),
      ),
    );
  }
}
