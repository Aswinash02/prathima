import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class PriorityTextField extends StatelessWidget {
  final List<String> itemList;
  final String hintText;
  final void Function(String?) onChange;
  final String? value;
  final double? hintTextFontSize;

  const PriorityTextField({
    super.key,
    required this.itemList,
    required this.hintText,
    required this.onChange,
    required this.value,
    this.hintTextFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return SizedBox(
        height: 35,
        child: DropdownButtonFormField(
          value: value,
          onChanged: onChange,
          items: itemList.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          style: const TextStyle(fontSize: 14, color: MyTheme.blackColor),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
                color: MyTheme.grey_153, fontSize: hintTextFontSize ?? 14),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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
        ),
      );
    });
  }
}
