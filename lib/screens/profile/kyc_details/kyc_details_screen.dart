import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/profile/kyc_details/widget/details_row.dart';
import 'package:prathima_loan_app/screens/profile/kyc_details/widget/image_container.dart';
import 'package:prathima_loan_app/utils/app_constant.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class KYCDetailsScreen extends StatelessWidget {
  const KYCDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: const CustomAppBar(
        title: "KYC Details",
        titleColor: MyTheme.blackColor,
      ),
      body: controller.kycData == null
          ? const Center(
              child: Text("No Data Found"),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset("assets/img/success_img.png",
                          height: 160, width: 160),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // detailsRow(title: "Name", value: ''),
                    // detailsRow(title: "Gender", value: ''),
                    // detailsRow(title: "DOB", value: ''),
                    // detailsRow(title: "Address", value: ''),

                    detailsRow(
                        title: "Aadhaar Number",
                        value: controller.kycData!.aadharNumber ?? '',
                        titleWidth: 140),
                    detailsRow(
                        title: "Pan Number",
                        value: controller.kycData!.panNumber ?? '',
                        titleWidth: 140),
                    detailsRow(
                        title: "House Type",
                        titleWidth: 140,
                        value: controller.kycData!.houseType ?? ''),
                    imageContainer(
                        imgName: 'Aadhaar Image         ',
                        imgUrl: controller.kycData!.aadharFile ?? '',
                        context: context),
                    imageContainer(
                        imgName: 'Pan Image                 ',
                        imgUrl: controller.kycData!.panFile ?? '',
                        context: context),
                    imageContainer(
                        imgName: 'Smart Card Image    ',
                        imgUrl: controller.kycData!.smartCardFile ?? '',
                        context: context),
                    imageContainer(
                        imgName: 'License Image           ',
                        imgUrl: controller.kycData!.drivingLicenseFile ?? '',
                        context: context),
                    imageContainer(
                        imgName: 'Gas Slip Image          ',
                        imgUrl: controller.kycData!.recentGasBill ?? '',
                        context: context),
                    imageContainer(
                        imgName: 'Broadband Bill Image',
                        imgUrl: controller.kycData!.recentBroadbandBill ?? '',
                        context: context),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        text: "Work Info",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    detailsRow(
                        title: "Emp Type",
                        value: controller.kycData!.employmentType ?? '',
                        titleWidth: 150),
                    detailsRow(
                        title: "Company Name",
                        value: controller.kycData!.companyName ?? '',
                        titleWidth: 150),
                    detailsRow(
                        title: "Email Id",
                        value: controller.kycData!.companyEmail ?? '',
                        titleWidth: 150),
                    detailsRow(
                        title: "Location",
                        value: controller.kycData!.companyLocation ?? '',
                        titleWidth: 150),
                    imageContainer(
                        imgName: 'Pay Slip Month1          ',
                        imgUrl: controller.kycData!.paySlip1 ?? '',
                        context: context),
                    imageContainer(
                        imgName: 'Pay Slip Month2          ',
                        imgUrl: controller.kycData!.paySlip2 ?? '',
                        context: context),
                    imageContainer(
                        imgName: 'Pay Slip Month3          ',
                        imgUrl: controller.kycData!.paySlip3 ?? '',
                        context: context),
                    imageContainer(
                        imgName: 'ID Card                          ',
                        imgUrl: controller.kycData!.idCard ?? '',
                        context: context),
                    const Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        text: "Bank Info",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    // detailsRow(title: "Name", value: controller.kycData!.bankName ?? '', titleWidth: 150),
                    detailsRow(
                        title: "Acc Number",
                        value: controller.kycData!.accountNumber ?? '',
                        titleWidth: 150),
                    detailsRow(
                        title: "IFSC Code",
                        value: controller.kycData!.ifscCode ?? '',
                        titleWidth: 150),
                    detailsRow(
                        title: "Bank Name",
                        value: controller.kycData!.bankName ?? '',
                        titleWidth: 150),
                    imageContainer(
                        imgName: 'Pass Book Image        ',
                        imgUrl: controller.kycData!.pfMemberPassbook ?? '',
                        context: context),
                  ],
                ),
              ),
            ),
    );
  }
}
