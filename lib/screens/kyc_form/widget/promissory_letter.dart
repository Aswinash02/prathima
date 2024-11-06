import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/kyc_form/widget/signature_dialog.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/shimmer/profile_shimmer.dart';

class PromissoryLetter extends StatelessWidget {
  const PromissoryLetter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Promissory Note",
        titleColor: MyTheme.blackColor,
      ),
      body: GetBuilder<KycController>(builder: (controller) {
        return controller.agreementLoadingState
            ? const ProfileSimmer()
            : controller.agreements == null &&
                    controller.agreements!.data!.isEmpty
                ? const Center(
                    child: Text("Promissory Note"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Html(
                          data: controller.agreements!.data![0].value,
                          style: {
                            "body": Style(
                              fontSize: FontSize.large,
                              color: Colors.black87,
                            ),
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: SizedBox(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(text: "Witnesses :"),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const CustomText(text: "1."),
                                  const SizedBox(width: 10),
                                  Expanded(
                                      child: SizedBox(
                                    height: 40,
                                    child: TextField(
                                        controller:
                                            controller.signatureController,
                                        decoration: const InputDecoration(
                                          hintText: "Enter Your Signature",
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          border: InputBorder.none,
                                        )),
                                  )),
                                ],
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                  onTap: () => signatureDialog(),
                                  child: const CustomText(
                                      text: "2.   Draw Your Signature")),
                              const SizedBox(height: 10),
                              if (controller.signatureImage != null)
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    color: Colors.black,
                                    child: Image.memory(
                                        controller.signatureImage!),
                                  ),
                                ),
                            ],
                          )),
                        ),
                      ],
                    ),
                  );
      }),
    );
  }
}
