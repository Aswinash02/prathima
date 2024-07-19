import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:prathima_loan_app/models/kyc_model.dart';
import 'package:prathima_loan_app/utils/shared_preferences.dart';

class KycRepository extends GetxService {
  final ApiClient apiClient;

  KycRepository({required this.apiClient});

  Future<KycResponseModel> sendKYCData(KycData kycData) async {
    String userToken = await SharedPreference().getUserToken();
    var uri = Uri.parse('https://prathima.v4inspire.com/api/loan/user-kyc');
    var request = http.MultipartRequest('POST', uri);

    // Add headers
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $userToken',
      // Add other headers if needed
    });

    // Add text fields
    request.fields['aadhar_number'] = kycData.aadhaarNumber;
    request.fields['pan_number'] = kycData.panNumber;
    request.fields['account_number'] = kycData.accountNumber;
    request.fields['ifsc_code'] = kycData.ifscCode;
    request.fields['bank_name'] = kycData.bankName;
    request.fields['account_holder_name'] = kycData.accountHolderName;
    request.fields['loan_amount'] = kycData.loanAmount;

    request.fields['company_name'] = kycData.companyName;
    request.fields['company_email'] = kycData.companyEmail;
    request.fields['company_location'] = kycData.companyLocation;
    request.fields['address'] = kycData.address;
    request.fields['employment_type'] = kycData.employmentType;

    // Add files
    request.files.add(
        await http.MultipartFile.fromPath('pan_file', kycData.panFile.path));
    request.files.add(await http.MultipartFile.fromPath(
        'aadhar_file', kycData.aadhaarFile.path));
    request.files.add(await http.MultipartFile.fromPath(
        'property_tax_receipt', kycData.propertyTaxReceipt.path));
    request.files.add(await http.MultipartFile.fromPath(
        'rental_agreement', kycData.rentalAgreement.path));
    request.files.add(await http.MultipartFile.fromPath(
        'smart_card_file', kycData.smartCardFile.path));
    request.files.add(await http.MultipartFile.fromPath(
        'driving_license_file', kycData.drivingLicenseFile.path));
    request.files.add(await http.MultipartFile.fromPath(
        'recent_gas_bill', kycData.recentGasBill.path));
    request.files.add(await http.MultipartFile.fromPath(
        'recent_broadband_bill', kycData.recentBroadbandBill.path));

    for (File file in kycData.paySlip) {
      request.files
          .add(await http.MultipartFile.fromPath('pay_slip', file.path));
    }

    request.files
        .add(await http.MultipartFile.fromPath('id_card', kycData.idCard.path));
    request.files.add(await http.MultipartFile.fromPath(
        'pf_member_passbook', kycData.pfMemberPassbook.path));

    // Send request
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);
      var kycResponse = KycResponseModel.fromJson(jsonResponse);
      showCustomSnackBar("KYC data uploaded successfully", isError: false);
      print("KYC Success Message=============>${kycResponse.message}");
      return kycResponse;
    } else {
      var responseData = await response.stream.bytesToString();
      // var jsonResponse = json.decode(responseData);

      var kycResponse = KycResponseModel(
          message: 'Failed to upload KYC data: ${response.statusCode}',
          result: false);
      showCustomSnackBar(kycResponse.message);
      print("KYC Success Message=============>${kycResponse.message}");
      return kycResponse;
    }
  }
}
