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
}
