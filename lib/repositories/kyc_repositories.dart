import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:prathima_loan_app/controllers/kyc_controller.dart';

class KycRepositories extends GetxService {
  Future<void> sendKYCData(KycData kycData) async {
    var uri = Uri.parse('https://prathima.v4inspire.com/api/loan/user-kyc');

    var request = http.MultipartRequest('POST', uri);

    // Add text fields
    request.fields['aadhar_number'] = kycData.aadhaarNumber;
    request.fields['pan_number'] = kycData.panNumber;
    request.fields['account_number'] = kycData.accountNumber;
    request.fields['ifsc_code'] = kycData.ifscCode;
    request.fields['bank_name'] = kycData.bankName;
    // request.fields['smart_card'] = kycData.smartCard;
    request.fields['account_holder_name'] = kycData.accountHolderName;
    request.fields['loan_amount'] = kycData.loanAmount;
    // request.fields['loan'] = kycData.loan;

    // Add files
    request.files.add(
        await http.MultipartFile.fromPath('pan_file', '${kycData.panFile}'));
    request.files.add(await http.MultipartFile.fromPath(
        'aadhar_file', "${kycData.aadhaarFile}"));
    request.files.add(await http.MultipartFile.fromPath(
        'property_tax_recipet', '${kycData.propertyTaxReceipt}'));
    request.files.add(await http.MultipartFile.fromPath(
        'rental_agreement', '${kycData.rentalAgreement}'));
    request.files.add(await http.MultipartFile.fromPath(
        'smart_card_file', '${kycData.smartCardFile}'));
    request.files.add(await http.MultipartFile.fromPath(
        'driving_license_file', '${kycData.drivingLicenseFile}'));
    request.files.add(await http.MultipartFile.fromPath(
        'recent_gas_bill', '${kycData.recentGasBill}'));
    request.files.add(await http.MultipartFile.fromPath(
        'recent_broadband_bill', '${kycData.recentBroadbandBill}'));
    // request.files.add(
    //     await http.MultipartFile.fromPath('pay_slip', '${kycData.paySlip}'));
    request.files
        .add(await http.MultipartFile.fromPath('id_card', '${kycData.idCard}'));
    request.files.add(await http.MultipartFile.fromPath(
        'pf_member_passbook', '${kycData.pfMemberPassbook}'));
    for (File file in kycData.paySlip) {
      request.files
          .add(await http.MultipartFile.fromPath('pay_slip', file.path));
    }

    // Send request
    var response = await request.send();

    if (response.statusCode == 200) {
      print('KYC data uploaded successfully');
    } else {
      print('Failed to upload KYC data: ${response.statusCode}');
    }
  }
}
