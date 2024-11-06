import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/data/model/kyc_info_model.dart';
import 'package:prathima_loan_app/screens/profile/kyc_details/widget/details_row.dart';

Widget kycCard(KYCInfoData data) {
  return GestureDetector(
    onTap: () => Get.find<ProfileController>().onTapViewKYC(data.id!),
    child: Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Column(
          children: [
            detailsRow(
                title: "Loan Name",
                // value: data.loanInformation!.name ?? '',
                value: '',
                fontSize: 14,
                fontPadding: 0.0,
                titleWidth: 80),
            const SizedBox(height: 6),
            detailsRow(
                title: "Loan Type",
                // value: data.loanInformation!.loanType ?? '',
                value: '',
                fontSize: 14,
                fontPadding: 0.0,
                titleWidth: 80),
            const SizedBox(height: 6),
            detailsRow(
                title: "KYC Status",
                value: data.userApprovalLoanInformation != null
                    ? "Approved"
                    : "Pending",
                fontSize: 14,
                fontPadding: 0.0,
                titleWidth: 80),
          ],
        ),
      ),
    ),
  );
}
