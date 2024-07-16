import 'package:get/get.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';

class KycRepository extends GetxService {
  final ApiClient apiClient;

  KycRepository({required this.apiClient});
}
