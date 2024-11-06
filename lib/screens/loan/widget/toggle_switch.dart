import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/utils/colors.dart';

Widget toggleSwitch() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: GetBuilder<LoanController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: MyTheme.mainColor.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(controller.loanTypesList.length, (index) {
            bool isSelected = controller.selectedLoanIndex == index;
            return index == 0
                ? const SizedBox()
                : GestureDetector(
                    onTap: () => controller.onChangeLoanIndex(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? MyTheme.mainColor
                            : MyTheme.mainColor.withOpacity(0.2),
                        borderRadius: isSelected
                            ? BorderRadius.circular(4.0)
                            : BorderRadius.circular(0.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      child: Center(
                        child: Text(
                          controller.loanTypesList[index].name ?? '',
                          style: TextStyle(
                            color:
                                isSelected ? MyTheme.white : MyTheme.blackColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  );
          }),
        ),
      );
    }),
  );
}
