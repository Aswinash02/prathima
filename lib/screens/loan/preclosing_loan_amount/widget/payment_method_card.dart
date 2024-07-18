import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

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
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: "UPI Payment"),
              GetBuilder<LoanController>(builder: (controller) {
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.paymentMethodString.length,
                      itemBuilder: (context, index) {
                        final data = controller.paymentMethodString[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                    image: AssetImage(data.img),
                                  )),
                              SizedBox(height: 5,),
                              CustomText(
                                text: data.name,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        );
                      }),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
