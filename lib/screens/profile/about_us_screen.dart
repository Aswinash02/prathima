import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "About Us",
        titleColor: MyTheme.blackColor,
      ),
      body: Get.find<ProfileController>().pageDataList[1].content == null
          ? const Center(
              child: Text("About Us"),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Html(
                  data: Get.find<ProfileController>().pageDataList[1].content!,
                  style: {
                    "body": Style(
                      fontSize: FontSize.large,
                      color: Colors.black87,
                    ),
                  },
                ),
              ),
            ),
    );
  }
}
