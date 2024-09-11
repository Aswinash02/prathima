import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/screens/profile/kyc_details/widget/details_row.dart';
import 'package:prathima_loan_app/screens/profile/kyc_details/widget/image_container.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class KYCDetailsScreen extends StatelessWidget {
  const KYCDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "KYC Details",
        titleColor: MyTheme.blackColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/img/success_img.png",
                    height: 160, width: 160),
              ),
              const SizedBox(
                height: 40,
              ),
              detailsRow(title: "Name", value: ''),
              detailsRow(title: "Gender", value: ''),
              detailsRow(title: "DOB", value: ''),
              detailsRow(title: "Address", value: ''),
              detailsRow(title: "House Type", value: ''),
              detailsRow(title: "Aadhaar Number", value: '', titleWidth: 140),
              detailsRow(title: "Pan Number", value: '', titleWidth: 140),
              imageContainer(imgName: 'Aadhaar Image         ', imgUrl: ''),
              imageContainer(imgName: 'Pan Image                 ', imgUrl: ''),
              imageContainer(imgName: 'Smart Card Image    ', imgUrl: ''),
              imageContainer(imgName: 'License Image           ', imgUrl: ''),
              imageContainer(imgName: 'Gas Slip Image          ', imgUrl: ''),
              imageContainer(imgName: 'Broadband Bill Image', imgUrl: ''),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Work Info",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              detailsRow(title: "Emp Type", value: '', titleWidth: 150),
              detailsRow(title: "Company Name", value: '', titleWidth: 150),
              detailsRow(title: "Email Id", value: '', titleWidth: 150),
              detailsRow(title: "Location", value: '', titleWidth: 150),
              imageContainer(imgName: 'Pay Slip Month1          ', imgUrl: ''),
              imageContainer(imgName: 'Pay Slip Month2          ', imgUrl: ''),
              imageContainer(imgName: 'Pay Slip Month3          ', imgUrl: ''),
              imageContainer(
                  imgName: 'ID Card                          ', imgUrl: ''),
              const Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Bank Info",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              detailsRow(title: "Name", value: '', titleWidth: 150),
              detailsRow(title: "Acc Number", value: '', titleWidth: 150),
              detailsRow(title: "IFSC Code", value: '', titleWidth: 150),
              detailsRow(title: "Bank Name", value: '', titleWidth: 150),
              imageContainer(imgName: 'Pass Book Image        ', imgUrl: ''),
            ],
          ),
        ),
      ),
    );
  }
}
