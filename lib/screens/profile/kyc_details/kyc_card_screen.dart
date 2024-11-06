import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/customs/custom_textfield.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/profile/kyc_details/widget/kyc_card.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/shimmer/loan_card_shimmer.dart';

class KYCCardScreen extends StatefulWidget {
  const KYCCardScreen({super.key});

  @override
  State<KYCCardScreen> createState() => _KYCCardScreenState();
}

class _KYCCardScreenState extends State<KYCCardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCall();
  }

  initCall() async {
    await Get.find<ProfileController>().getKYCInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'KYC Info',
        titleColor: MyTheme.blackColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<ProfileController>(builder: (controller) {
          return controller.kycInfoLoadingState
              ? const LoanCardShimmer()
              : controller.supportTicketList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 250,
                            width: 200,
                            child: Image.asset(
                                "assets/img/no_data_found_image.png"),
                          ),
                          const CustomText(
                            text: "No KYC Found",
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          )
                        ],
                      ),
                    )
                  : GetBuilder<ProfileController>(builder: (controller) {
                      return Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: CustomTextField(
                                controller: controller.searchKYCInfoController,
                                verticalContentPadding: 0,
                                horizontalContentPadding: 10,
                                onChanged: controller.searchKYCInfo,
                                prefixIcon: const Icon(Icons.search),
                                hintText: "Search KYC Info...",
                              ),
                            ),
                          ),
                          Expanded(
                            child: controller.searchKYCInfoController.text
                                        .isNotEmpty &&
                                    controller.searchKycInfoDataList.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 250,
                                          width: 200,
                                          child: Image.asset(
                                              "assets/img/no_data_found_image.png"),
                                        ),
                                        const CustomText(
                                          text: "No Search Ticket Found",
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20,
                                        )
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: controller
                                            .searchKYCInfoController
                                            .text
                                            .isEmpty
                                        ? controller.kycInfoDataList.length
                                        : controller
                                            .searchKycInfoDataList.length,
                                    itemBuilder: (context, index) {
                                      final data = controller
                                              .searchKYCInfoController
                                              .text
                                              .isEmpty
                                          ? controller.kycInfoDataList[index]
                                          : controller
                                              .searchKycInfoDataList[index];
                                      return kycCard(data);
                                    },
                                  ),
                          ),
                        ],
                      );
                    });
        }),
      ),
    );
  }
}
