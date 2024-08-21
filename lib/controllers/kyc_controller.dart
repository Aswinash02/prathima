import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prathima_loan_app/controllers/auth_controller.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/api/api_checker.dart';
import 'package:prathima_loan_app/data/model/aadhaar_otp_model.dart';
import 'package:prathima_loan_app/data/model/aadhar_verify_model.dart';
import 'package:prathima_loan_app/data/model/bank_verify_model.dart';
import 'package:prathima_loan_app/data/model/kyc_status_model.dart';
import 'package:prathima_loan_app/data/model/pan_verify_model.dart';
import 'package:prathima_loan_app/data/model/user_data_model.dart';
import 'package:prathima_loan_app/data/repository/kyc_repository.dart';
import 'package:prathima_loan_app/models/login_model.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

enum PickedFile {
  aadhaarCard,
  panCard,
  smartCard,
  drivingLicense,
  broadBandSlip,
  gasSlip,
  taxReceipt,
  rentReceipt,
  paySlipMonth1,
  paySlipMonth2,
  paySlipMonth3,
  idCard,
  pfPassBook
}

class KycData {
  final String aadhaarNumber;
  final String panNumber;
  final String accountNumber;
  final String ifscCode;
  final String bankName;
  final String accountHolderName;
  final String loanAmount;
  final String houseType;
  final String companyName;
  final String companyEmail;
  final String companyLocation;
  final String address;
  final String employmentType;
  final File panFile;
  final File aadhaarFile;
  final File propertyTaxReceipt;
  final File rentalAgreement;
  final File smartCardFile;
  final File drivingLicenseFile;
  final File recentGasBill;
  final File recentBroadbandBill;
  final File paySlip1;
  final File paySlip2;
  final File paySlip3;
  final File idCard;
  final File pfMemberPassbook;

  const KycData({
    required this.aadhaarNumber,
    required this.panNumber,
    required this.accountNumber,
    required this.ifscCode,
    required this.bankName,
    required this.accountHolderName,
    required this.loanAmount,
    required this.houseType,
    required this.companyName,
    required this.companyEmail,
    required this.companyLocation,
    required this.address,
    required this.employmentType,
    required this.panFile,
    required this.aadhaarFile,
    required this.propertyTaxReceipt,
    required this.rentalAgreement,
    required this.smartCardFile,
    required this.drivingLicenseFile,
    required this.recentGasBill,
    required this.recentBroadbandBill,
    required this.paySlip1,
    required this.paySlip2,
    required this.paySlip3,
    required this.idCard,
    required this.pfMemberPassbook,
  });
}

class KycController extends GetxController implements GetxService {
  final KycRepository kycRepository;

  KycController({required this.kycRepository});

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseTypeController = TextEditingController();
  TextEditingController aadhaarNumberController = TextEditingController();
  TextEditingController aadhaarNumberOTPController = TextEditingController();
  TextEditingController gasSlipNumberController = TextEditingController();
  TextEditingController broadBandBillNumberController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController employmentTypeController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyEmailController = TextEditingController();
  TextEditingController companyLocationController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  final List<String> _houseType = ["Own House", "Rent House"];
  final List<String> _genderType = ["Male", "Female", "TransGender"];
  PlatformFile? _pickedTaxReceipt;
  PlatformFile? _pickedRentReceipt;
  PlatformFile? _pickedAadhaarCard;
  PlatformFile? _pickedSmartCard;
  PlatformFile? _pickedIdCard;
  PlatformFile? _pickedPaySlipMonth1;
  PlatformFile? _pickedPaySlipMonth2;
  PlatformFile? _pickedPaySlipMonth3;
  PlatformFile? _pickedPfPassBook;
  PlatformFile? _pickedGasSlip;
  PlatformFile? _pickedBroadBandSlip;
  PlatformFile? _pickedPanCard;
  PlatformFile? _pickedDrivingLicense;
  String? _selectedAddress;
  String? _selectedGender;
  int _activeStep = 0;
  bool _isKycVerified = false;
  bool _aadhaarVerified = false;
  bool _bankVerified = false;
  bool _isPanVerified = false;
  bool _isEnableOTP = false;
  bool _loadingState = false;
  bool _otpLoadingState = false;
  bool _panLoadingState = false;
  bool _kycLoadingState = false;
  bool _kycDataLoadingState = false;
  bool _isUpdateKyc = false;
  int? _refNum;
  UserDataModel? _userKYCData;
  KycStatusModel? _kycStatus;

  List<String> get houseType => _houseType;

  List<String> get genderType => _genderType;

  String? get selectedAddress => _selectedAddress;

  String? get selectedGender => _selectedGender;

  int get activeStep => _activeStep;

  bool get isKycVerified => _isKycVerified;

  bool get isEnableOTP => _isEnableOTP;

  bool get isUpdateKyc => _isUpdateKyc;

  bool get aadhaarVerified => _aadhaarVerified;

  bool get bankVerified => _bankVerified;

  bool get loadingState => _loadingState;

  bool get otpLoadingState => _otpLoadingState;

  bool get panLoadingState => _panLoadingState;

  bool get kycLoadingState => _kycLoadingState;

  bool get kycDataLoadingState => _kycDataLoadingState;

  bool get isPanVerified => _isPanVerified;

  PlatformFile? get pickedTaxReceipt => _pickedTaxReceipt;

  PlatformFile? get pickedRentReceipt => _pickedRentReceipt;

  PlatformFile? get pickedAadhaarCard => _pickedAadhaarCard;

  PlatformFile? get pickedSmartCard => _pickedSmartCard;

  PlatformFile? get pickedIdCard => _pickedIdCard;

  PlatformFile? get pickedPaySlipMonth1 => _pickedPaySlipMonth1;

  PlatformFile? get pickedPaySlipMonth2 => _pickedPaySlipMonth2;

  PlatformFile? get pickedPaySlipMonth3 => _pickedPaySlipMonth3;

  PlatformFile? get pickedPfPassBook => _pickedPfPassBook;

  PlatformFile? get pickedGasSlip => _pickedGasSlip;

  PlatformFile? get pickedBroadBandSlip => _pickedBroadBandSlip;

  PlatformFile? get pickedPanCard => _pickedPanCard;

  PlatformFile? get pickedDrivingLicense => _pickedDrivingLicense;

  UserDataModel? get userKYCData => _userKYCData;

  KycStatusModel? get kycStatus => _kycStatus;

  void onChangeHouseType(String? value) {
    _selectedAddress = value;

    update();
  }

  void onChangeGenderType(String? value) {
    _selectedGender = value;
    update();
  }

  void onStepReached(int index) {
    _activeStep = index;
    update();
  }

  void onChangeBankDetails(String value) {
    _bankVerified = false;
  }

  void clearKycForm() {
    aadhaarNumberController.clear();
    panNumberController.clear();
    accountNumberController.clear();
    ifscController.clear();
    bankNameController.clear();
    accountHolderNameController.clear();
    employmentTypeController.clear();
    addressController.clear();
    companyLocationController.clear();
    companyEmailController.clear();
    companyNameController.clear();
    _pickedIdCard = null;
    _pickedPaySlipMonth2 = null;
    _pickedPaySlipMonth3 = null;
    _pickedPaySlipMonth1 = null;
    _pickedBroadBandSlip = null;
    _pickedGasSlip = null;
    _pickedDrivingLicense = null;
    _pickedSmartCard = null;
    _pickedTaxReceipt = null;
    _pickedAadhaarCard = null;
    _pickedPanCard = null;
    _pickedPfPassBook = null;
    _selectedAddress = null;
  }

  void onSubmitKycForm() async {
    if (validateForm() != null) {
      showCustomSnackBar(validateForm());
      return;
    }
    _kycLoadingState = true;
    update();

    await bankVerify();
    if (_bankVerified == false) {
      showCustomSnackBar("Your BankAccount Number Not Verified");
      _kycLoadingState = false;
      update();
      return;
    }
    KycData kycData = KycData(
      aadhaarNumber: aadhaarNumberController.text,
      panNumber: panNumberController.text,
      accountNumber: accountNumberController.text,
      ifscCode: ifscController.text,
      bankName: bankNameController.text,
      accountHolderName: accountHolderNameController.text,
      loanAmount: Get.find<LoanController>().loanAmountSliderValue.toString(),
      panFile: File(pickedPanCard!.path!),
      aadhaarFile: File(pickedAadhaarCard!.path!),
      propertyTaxReceipt: selectedAddress == 'Own House'
          ? File(pickedTaxReceipt!.path ?? '')
          : File(''),
      rentalAgreement: selectedAddress == 'Own House'
          ? File(pickedTaxReceipt!.path ?? '')
          : File(''),
      smartCardFile: File(pickedSmartCard!.path!),
      drivingLicenseFile: File(pickedDrivingLicense!.path!),
      recentGasBill: File(pickedGasSlip!.path!),
      recentBroadbandBill: File(pickedBroadBandSlip!.path!),
      paySlip1: File(pickedPaySlipMonth1!.path!),
      paySlip2: File(pickedPaySlipMonth2!.path!),
      paySlip3: File(pickedPaySlipMonth3!.path!),
      idCard: File(pickedIdCard!.path!),
      pfMemberPassbook: File(pickedPfPassBook!.path!),
      houseType: selectedAddress!,
      companyName: companyNameController.text,
      companyEmail: companyEmailController.text,
      companyLocation: companyLocationController.text,
      address: addressController.text,
      employmentType: employmentTypeController.text,
    );
    try {
      var kycResponse = await kycRepository.sendKYCData(kycData);
      if (kycResponse.errors == null) {
        _isKycVerified = true;
        showCustomSnackBar(kycResponse.message, isError: false);
        clearKycForm();
        await getKycStatus();
      } else {
        showCustomSnackBar(kycResponse.errors!.first);
      }
      _activeStep = 0;
      _kycLoadingState = false;
      update();
    } catch (e) {
      showCustomSnackBar("Failed to upload KYC");
      _kycLoadingState = false;
      update();
    }
  }

  void onSubmitUpdateKycForm() async {
    if (validateForm() != null) {
      showCustomSnackBar(validateForm());
      return;
    }
    _kycLoadingState = true;
    update();

    await bankVerify();
    if (_bankVerified == false) {
      showCustomSnackBar("Your BankAccount Number Not Verified");
      _kycLoadingState = false;
      update();
      return;
    }
    final panFile = await downloadFile(_pickedPanCard!.path!, 'pan_file');
    final taxReceiptFile =
        await downloadFile(_pickedPanCard!.path!, 'property_tax_receipt');
    final rentalAgreementFile =
        await downloadFile(_pickedPanCard!.path!, 'rental_agreement');
    final smartCartFile =
        await downloadFile(_pickedPanCard!.path!, 'smart_card_file');
    final drivingLicenseFile =
        await downloadFile(_pickedPanCard!.path!, 'driving_license_file');
    final gasBillFile =
        await downloadFile(_pickedPanCard!.path!, 'recent_gas_bill');
    final broadBandBillFile =
        await downloadFile(_pickedPanCard!.path!, 'recent_broadband_bill');
    final paySlip1File = await downloadFile(_pickedPanCard!.path!, 'pay_slip1');
    final paySlip2File = await downloadFile(_pickedPanCard!.path!, 'pay_slip2');
    final paySlip3File = await downloadFile(_pickedPanCard!.path!, 'pay_slip3');
    final idCardFile = await downloadFile(_pickedPanCard!.path!, 'id_card');
    final pfPassBookFile =
        await downloadFile(_pickedPanCard!.path!, 'pf_member_passbook');
    final aadhaarFile =
        await downloadFile(_pickedAadhaarCard!.path!, 'aadhar_file');
    KycData kycData = KycData(
      aadhaarNumber: aadhaarNumberController.text,
      panNumber: panNumberController.text,
      accountNumber: accountNumberController.text,
      ifscCode: ifscController.text,
      bankName: bankNameController.text,
      accountHolderName: accountHolderNameController.text,
      loanAmount: Get.find<LoanController>().loanAmountSliderValue.toString(),
      panFile: panFile,
      aadhaarFile: aadhaarFile,
      propertyTaxReceipt: taxReceiptFile,
      rentalAgreement: rentalAgreementFile,
      smartCardFile: smartCartFile,
      drivingLicenseFile: drivingLicenseFile,
      recentGasBill: gasBillFile,
      recentBroadbandBill: broadBandBillFile,
      paySlip1: paySlip1File,
      paySlip2: paySlip2File,
      paySlip3: paySlip3File,
      idCard: idCardFile,
      pfMemberPassbook: pfPassBookFile,
      houseType: selectedAddress!,
      companyName: companyNameController.text,
      companyEmail: companyEmailController.text,
      companyLocation: companyLocationController.text,
      address: addressController.text,
      employmentType: employmentTypeController.text,
    );

    var kycResponse = await kycRepository.updateKYCData(kycData);
    if (kycResponse.errors == null) {
      _isKycVerified = true;
      showCustomSnackBar(kycResponse.message, isError: false);
      clearKycForm();
      await getKycStatus();
    } else {
      showCustomSnackBar(kycResponse.errors!.first);
    }
    _activeStep = 0;
    _kycLoadingState = false;
    update();
  }

  Future<void> getKycStatus() async {
    var response = await kycRepository.getKycStatus();
    _kycStatus = KycStatusModel.fromJson(response.body);

    update();
  }

  void onTapUpdateKyc() {
    _isUpdateKyc = true;
    update();
    getUserKycData();
  }

  Future<File> downloadFile(String filePathOrUrl, String filename) async {
    Uri? uri = Uri.tryParse(filePathOrUrl);
    if (uri != null &&
        (uri.isAbsolute && (uri.scheme == 'http' || uri.scheme == 'https'))) {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final dir = await getTemporaryDirectory();
        final file = File(path.join(dir.path, filename));
        return file.writeAsBytes(response.bodyBytes);
      } else {
        throw Exception('Failed to download file from $filePathOrUrl');
      }
    } else {
      final file = File(filePathOrUrl);
      if (await file.exists()) {
        return file;
      } else {
        throw Exception('Local file not found at $filePathOrUrl');
      }
    }
  }

  Future<void> aadhaarVerify() async {
    _loadingState = true;
    update();
    var response =
        await kycRepository.aadhaarVerify(aadhaarNumberController.text);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson;

      if (response.body is String) {
        responseJson = jsonDecode(response.body);
      } else {
        responseJson = response.body;
      }
      AadhaarVerifyModel responseModel =
          AadhaarVerifyModel.fromJson(responseJson);
      if (responseModel.data?.message == "OTP sent successfully") {
        _isEnableOTP = true;
        _refNum = responseModel.data?.referenceId;
        showCustomSnackBar(responseModel.data?.message, isError: false);
      } else {
        aadhaarNumberController.clear();
        showCustomSnackBar(responseModel.data?.message);
      }
    } else {
      aadhaarNumberController.clear();
      ApiChecker.checkApi(response);
    }
    _loadingState = false;
    update();
  }

  Future<void> aadhaarOTPVerify() async {
    _otpLoadingState = true;
    update();

    var response = await kycRepository.aadhaarOTPVerify(
        _refNum.toString(), aadhaarNumberOTPController.text);
    if (response.statusCode == 200) {
      AadhaarOTPModel responseModel = AadhaarOTPModel.fromJson(response.body);
      if (responseModel.data?.message == "Aadhaar Card Exists") {
        _aadhaarVerified = true;
        String joinedAddress = [
          responseModel.data!.address!.house,
          responseModel.data!.address!.street,
          responseModel.data!.address!.vtc,
          responseModel.data!.address!.subDistrict,
          responseModel.data!.address!.district,
          responseModel.data!.address!.pinCode,
        ].join(', ');

        addressController.text = joinedAddress;
        genderController.text = gender(responseModel.data!.gender ?? '');
        dobController.text = responseModel.data!.dateOfBirth ?? '';
        showCustomSnackBar("Aadhaar Verified Successful ", isError: false);
      } else {
        _aadhaarVerified = false;
        aadhaarNumberOTPController.clear();
        aadhaarNumberController.clear();
        showCustomSnackBar(responseModel.data?.message);
      }
    } else {
      _aadhaarVerified = false;
      aadhaarNumberOTPController.clear();
      aadhaarNumberController.clear();
      ApiChecker.checkApi(response);
    }

    _otpLoadingState = false;
    update();
  }

  Future<void> panVerify() async {
    _panLoadingState = true;
    update();

    var response = await kycRepository.panVerify(panNumberController.text);
    if (response.statusCode == 200) {
      PanVerifyModel responseModel = PanVerifyModel.fromJson(response.body);
      if (responseModel.success?.message == "PAN verified successfully.") {
        _isPanVerified = true;
        String joinedName = [
          responseModel.success!.response!.data!.firstName,
          responseModel.success!.response!.data!.lastName,
        ].join(' ');
        nameController.text = joinedName;

        showCustomSnackBar(responseModel.success?.message, isError: false);
      } else {
        _isPanVerified = false;
        panNumberController.clear();
        showCustomSnackBar(responseModel.success?.message);
      }
    } else {
      _isPanVerified = false;
      panNumberController.clear();
      ApiChecker.checkApi(response);
    }

    _panLoadingState = false;
    update();
  }

  Future<void> getUserKycData() async {
    _kycDataLoadingState = true;
    _activeStep = 0;
    var response = await kycRepository.getUserKycData();
    if (response.statusCode == 200) {
      _userKYCData = UserDataModel.fromJson(response.body);
      updateControllers();
      await fetchAllFiles();
    } else {
      ApiChecker.checkApi(response);
    }
    _kycDataLoadingState = false;
    update();
  }

  void updateControllers() {
    String joinedAddress = [
      _userKYCData!.user!.aadhaar!.aadhaarData!.address!.house,
      _userKYCData!.user!.aadhaar!.aadhaarData!.address!.street,
      _userKYCData!.user!.aadhaar!.aadhaarData!.address!.vtc,
      _userKYCData!.user!.aadhaar!.aadhaarData!.address!.subdistrict,
      _userKYCData!.user!.aadhaar!.aadhaarData!.address!.district,
      _userKYCData!.user!.aadhaar!.aadhaarData!.address!.pincode,
    ].join(', ');
    addressController.text = joinedAddress;
    _selectedAddress = _userKYCData!.userKyc!.houseType ?? _selectedAddress;
    aadhaarNumberController.text = _userKYCData!.userKyc!.aadharNumber ?? '';
    String joinedName = [
      _userKYCData!.user!.pan!.panData!.firstName ?? '',
      _userKYCData!.user!.pan!.panData!.lastName ?? ''
    ].join(' ');
    nameController.text = joinedName;
    genderController.text =
        gender(_userKYCData!.user!.aadhaar!.aadhaarData!.gender ?? '');
    dobController.text =
        _userKYCData!.user!.aadhaar!.aadhaarData!.dateOfBirth ?? '';
    panNumberController.text =
        _userKYCData!.user!.pan!.panData!.panNumber ?? '';
    employmentTypeController.text =
        _userKYCData!.user!.kyc!.employmentType ?? '';
    companyNameController.text = _userKYCData!.user!.kyc!.companyName!;
    companyEmailController.text = _userKYCData!.user!.kyc!.companyEmail!;
    companyLocationController.text = _userKYCData!.user!.kyc!.companyLocation!;
    accountNumberController.text = _userKYCData!.user!.kyc!.accountNumber!;
    ifscController.text = _userKYCData!.user!.kyc!.ifscCode!;
    accountHolderNameController.text =
        _userKYCData!.user!.kyc!.accountHolderName!;
    bankNameController.text = _userKYCData!.user!.kyc!.bankName!;
    _isPanVerified = true;
    _aadhaarVerified = true;
    _bankVerified = true;
  }

  Future<void> fetchAllFiles() async {
    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.aadharFile!,
      onFileFetched: (file) => _pickedAadhaarCard = file,
    );

    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.propertyTaxRecipt ??
          _userKYCData!.user!.kyc!.rentalAgreement!,
      onFileFetched: (file) => _pickedTaxReceipt = file,
    );

    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.rentalAgreement!,
      onFileFetched: (file) => _pickedRentReceipt = file,
    );

    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.smartCardFile!,
      onFileFetched: (file) => _pickedSmartCard = file,
    );

    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.idCard!,
      onFileFetched: (file) => _pickedIdCard = file,
    );

    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.paySlip1!,
      onFileFetched: (file) => _pickedPaySlipMonth1 = file,
    );
    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.paySlip2!,
      onFileFetched: (file) => _pickedPaySlipMonth2 = file,
    );
    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.paySlip3!,
      onFileFetched: (file) => _pickedPaySlipMonth3 = file,
    );

    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.pfMemberPassbook!,
      onFileFetched: (file) => _pickedPfPassBook = file,
    );

    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.recentGasBill!,
      onFileFetched: (file) => _pickedGasSlip = file,
    );

    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.recentBroadbandBill!,
      onFileFetched: (file) => _pickedBroadBandSlip = file,
    );

    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.panFile!,
      onFileFetched: (file) => _pickedPanCard = file,
    );

    await fetchFile(
      urlPath: _userKYCData!.user!.kyc!.drivingLicenseFile!,
      onFileFetched: (file) => _pickedDrivingLicense = file,
    );
    update();
  }

  Future<void> fetchFile({
    required String urlPath,
    required void Function(PlatformFile file) onFileFetched,
  }) async {
    final String url = "https://prathima.v4inspire.com$urlPath";
    final http.Response response = await http.get(Uri.parse(url));
    Uint8List fileBytes = response.bodyBytes;
    String fileName = url.split('/').last;

    PlatformFile file = PlatformFile(
      name: fileName,
      size: fileBytes.length,
      path: url,
      bytes: fileBytes,
    );
    onFileFetched(file);
  }

  void requestPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  String gender(String gender) {
    switch (gender) {
      case "M":
        return "Male";
      case "F":
        return "Female";
      case "T":
        return "Transgender";
      default:
        return "Unknown";
    }
  }

  Future<void> bankVerify() async {
    LoginResponse phone = await Get.find<AuthController>().userData();
    var response = await kycRepository.bankVerify(accountNumberController.text,
        ifscController.text, phone.user!.phoneNumber!);
    // phone.user!.phoneNumber!
    if (response.statusCode == 200) {
      BankVerifyModel responseModel = BankVerifyModel.fromJson(response.body);
      if (responseModel.success?.message ==
          "Bank details verified successfully.") {
        _bankVerified = true;
      }
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future<void> aadhaarOnChange(String value) async {
    if (value.length == 12) {
      Get.focusScope?.unfocus();
      await aadhaarVerify();
    } else {
      _isEnableOTP = false;
      _refNum = null;
      _aadhaarVerified = false;
      addressController.clear();
      genderController.clear();
      dobController.clear();
      aadhaarNumberOTPController.clear();
    }
    update();
  }

  Future<void> aadhaarOTPOnChange(String value) async {
    if (value.length == 6) {
      Get.focusScope?.unfocus();
      if (_refNum != null) {
        await aadhaarOTPVerify();
      }
    }
  }

  Future<void> onChangePan(String value) async {
    if (value.length == 10) {
      Get.focusScope?.unfocus();
      await panVerify();
    } else {
      nameController.clear();
      _isPanVerified = false;
    }
    update();
  }

  Future<void> datePicker(BuildContext context) async {
    final ThemeData customTheme = ThemeData(
      primaryColor: MyTheme.mainColor,
      colorScheme: const ColorScheme.light(
        primary: MyTheme.mainColor,
        onPrimary: Colors.white,
        onSurface: MyTheme.mainColor,
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
    );
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1000),
      lastDate: DateTime(3000),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: customTheme,
          child: child!,
        );
      },
    );
    if (picked != null) {
      dobController.text = getFormattedDate(picked);
    }
    update();
  }

  String getFormattedDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  Future<void> pickFiles(PickedFile fileType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null) {
      switch (fileType) {
        case PickedFile.taxReceipt:
          _pickedTaxReceipt = result.files.first;
          break;
        case PickedFile.rentReceipt:
          _pickedRentReceipt = result.files.first;
          break;
        case PickedFile.aadhaarCard:
          _pickedAadhaarCard = result.files.first;
          break;
        case PickedFile.panCard:
          _pickedPanCard = result.files.first;
          break;
        case PickedFile.drivingLicense:
          _pickedDrivingLicense = result.files.first;
          break;
        case PickedFile.broadBandSlip:
          _pickedBroadBandSlip = result.files.first;
          break;
        case PickedFile.paySlipMonth1:
          _pickedPaySlipMonth1 = result.files.first;
          break;
        case PickedFile.paySlipMonth2:
          _pickedPaySlipMonth2 = result.files.first;
          break;
        case PickedFile.paySlipMonth3:
          _pickedPaySlipMonth3 = result.files.first;
          break;
        case PickedFile.idCard:
          _pickedIdCard = result.files.first;
          break;
        case PickedFile.gasSlip:
          _pickedGasSlip = result.files.first;
          break;
        case PickedFile.pfPassBook:
          _pickedPfPassBook = result.files.first;
          break;
        case PickedFile.smartCard:
          _pickedSmartCard = result.files.first;
          break;
      }
    }

    update();
  }

  void onTapAadhaarForm() {
    if (validateAadhaarForm() != null) {
      showCustomSnackBar(validateAadhaarForm());
      return;
    }
    onStepReached(1);
  }

  String? validateAadhaarForm() {
    if (aadhaarNumberController.text.isEmpty) {
      return "Enter Aadhaar Number";
    } else if (aadhaarNumberController.text.length < 12) {
      return "Enter Valid Aadhaar Number";
    } else if (aadhaarNumberController.text.length == 12 && !aadhaarVerified) {
      return "Your Aadhaar is Not Verified";
    } else if (pickedAadhaarCard == null) {
      return "Upload Aadhaar Card";
    } else if (panNumberController.text.isEmpty) {
      return "Enter Pan Number";
    } else if (panNumberController.text.length < 10) {
      return "Enter Valid Pan Number";
    } else if (panNumberController.text.length == 10 && !isPanVerified) {
      return "Your Pan is Not Verified";
    } else if (pickedPanCard == null) {
      return "Upload Pan Card";
    } else if (pickedSmartCard == null) {
      return "Upload Smart Card";
    } else if (pickedDrivingLicense == null) {
      return "Upload Driving License";
    } else if (pickedGasSlip == null) {
      return "Upload Gas Slip";
    } else if (pickedBroadBandSlip == null) {
      return "Upload BroadBand Slip";
    }
    return null;
  }

  void onTapPersonalForm() {
    if (validatePersonalForm() != null) {
      showCustomSnackBar(validatePersonalForm());
      return;
    }
    onStepReached(2);
  }

  String? validatePersonalForm() {
    if (selectedAddress == null) {
      return "Select HouseType";
    } else if (selectedAddress == "Own House" && pickedTaxReceipt == null) {
      return "Upload Tax Receipt";
    }
    return null;
  }

  void onTapWorkForm() {
    if (validateWorkForm() != null) {
      showCustomSnackBar(validateWorkForm());
      return;
    }
    onStepReached(3);
  }

  String? validateWorkForm() {
    if (employmentTypeController.text.isEmpty) {
      return "Enter Employee Type";
    } else if (companyNameController.text.isEmpty) {
      return "Enter Company Name";
    } else if (companyEmailController.text.isEmpty) {
      return "Enter Company Email";
    } else if (!GetUtils.isEmail(companyEmailController.text)) {
      return "Enter Valid Company Email";
    } else if (companyLocationController.text.isEmpty) {
      return "Enter Company Location";
    } else if (pickedPaySlipMonth1 == null) {
      return "Upload Pay Slip 1";
    } else if (pickedPaySlipMonth2 == null) {
      return "Upload Pay Slip 2";
    } else if (pickedPaySlipMonth3 == null) {
      return "Upload Pay Slip 3";
    } else if (pickedIdCard == null) {
      return "Upload Id Card";
    }
    return null;
  }

  void onTapBankForm() {
    if (validateWorkForm() != null) {
      showCustomSnackBar(validateWorkForm());
      return;
    }
  }

  String? validateBankForm() {
    if (employmentTypeController.text.isEmpty) {
      return "Enter Employee Type";
    } else if (companyNameController.text.isEmpty) {
      return "Enter Company Name";
    } else if (companyEmailController.text.isEmpty) {
      return "Enter Company Email";
    } else if (!GetUtils.isEmail(companyEmailController.text)) {
      return "Enter Valid Company Email";
    } else if (companyLocationController.text.isEmpty) {
      return "Enter Company Location";
    } else if (pickedPaySlipMonth1 == null) {
      return "Upload Pay Slip 1";
    } else if (pickedPaySlipMonth2 == null) {
      return "Upload Pay Slip 2";
    } else if (pickedPaySlipMonth3 == null) {
      return "Upload Pay Slip 3";
    } else if (pickedIdCard == null) {
      return "Upload Id Card";
    }
    return null;
  }

  String? validateForm() {
    if (accountNumberController.text.isEmpty) {
      return "Enter Account Number";
    } else if (ifscController.text.isEmpty) {
      return "Enter IFSC Code";
    } else if (bankNameController.text.isEmpty) {
      return "Enter Bank Name";
    } else if (accountHolderNameController.text.isEmpty) {
      return "Enter Account Holder Name";
    } else if (addressController.text.isEmpty) {
      return "Enter Address";
    } else if (pickedPfPassBook == null) {
      return "Upload Bank PassBook";
    }
    return null;
  }
}
