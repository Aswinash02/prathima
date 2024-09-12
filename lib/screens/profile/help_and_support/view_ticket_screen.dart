import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/profile/help_and_support/widget/discussion_container.dart';
import 'package:prathima_loan_app/screens/profile/help_and_support/widget/reference_container.dart';
import 'package:prathima_loan_app/utils/shimmer/profile_shimmer.dart';

class ViewTicketScreen extends StatefulWidget {
  const ViewTicketScreen({super.key});

  @override
  State<ViewTicketScreen> createState() => _ViewTicketScreenState();
}

class _ViewTicketScreenState extends State<ViewTicketScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCall();
  }

  Future<void> initCall() async {
    await Get.find<ProfileController>().viewTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<ProfileController>(builder: (controller) {
          return CustomText(
            text: controller.viewTicketData != null
                ? controller.viewTicketData!.subject ?? ''
                : 'View Tickets',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          );
        }),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<ProfileController>(builder: (controller) {
        return controller.viewTicketLoadingState
            ? const ProfileSimmer()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      referenceContainer(),
                      const SizedBox(
                        height: 15,
                      ),
                      discussionContainer(),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
