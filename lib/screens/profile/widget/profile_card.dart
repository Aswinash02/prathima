import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return GestureDetector(
        onTap: () => Get.toNamed(RouteHelper.editProfileScreen),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: MyTheme.mainColor,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icon/profile_icon.png")),
                    shape: BoxShape.circle),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: CustomText(
                      text: controller.userData!.user!.name ?? '',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      maxLines: 2,
                      color: MyTheme.white,
                    ),
                  ),
                  // controller.userData!.user!.aadhaarData != null
                  //     ? SizedBox(
                  //         width: 200,
                  //         child: CustomText(
                  //           text: controller.userData!.user!.aadhaarData!.data!
                  //                   .address!.street ??
                  //               '',
                  //           maxLines: 10,
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 13,
                  //           color: MyTheme.font_grey,
                  //         ),
                  //       )
                  //     : SizedBox(),
                  // controller.userData!.user!.aadhaarData != null
                  //     ? SizedBox(
                  //         width: 200,
                  //         child: CustomText(
                  //           text: controller.userData!.user!.aadhaarData!.data!
                  //                   .address!.vtc ??
                  //               '',
                  //           maxLines: 10,
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 13,
                  //           color: MyTheme.font_grey,
                  //         ),
                  //       )
                  //     : const SizedBox(),
                  CustomText(
                    text: "+91 ${controller.userData!.user!.phoneNumber ?? ''}",
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: MyTheme.white,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8)),
                      child: CustomText(
                        text:
                            "Customer ID:${controller.userData!.user!.id ?? ''}",
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: MyTheme.white,
                      )),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.edit_square,
                color: MyTheme.white,
              )
            ],
          ),
        ),
      );
    });
  }
}
