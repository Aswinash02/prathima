import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class DocUploadContainer extends StatelessWidget {
  final String textString;
  final void Function() onTap;
  final PlatformFile? selectedFile;

  const DocUploadContainer({
    super.key,
    required this.textString,
    required this.onTap,
    this.selectedFile,
  });

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
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Row(
                    children: [
                      const Image(image: AssetImage("assets/img/pdf_img.png")),
                      Expanded(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 4),
                              child: CustomText(
                                text: selectedFile!.name,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                  child: CustomText(
                    text: "Upload +",
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
