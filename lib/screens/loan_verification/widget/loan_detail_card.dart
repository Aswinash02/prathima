import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

class LoanDetailCard extends StatelessWidget {
  const LoanDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: MyTheme.mainColor.withOpacity(0.1)),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CustomIcon(
                        icon: "assets/icon/briefcase.png",
                        height: 30,
                        width: 30,
                        color: MyTheme.mainColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Amount you need from",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: "Loki Bank",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: "Set Amount",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              GetBuilder<LoanController>(builder: (loanController) {
                return SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 12.0,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 24.0),
                    activeTrackColor: MyTheme.mainColor,
                    inactiveTrackColor: MyTheme.mainColor.withOpacity(0.3),
                  ),
                  child: Slider(
                      value: loanController.currentSliderValue,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      activeColor: MyTheme.mainColor,
                      label:
                          loanController.currentSliderValue.round().toString(),
                      onChanged: loanController.onChangeSliderValue),
                );
              }),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Starts From",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: MyTheme.font_grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: "₹5000",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: MyTheme.font_grey,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        text: "Limit",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: MyTheme.font_grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: "₹300000",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: MyTheme.font_grey,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: CustomButton(
                text: "Proceed",
                // fontSize: 16,
                onTap: () {
                  Get.toNamed(RouteHelper.kycDetail);
                },
                // borderRadius: 20,
                // horizontalPadding: 90,
                // padding: 10,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
