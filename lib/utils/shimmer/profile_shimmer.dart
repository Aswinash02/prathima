import 'package:flutter/material.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class ProfileSimmer extends StatelessWidget {
  const ProfileSimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyTheme.grey_153.withOpacity(0.4),
      highlightColor: MyTheme.grey_153.withOpacity(0.08),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: 150,
              color: Colors.white,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: 60,
                        color: Colors.white,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
