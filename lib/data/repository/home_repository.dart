import 'package:get/get.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';

class HomeRepository extends GetxService {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient});
}
