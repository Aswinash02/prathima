import 'package:get/get.dart';
import 'package:prathima_loan_app/data/repository/loan_agreement_repository.dart';

class LoanAgreementController extends GetxController implements GetxService {
  final LoanAgreementRepository loanAgreementRepository;

  LoanAgreementController({required this.loanAgreementRepository});

  bool _isCheckBox = false;

  bool get isCheckBox => _isCheckBox;

  void onChange(bool? value) {
    _isCheckBox = value!;
    update();
  }
}
