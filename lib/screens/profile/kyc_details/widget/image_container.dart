import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';

Widget imageContainer(
    {required String imgName, required String imgUrl}) {
  // Uri uri = Uri.parse(imgUrl);
  // String filename = uri.pathSegments.last;
  return Row(
    children: [
      CustomText(
        text: imgName,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomText(
          text: ':',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: GestureDetector(
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       contentPadding: const EdgeInsets.all(10.0),
                  //       content: Column(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           Image.network(
                  //               "https://onnwheels.com/public$imgUrl"),
                  //           SizedBox(height: 10),
                  //           CustomText(text: 'License $imgName'),
                  //         ],
                  //       ),
                  //       actions: [
                  //         TextButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //           child: CustomText(
                  //             text: 'Close',
                  //             color: MyTheme.orange,
                  //           ),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.visibility,
                      color: MyTheme.mainColor,
                      size: 18,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 4),
                          child: CustomText(
                            // text: filename,
                            text: "",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    ],
  );
}