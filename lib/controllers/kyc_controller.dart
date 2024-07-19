import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_controller.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/repository/kyc_repository.dart';

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

  // final String smartCard;
  final String accountHolderName;
  final String loanAmount;
  final String houseType;
  final String companyName;
  final String companyEmail;
  final String companyLocation;
  final String address;
  final String employmentType;

  // final String loan;
  final File panFile;
  final File aadhaarFile;
  final File propertyTaxReceipt;
  final File rentalAgreement;
  final File smartCardFile;
  final File drivingLicenseFile;
  final File recentGasBill;
  final File recentBroadbandBill;
  final List<File> paySlip;
  final File idCard;
  final File pfMemberPassbook;

  const KycData({
    required this.aadhaarNumber,
    required this.panNumber,
    required this.accountNumber,
    required this.ifscCode,
    required this.bankName,
    // required this.smartCard,
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
    required this.paySlip,
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
  final List<String> _dropdownItems = ["Own House ", "Rent House"];
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
  int _activeStep = 0;
  bool _isKycVerified = false;
  bool _isLoanApproved = false;

  List<String> get dropdownItems => _dropdownItems;

  String? get selectedAddress => _selectedAddress;

  int get activeStep => _activeStep;

  bool get isKycVerified => _isKycVerified;

  bool get isLoanApproved => _isLoanApproved;

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

  void onChangeDropdown(String? value) {
    _selectedAddress = value;
    print("selected Address ==============>${_selectedAddress}");
    update();
  }

  void onStepReached(int index) {
    _activeStep = index;
    update();
  }

  void onSubmitKycForm() async {
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
      propertyTaxReceipt: File(pickedTaxReceipt!.path ?? ''),
      rentalAgreement: File(pickedTaxReceipt!.path ?? ''),
      smartCardFile: File(pickedSmartCard!.path!),
      drivingLicenseFile: File(pickedDrivingLicense!.path!),
      recentGasBill: File(pickedGasSlip!.path!),
      recentBroadbandBill: File(pickedBroadBandSlip!.path!),
      paySlip: [
        File(pickedPaySlipMonth1!.path!),
        File(pickedPaySlipMonth2!.path!),
        File(pickedPaySlipMonth2!.path!)
      ],
      idCard: File(pickedIdCard!.path!),
      pfMemberPassbook: File(pickedPfPassBook!.path!),
      houseType: selectedAddress!,
      companyName: companyNameController.text,
      companyEmail: companyEmailController.text,
      companyLocation: companyLocationController.text,
      address: addressController.text,
      employmentType: employmentTypeController.text,
    );
    var kycResponse = await kycRepository.sendKYCData(kycData);
    if (kycResponse.result!) {
      _isKycVerified = true;
      showCustomSnackBar(kycResponse.message, isError: false);
    } else {
      showCustomSnackBar(kycResponse.message);
    }
    update();
  }

  void onPressedKycComplete() {
    _isLoanApproved = true;
    update();
  }

  Future<void> pickFiles(PickedFile fileType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
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
}
