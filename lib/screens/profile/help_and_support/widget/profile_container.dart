import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';

Widget profileContainer(
    {required bool isAdmin,
    String? name,
    String? dateAndTime,
    String? message}) {
  return SizedBox(
    width: double.infinity,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: isAdmin
              ? const AssetImage("assets/img/admin_avatar.png")
              : const AssetImage("assets/img/user_avatar.png"),
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 145,
                  child: CustomText(
                    text: name ?? '',
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    maxLines: 2,
                  ),
                ),
                CustomText(
                  text: dateAndTime ?? '',
                  fontSize: 12,
                  color: MyTheme.font_grey,
                ),
              ],
            ),
            SizedBox(
              width: 260,
              child: CustomText(
                text: message ?? '',
                color: MyTheme.font_grey,
                maxLines: 20,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
