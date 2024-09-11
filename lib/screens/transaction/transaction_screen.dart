import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_search_bar.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Transaction",
        titleColor: MyTheme.blackColor,
        centerTitle: true,
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      //   child: Column(
      //     children: [
      //       const Row(
      //         children: [
      //           Expanded(child: CustomSearchBar()),
      //           Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 10.0),
      //             child: CustomIcon(
      //               icon: "assets/icon/filter_icon.png",
      //               height: 30,
      //               width: 30,
      //             ),
      //           ),
      //
      //         ],
      //       ),
      //       const SizedBox(height: 20,),
      //       Column(
      //         children: [
      //           Row(
      //             children: [
      //               payButton(color: Colors.blue, text: "Pay"),
      //                const SizedBox(width: 10,),
      //               const SizedBox(
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     CustomText(
      //                       text: "Personal Loan",
      //                       fontSize: 15,
      //                       fontWeight: FontWeight.w600,
      //                     ),
      //                     SizedBox(height: 4),
      //                     CustomText(
      //                       text: "upcoming Due",
      //                       fontSize: 12,
      //                       fontWeight: FontWeight.w400,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const Spacer(),
      //               const Column(
      //                 children: [
      //                   CustomText(
      //                     text: "10/04/2024",
      //                     fontWeight: FontWeight.w500,
      //                     fontSize: 12,
      //                   ),
      //                   CustomText(
      //                       text: "20,000",
      //                       fontWeight: FontWeight.w500,
      //                       fontSize: 12),
      //                 ],
      //               ),
      //
      //
      //             ],
      //           ),
      //           const Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 20.0),
      //             child: Divider(),
      //           )
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
  Widget payButton({required Color color, required String text}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: CustomText(
          text: text,
          color: Colors.white,
        ),
      ),
    );
  }
}
