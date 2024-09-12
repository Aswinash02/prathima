import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:prathima_loan_app/data/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:prathima_loan_app/utils/app_constant.dart';
import 'package:prathima_loan_app/utils/shared_preferences.dart';

class ProfileRepository extends GetxService {
  final ApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<Response> getUserData() async {
    return await apiClient.getData(AppConstants.userDataUrl);
  }

  Future<Response> getPageData() async {
    return await apiClient.getData(AppConstants.pageUrl);
  }

  Future<Response> getSupportTickets() async {
    return await apiClient.getData(AppConstants.supportsUrl);
  }

  Future<Response> viewTickets(String id) async {
    return await apiClient.getData("${AppConstants.viewTicketUrl}/$id");
  }

  Future<Response> editProfile(Map<String, dynamic> body) async {
    return await apiClient.postData(AppConstants.editProfileUrl, body);
  }

  Future<bool> createTicket(
      {String? priority, required String subject, PlatformFile? file}) async {
    String userData = await SharedPreference().getUserData();
    LoginResponse decodeUserData = LoginResponse.fromJson(jsonDecode(userData));
    var uri = Uri.parse(AppConstants.baseUrl + AppConstants.createTicketUrl);
    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer ${decodeUserData.token}',
    });

    request.fields['subject'] = subject ?? '';
    request.fields['priority'] = priority ?? '';

    if (file != null && file.path != null) {
      request.files.add(await http.MultipartFile.fromPath('files', file.path!));
    }
    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);
      return jsonResponse['result'];
    } else {
      return false;
    }
  }

  Future<bool> sendMessage(
      {required String ticketId, String? message, PlatformFile? file}) async {
    String userData = await SharedPreference().getUserData();
    LoginResponse decodeUserData = LoginResponse.fromJson(jsonDecode(userData));
    var uri = Uri.parse(AppConstants.baseUrl + AppConstants.messageUrl);
    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer ${decodeUserData.token}',
    });
    request.fields['ticket_id'] = ticketId;
    request.fields['reply'] = message ?? '';

    if (file != null && file.path != null) {
      request.files.add(await http.MultipartFile.fromPath('files', file.path!));
    }
    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);
      return jsonResponse['result'];
    } else {
      return false;
    }
  }
}
