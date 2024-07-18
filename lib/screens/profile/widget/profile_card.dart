import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteHelper.personalDetailsScreen),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: MyTheme.mainColor, borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.red),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: "Logeshwar",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: MyTheme.white,
                ),
                const CustomText(
                  text: "Monterrey, Mexico",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: MyTheme.font_grey,
                ),
                const CustomText(
                  text: "+91 82 1345 5678",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: MyTheme.white,
                ),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8)),
                    child: const CustomText(
                      text: "Customer ID:34343434",
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: MyTheme.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
