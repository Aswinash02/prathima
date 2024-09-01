import 'dart:convert';

import 'package:get/get.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:prathima_loan_app/data/model/user_data_model.dart';
import 'package:prathima_loan_app/utils/app_constant.dart';

class ProfileRepository extends GetxService {
  final ApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<Response> getUserData() async {
    return await apiClient.getData(AppConstants.userDataUrl);
  }

  Future<Response> getPageData() async {
    return await apiClient.getData(AppConstants.pageUrl);
  }

  Future<Response> editProfile(Map<String, dynamic> body) async {
    return await apiClient.postData(AppConstants.editProfileUrl, body);
    // if (response.statusCode == 200) {
    //   var decodeData = response.body;
    //   return decodeData['success']['result'];
    // } else {
    //   return false;
    // }
  }
}
