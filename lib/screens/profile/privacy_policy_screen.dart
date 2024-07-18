import 'package:flutter/material.dart';
import 'package:prathima_loan_app/screens/home/widget/custom_appbar.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  bool _isCheckBox = false;

  void onChange(bool? value) {
    _isCheckBox = value!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Privacy and Policy",
        titleColor: MyTheme.blackColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hi，there"),
              const Text("As needed to provide you with products or services, "
                  "with your authorization or consent,we need these permissions."),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  "SMS:  Only read and store the financial transactional SMS about "
                  "bank related transactions and no personal messages are collected. "
                  "These financial transaction messages will only be used for credit "
                  "assessment and be uploaded using the most secure data transfer protocol "
                  "with data encryption."),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  "Storage:  We require storage information permissions that "
                  "allow the Application to upload photos or documents,this helps "
                  "provide a very smooth seamless experience while using the app."),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  "Contacts:  The contact list is used only for credit review and will "
                  "not be shared with any third-party organizations without your permission. "
                  "We will scan and upload the contact list using the most secure data transfer "
                  "protocol with data encryption."),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  "Location:  User location helps to locate and verify the address "
                  "which helps in making better credit risk decisions and fasten the"
                  " Know Your Customer (KYC) process."),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  "Camera:  Camera access is required so that user can easily scan or "
                  "capture identity documents,etc. and save time by allowing us to auto-fill"
                  " the required data and helps in improving the user journey and experience."),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  "Phone State:  Collect and monitor specific information about your "
                  "phone like your phone's unique device identifier, user profile information"
                  " as this information helps us in uniquely identifying a user, so that we can "
                  "detect and prevent any unauthorized device from acting on your behalf. "
                  "This enables us to detect fraud and manage risks better."),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isCheckBox,
                    onChanged: onChange,
                    focusColor: MyTheme.mainColor,
                    activeColor: MyTheme.mainColor,
                  ),
                  const Expanded(
                      child: Text(
                          "I have read and accept to the Privacy Policies.")),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: "Accept",
                  onTap: _isCheckBox ? null : () {},
                  color: _isCheckBox ? MyTheme.mainColor : MyTheme.grey_153)
            ],
          ),
        ),
      ),
    );
  }
}
