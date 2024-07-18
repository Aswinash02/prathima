import 'package:get/get.dart';
import 'package:prathima_loan_app/data/repository/loan_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';

class LoanController extends GetxController implements GetxService {
  final LoanRepository loanRepository;

  LoanController({required this.loanRepository});

  double _currentSliderValue = 20.0;
  bool _isChangeDetail = false;
  String _selectedMode = '';
  List<PaymentMethod> paymentMethodString = [
    PaymentMethod(img: "assets/img/phonpe.png", name: 'PhonePe'),
    PaymentMethod(img: "assets/img/gpay.png", name: 'Google Pay'),
    PaymentMethod(img: "assets/img/Paytm.png", name: 'Paytm'),
    PaymentMethod(img: "assets/img/BHIM.png", name: 'BHIM'),
  ];

  double get currentSliderValue => _currentSliderValue;

  bool get isChangeDetail => _isChangeDetail;

  String get selectedMode => _selectedMode;

  void onChangeSliderValue(double value) {
    _currentSliderValue = value;
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
    print('mode =========== ${value}');
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
