import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class HouseTypeDropdown extends StatelessWidget {
  const HouseTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      return DropdownButtonFormField(
        value: kycController.selectedAddress,
        onChanged: kycController.onChangeDropdown,
        items: kycController.dropdownItems.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: "Select Address",
          hintStyle: const TextStyle(color: MyTheme.grey_153),
          contentPadding: const EdgeInsets.all(12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
      );
    });
  }
}
