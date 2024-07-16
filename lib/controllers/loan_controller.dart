import 'package:get/get.dart';
import 'package:prathima_loan_app/data/api/api_client.dart';
import 'package:prathima_loan_app/data/repository/loan_repository.dart';

class LoanController extends GetxController implements GetxService {
  final LoanRepository loanRepository;
  LoanController({required this.loanRepository});
  double _currentSliderValue = 20.0;

  double get currentSliderValue => _currentSliderValue;

  void onChangeSliderValue(double value) {
    _currentSliderValue = value;
    update();
  }
}
