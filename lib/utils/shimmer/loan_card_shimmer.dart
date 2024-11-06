import 'package:flutter/material.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class LoanCardShimmer extends StatelessWidget {
  const LoanCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyTheme.grey_153.withOpacity(0.4),
      highlightColor: MyTheme.grey_153.withOpacity(0.08),
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 160,
              ),
            );
          }),
    );
  }
}
