import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/data/repository/kyc_repository.dart';

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
  String? _selectedAddress;
  int _activeStep = 0;

  List<String> get dropdownItems => _dropdownItems;

  String? get selectedAddress => _selectedAddress;

  int get activeStep => _activeStep;

  void onChangeDropdown(String? value) {
    _selectedAddress = value;
    update();
  }

  void onStepReached(int index) {
    _activeStep = index;
    update();
  }
}
