import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/api/api_checker.dart';
import 'package:prathima_loan_app/data/model/edit_profile_model.dart';
import 'package:prathima_loan_app/data/model/profile_page_model.dart';
import 'package:prathima_loan_app/data/model/support_tickets_model.dart';
import 'package:prathima_loan_app/data/model/user_data_model.dart';
import 'package:prathima_loan_app/data/model/view_ticket_model.dart';
import 'package:prathima_loan_app/data/repository/profile_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class ProfileController extends GetxController implements GetxService {
  final ProfileRepository profileRepository;

  ProfileController({required this.profileRepository});

  UserDataModel? _userData;
  TextEditingController searchController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  bool _loadingState = false;
  bool _createTicketLoadingState = false;
  bool _messageLoadingState = false;
  bool _viewTicketLoadingState = false;
  String? _selectedGender;
  String? _selectedPriority;
  int? _ticketId;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  final List<PageData> _pageDataList = [];
  final List<TicketData> _supportTicketList = [];
  List<TicketData> _searchSupportTicketList = [];
  PlatformFile? _pickedTicketFile;
  PlatformFile? _pickedMessageFile;
  ViewTicketData? _viewTicketData;

  bool _editProfileLoadingState = false;
  final List<String> _genderType = ["male", "female", "transGender"];
  final List<String> _priorityLevel = ["low", "medium", "high"];
  TextEditingController nameCon = TextEditingController();
  TextEditingController dobCon = TextEditingController();
  TextEditingController cityCon = TextEditingController();
  TextEditingController pincodeCon = TextEditingController();
  TextEditingController districtCon = TextEditingController();
  TextEditingController stateCon = TextEditingController();
  TextEditingController countryCon = TextEditingController();

  UserDataModel? get userData => _userData;

  bool get loadingState => _loadingState;

  bool get createTicketLoadingState => _createTicketLoadingState;

  bool get messageLoadingState => _messageLoadingState;

  bool get viewTicketLoadingState => _viewTicketLoadingState;

  bool get editProfileLoadingState => _editProfileLoadingState;

  List<String> get genderType => _genderType;

  List<String> get priorityLevel => _priorityLevel;

  List<PageData> get pageDataList => _pageDataList;

  List<TicketData> get supportTicketList => _supportTicketList;

  List<TicketData> get searchSupportTicketList => _searchSupportTicketList;

  String? get selectedGender => _selectedGender;

  String? get selectedPriority => _selectedPriority;

  int? get ticketId => _ticketId;

  File? get selectedImage => _selectedImage;

  PlatformFile? get pickedTicketFile => _pickedTicketFile;

  PlatformFile? get pickedMessageFile => _pickedMessageFile;

  ViewTicketData? get viewTicketData => _viewTicketData;

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

  Future<void> getPageData() async {
    _loadingState = true;
    update();
    var response = await profileRepository.getPageData();
    if (response.statusCode == 200) {
      ProfilePageModel data = ProfilePageModel.fromJson(response.body);
      _pageDataList.addAll(data.data!);
    } else {
      ApiChecker.checkApi(response);
    }
    _loadingState = false;
    update();
  }

  Future<void> getSupportTickets() async {
    _supportTicketList.clear();
    _loadingState = true;
    update();
    var response = await profileRepository.getSupportTickets();
    if (response.statusCode == 200) {
      SupportTicketsModel data = SupportTicketsModel.fromJson(response.body);
      _supportTicketList.addAll(data.data!);
    } else {
      ApiChecker.checkApi(response);
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
      lastDate: DateTime.now(),
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
      showCustomSnackBar("Profile Updated Successfully", isError: false);
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

  void onChangePriorityLevel(String? value) {
    _selectedPriority = value;
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

  void searchTickets(String txt) {
    _searchSupportTicketList = supportTicketList.where((data) {
      final searchLower = txt.toLowerCase();
      final code = data.code?.toLowerCase() ?? '';
      final subject = data.subject?.toLowerCase() ?? '';
      final priority = data.priority?.toLowerCase() ?? '';

      return code.contains(searchLower) ||
          subject.contains(searchLower) ||
          priority.contains(searchLower);
    }).toList();
    update();
  }

  Future<void> pickFiles(String destination) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      if (destination == "message") {
        _pickedMessageFile = result.files.first;
      } else {
        _pickedTicketFile = result.files.first;
      }
    }
    update();
  }

  void removePickedMessageFile() {
    _pickedMessageFile = null;
    update();
  }

  void clearData() {
    subjectController.clear();
    _pickedTicketFile = null;
    _selectedPriority = null;
    update();
  }

  void clearMessageData() {
    messageController.clear();
    _pickedMessageFile = null;
    update();
  }

  Future<void> createTicket() async {
    try {
      if (subjectController.text.isEmpty &&
          selectedPriority == null &&
          pickedTicketFile == null) {
        return;
      }
      _createTicketLoadingState = true;
      update();
      var response = await profileRepository.createTicket(
          subject: subjectController.text,
          priority: selectedPriority,
          file: pickedTicketFile);
      if (response == true) {
        clearData();
        Get.back();
        showCustomSnackBar("Ticket created successfully", isError: false);
        await getSupportTickets();
      } else {
        showCustomSnackBar("Failed To Created Ticket");
      }
    } catch (_) {}
    _createTicketLoadingState = false;
    update();
  }

  Future<void> viewTickets() async {
    _viewTicketLoadingState = true;
    var response = await profileRepository.viewTickets(ticketId.toString());
    if (response.statusCode == 200) {
      ViewTicketModel viewTicketResponse =
          ViewTicketModel.fromJson(response.body);
      _viewTicketData = viewTicketResponse.data;
    } else {
      ApiChecker.checkApi(response);
    }
    _viewTicketLoadingState = false;
    update();
  }

  void onTapViewTicket(int id) {
    _ticketId = id;
    Get.toNamed(RouteHelper.viewTicketScreen);
  }

  Future<void> sendMessage() async {
    try {
      if (messageController.text.isEmpty && pickedMessageFile == null) {
        return;
      }
      _messageLoadingState = true;
      update();
      var response = await profileRepository.sendMessage(
          ticketId: ticketId.toString(),
          message: messageController.text,
          file: pickedMessageFile);
      if (response == true) {
        clearMessageData();
        showCustomSnackBar("Ticket reply created successfully", isError: false);
        await viewTickets();
      } else {
        showCustomSnackBar("Reply Not Send");
      }
    } catch (_) {}
    _messageLoadingState = false;
    update();
  }
}
