import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/home_controller.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class LoanCard extends StatelessWidget {
  const LoanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: MyTheme.mainColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomText(
              text: "Cash Loan",
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: MyTheme.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomText(
              text: "Get Instant cash Upto",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: MyTheme.white,
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            color: Colors.white.withOpacity(0.6),
            padding: const EdgeInsets.all(6),
            child:  Center(
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  return CustomText(
                    text: "INR ₹${controller.initialLoanAmount}",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white,
                  );
                }
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  child: const CustomText(
                    text: 'Get Now',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),

                ),
              ),
              GetBuilder<KycController>(
                builder: (controller) {
                  return CustomText(
                    text: controller.kycText ?? '',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: MyTheme.white,
                  );
                }
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
