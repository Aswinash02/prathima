import 'dart:convert';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:prathima_loan_app/data/model/kyc_model.dart';
import 'package:prathima_loan_app/data/model/login_model.dart';
import 'package:prathima_loan_app/utils/app_constant.dart';
import 'package:prathima_loan_app/utils/shared_preferences.dart';

class KycRepository extends GetxService {
  final ApiClient apiClient;

  KycRepository({required this.apiClient});

  Future<KycResponseModel> sendKYCData(KycData kycData) async {
    String userData = await SharedPreference().getUserData();
    LoginResponse decodeUserData = LoginResponse.fromJson(jsonDecode(userData));
    var uri = Uri.parse(AppConstants.baseUrl + AppConstants.userKycUrl);
    var request = http.MultipartRequest('POST', uri);
    // Add headers
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer ${decodeUserData.token}',
    });

    // Add text fields
    request.fields['aadhar_number'] = kycData.aadhaarNumber;
    request.fields['loan_details_id'] = kycData.id.toString();
    request.fields['kyc_payment_details_id'] = kycData.paymentDetailsId.toString();
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
    request.fields['house_type'] = kycData.houseType;

    // Add files
    request.files.add(
        await http.MultipartFile.fromPath('pan_file', kycData.panFile.path));
    request.files.add(await http.MultipartFile.fromPath(
        'aadhar_file', kycData.aadhaarFile.path));
    if (kycData.houseType == 'Own House') {
      request.files.add(await http.MultipartFile.fromPath(
          'property_tax_receipt', kycData.propertyTaxReceipt.path));
      request.files.add(await http.MultipartFile.fromPath(
          'rental_agreement', kycData.rentalAgreement.path));
    }

    request.files.add(await http.MultipartFile.fromPath(
        'smart_card_file', kycData.smartCardFile.path));
    request.files.add(await http.MultipartFile.fromPath(
        'driving_license_file', kycData.drivingLicenseFile.path));
    request.files.add(await http.MultipartFile.fromPath(
        'recent_gas_bill', kycData.recentGasBill.path));
    request.files.add(await http.MultipartFile.fromPath(
        'recent_broadband_bill', kycData.recentBroadbandBill.path));
    request.files.add(
        await http.MultipartFile.fromPath('pay_slip1', kycData.paySlip1.path));
    request.files.add(
        await http.MultipartFile.fromPath('pay_slip2', kycData.paySlip2.path));
    request.files.add(
        await http.MultipartFile.fromPath('pay_slip3', kycData.paySlip3.path));

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
      return kycResponse;
    } else {
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);
      var kycResponse = KycResponseModel.fromJson(jsonResponse);
      return kycResponse;
    }
  }

  Future<KycResponseModel> updateKYCData(KycData kycData) async {
    String userData = await SharedPreference().getUserData();
    LoginResponse decodeUserData = LoginResponse.fromJson(jsonDecode(userData));
    var uri = Uri.parse(AppConstants.baseUrl + AppConstants.updateKycUrl);
    var request = http.MultipartRequest('POST', uri);

    // Add headers
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer ${decodeUserData.token}',
    });

    // Add text fields
    request.fields['aadhar_number'] = kycData.aadhaarNumber;
    request.fields['loan_details_id'] = kycData.id.toString();
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
    request.fields['house_type'] = kycData.houseType;

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
    request.files.add(
        await http.MultipartFile.fromPath('pay_slip1', kycData.paySlip1.path));
    request.files.add(
        await http.MultipartFile.fromPath('pay_slip2', kycData.paySlip2.path));
    request.files.add(
        await http.MultipartFile.fromPath('pay_slip3', kycData.paySlip3.path));

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
      showCustomSnackBar("KYC data Updated successfully", isError: false);
      return kycResponse;
    } else {
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);

      var kycResponse = KycResponseModel.fromJson(jsonResponse);
      return kycResponse;
    }
  }

  Future<Response> getKycStatus() async {
    return await apiClient.postData(
      AppConstants.kycStatusUrl,
      {},
    );
  }

  Future<Response> getAgreements() async {
    return await apiClient.getData(
      AppConstants.agreementUrl,
    );
  }

  Future<Response> aadhaarVerify(String aadhaarNumber) async {
    return await apiClient.postData(
      AppConstants.aadhaarVerifyUrl,
      {"aadhaar_number": aadhaarNumber},
    );
  }

  Future<Response> aadhaarOTPVerify(String referenceNumber, String otp) async {
    return await apiClient.postData(
      AppConstants.aadhaarOTPVerifyUrl,
      {"reference_id": referenceNumber, "otp": otp},
    );
  }

  Future<Response> bankVerify(
      String accountNumber, String ifscCode, String phone) async {
    return await apiClient.postData(AppConstants.bankVerifyUrl, {
      "account_number": accountNumber,
      "ifsc_code": ifscCode,
      "phone_number": phone
    });
  }

  Future<Response> kycAmountPaidStatus(Map<String, dynamic> body) async {
    return await apiClient.postData(AppConstants.kycAmountPaidStatusUrl, body);
  }

  Future<Response> kycAmountPay(Map<String, dynamic> body) async {
    return await apiClient.postData(AppConstants.kycAmountPayUrl, body);
  }

  Future<Response> panVerify(String panNumber) async {
    String userData = await SharedPreference().getUserData();
    LoginResponse decodeUserData = LoginResponse.fromJson(jsonDecode(userData));
    return await apiClient.postData(AppConstants.panVerifyUrl, {
      "phone_number": decodeUserData.user!.phoneNumber,
      "pan_number": panNumber
    });
  }

  Future<Response> getUserKycData() async {
    return await apiClient.getData(AppConstants.userDataUrl);
  }
}
