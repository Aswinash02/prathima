import 'package:get/get.dart';
import 'package:prathima_loan_app/data/repository/loan_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';

class LoanController extends GetxController implements GetxService {
  final LoanRepository loanRepository;

  LoanController({required this.loanRepository});

  double _loanAmountSliderValue = 5000;
  double _dueMonthSliderValue = 2;
  bool _isChangeDetail = false;
  String _selectedMode = '';
  List<PaymentMethod> paymentMethodString = [
    PaymentMethod(img: "assets/img/phonpe.png", name: 'PhonePe'),
    PaymentMethod(img: "assets/img/gpay.png", name: 'Google Pay'),
    PaymentMethod(img: "assets/img/Paytm.png", name: 'Paytm'),
    PaymentMethod(img: "assets/img/BHIM.png", name: 'BHIM'),
  ];

  double get loanAmountSliderValue => _loanAmountSliderValue;

  double get dueMonthSliderValue => _dueMonthSliderValue;

  bool get isChangeDetail => _isChangeDetail;

  String get selectedMode => _selectedMode;

  void onChangeLoanAmountSlider(double value) {
    _loanAmountSliderValue = value;
    update();
  }
  void onChangeDueMonthSlider(double value) {
    _dueMonthSliderValue = value;
    update();
  }

  void onPressedProceed() {
    if (_isChangeDetail == false) {
      _isChangeDetail = true;
    } else {
      Get.toNamed(RouteHelper.loanAgreementScreen);
    }
    update();
  }

  void onChangeMode(String? value) {
    _selectedMode = value!;
    update();
  }
}

class PaymentMethod {
  final String img;
  final String name;

  PaymentMethod({
    required this.img,
    required this.name,
  });
}
