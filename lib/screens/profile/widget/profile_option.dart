import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

class ProfileOption extends StatelessWidget {
  final String option;
  final String icon;
  final void Function() onTap;

  const ProfileOption(
      {super.key,
      required this.option,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                CustomIcon(
                  icon: icon,
                  height: 40,
                  width: 40,
                  color: MyTheme.mainColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                CustomText(
                  text: option,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                )
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}