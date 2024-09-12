import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/data/model/support_tickets_model.dart';
import 'package:prathima_loan_app/screens/profile/kyc_details/widget/details_row.dart';

Widget ticketCard(TicketData data) {
  return GestureDetector(
    onTap: () => Get.find<ProfileController>().onTapViewTicket(data.id!),
    child: Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Column(
          children: [
            detailsRow(
                title: "Code",
                value: data.code ?? '',
                fontSize: 14,
                fontPadding: 0.0,
                titleWidth: 60),
            const SizedBox(height: 6),
            detailsRow(
                title: "Subject",
                value: data.subject ?? '',
                fontSize: 14,
                fontPadding: 0.0,
                titleWidth: 60),
            const SizedBox(height: 6),
            detailsRow(
                title: "Priority",
                value: data.priority ?? "",
                fontSize: 14,
                fontPadding: 0.0,
                titleWidth: 60),
          ],
        ),
      ),
    ),
  );
}
