import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/app_constant.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

Widget imageContainer(
    {required String imgName,
      required String imgUrl,
      required BuildContext context}) {
  Uri uri = Uri.parse(imgUrl);
  String filename = uri.pathSegments.last;
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
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.all(10.0),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          imgUrl.toLowerCase().endsWith('.pdf')
                              ? Expanded(
                                child: SfPdfViewer.network(
                                "${AppConstants.baseUrl}$imgUrl"),
                              )
                              : Image.network("${AppConstants.baseUrl}$imgUrl"),
                          const SizedBox(height: 10),
                          CustomText(text: imgName),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const CustomText(
                            text: 'Close',
                            color: MyTheme.mainColor,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.visibility,
                    color: MyTheme.mainColor,
                    size: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 4),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200), // Ensure finite width
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CustomText(
                            text: filename,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
