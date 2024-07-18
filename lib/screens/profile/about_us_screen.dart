import 'package:flutter/material.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/profile/widget/profile_text_row.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "About Us",
        titleColor: MyTheme.blackColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            const Text(
                "There are many variations of passages of Lorem Ipsum available, "
                "but the majority have suffered alteration in some form, by injected humour,"
                " or randomised words believable. It is a long established fact that reader "
                "will distracted by the readable content of a page when looking at its layout."
                " The point of using Lorem Ipsum is that it has a moreIt is a long established "
                "fact that reader will distracted by the readable content of a page when looking "
                "at its layout. The point of using Lorem Ipsum is that it has a more "),
            const SizedBox(
              height: 15,
            ),
            profileTextRow(
                text: 'The standard chunk of lorem Ipsum used since  1500s is '
                    'reproduced below for those interested. '),
            const SizedBox(
              height: 15,
            ),
            profileTextRow(
                text: 'Sections 1.10.32 and 1.10.33 from "de '
                    'Finibus Bonorum et Malorum. The point of using.'),
            const SizedBox(
              height: 15,
            ),
            profileTextRow(
                text: ' Lorem Ipsum is that it has a moreIt is a long '
                    'established fact that reader will distracted.'),
            const SizedBox(
              height: 15,
            ),
            profileTextRow(
                text: 'The point of using Lorem Ipsum is that it has a moreIt '
                    'is a long established fact that reader will distracted.'),
          ],
        ),
      ),
    );
  }
}
