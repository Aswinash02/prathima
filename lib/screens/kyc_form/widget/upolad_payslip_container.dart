import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class UploadPaySlipContainer extends StatelessWidget {
  final String textString;
  final void Function() onTapMonth1;
  final void Function() onTapMonth2;
  final void Function() onTapMonth3;

  const UploadPaySlipContainer(
      {super.key,
      required this.textString,
      required this.onTapMonth1,
      required this.onTapMonth2,
      required this.onTapMonth3});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          children: [
            CustomText(
              text: textString,
              textAlign: TextAlign.center,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: MyTheme.font_grey,
              maxLines: 3,
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: onTapMonth1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                  child: CustomText(
                    text: "Month 1 +",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: onTapMonth2,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                  child: CustomText(
                    text: "Month 2 +",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: onTapMonth3,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                  child: CustomText(
                    text: "Month 3 +",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
