import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/api/api_checker.dart';
import 'package:prathima_loan_app/data/model/edit_profile_model.dart';
import 'package:prathima_loan_app/data/model/user_data_model.dart';
import 'package:prathima_loan_app/data/repository/profile_repository.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class ProfileController extends GetxController implements GetxService {
  final ProfileRepository profileRepository;

  ProfileController({required this.profileRepository});

  UserDataModel? _userData;
  bool _loadingState = false;
  String? _selectedGender;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  bool _editProfileLoadingState = false;
  final List<String> _genderType = ["male", "female", "transGender"];
  TextEditingController nameCon = TextEditingController();
  TextEditingController dobCon = TextEditingController();
  TextEditingController cityCon = TextEditingController();
  TextEditingController pincodeCon = TextEditingController();
  TextEditingController districtCon = TextEditingController();
  TextEditingController stateCon = TextEditingController();
  TextEditingController countryCon = TextEditingController();

  UserDataModel? get userData => _userData;

  bool get loadingState => _loadingState;

  bool get editProfileLoadingState => _editProfileLoadingState;

  List<String> get genderType => _genderType;

  String? get selectedGender => _selectedGender;

  File? get selectedImage => _selectedImage;

  Future<void> getUserData() async {
    _loadingState = true;
    update();
    var response = await profileRepository.getUserData();
    if (response.statusCode == 200) {
      _userData = UserDataModel.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
    }
    if (_userData != null) {
      nameCon.text = userData!.user!.name ?? '';
      dobCon.text = userData!.user!.dob ?? '';
      _selectedGender = userData!.user!.gender;
      cityCon.text = userData!.user!.city ?? '';
      pincodeCon.text = userData!.user!.pincode ?? '';
      districtCon.text = userData!.user!.district ?? '';
      stateCon.text = userData!.user!.state ?? '';
      countryCon.text = userData!.user!.country ?? '';
    }
    _loadingState = false;
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
      dobCon.text = getFormattedDate(picked);
    }
    update();
  }

  String getFormattedDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Future<void> editProfile() async {
    if (!isChange()) {
      showCustomSnackBar("No Changes There");
      return;
    }

    _editProfileLoadingState = true;
    update();
    Map<String, dynamic> body = {
      "name": nameCon.text,
      "pincode": pincodeCon.text,
      "city": cityCon.text,
      "district": districtCon.text,
      "state": stateCon.text,
      "country": countryCon.text,
      "gender": selectedGender,
      "dob": dobCon.text
    };

    var response = await profileRepository.editProfile(body);
    EditProfileModel editProfileResponse =
        EditProfileModel.fromJson(response.body);
    if (response.statusCode == 200) {
      showCustomSnackBar("Edit Profile Successfully", isError: false);
      await getUserData();
    } else if (editProfileResponse.errors != null) {
      showCustomSnackBar(editProfileResponse.errors!.first);
    } else {
      ApiChecker.checkApi(response);
    }

    _editProfileLoadingState = false;
    update();
  }

  void onChangeGenderType(String? value) {
    _selectedGender = value;
    update();
  }

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      update();
    }
  }

  bool isChange() {
    return nameCon.text != userData!.user!.name ||
        dobCon.text != userData!.user!.dob ||
        _selectedGender != userData!.user!.gender ||
        cityCon.text != userData!.user!.city ||
        pincodeCon.text != userData!.user!.pincode ||
        districtCon.text != userData!.user!.district ||
        stateCon.text != userData!.user!.state ||
        countryCon.text != userData!.user!.country;
  }
}
