import 'dart:convert';

import 'package:get/get.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:prathima_loan_app/data/model/approved_loan_model.dart';
import 'package:prathima_loan_app/utils/app_constant.dart';

class LoanRepository extends GetxService {
  final ApiClient apiClient;

  LoanRepository({required this.apiClient});

  Future<ApprovedLoanModel> getApprovedLoanData() async {
    try {
      var response = await apiClient.getData(AppConstants.approvedLoanUrl);
      if (response.statusCode == 200) {
        return ApprovedLoanModel.fromJson(response.body);
      } else {
        return ApprovedLoanModel.fromJson(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getLoanType() async {
    return await apiClient.getData(AppConstants.loanTypeUrl);
  }

  Future<Response> getLoanDetail(int id) async {
    return await apiClient.getData("${AppConstants.loanDetailUrl}/$id");
  }

  Future<Response> getAllLoan(String type) async {
    return await apiClient
        .getData(AppConstants.loansUrl, query: {"type": type});
  }

  Future<Response> checkLoanExistOrNot() async {
    return await apiClient.getData(AppConstants.checkLoanUrl);
  }
}
