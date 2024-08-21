import 'package:get/get.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/model/approved_loan_model.dart';
import 'package:prathima_loan_app/data/repository/loan_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';

class LoanController extends GetxController implements GetxService {
  final LoanRepository loanRepository;

  LoanController({required this.loanRepository});

  double _loanAmountSliderValue = 5000;
  double _dueMonthSliderValue = 2;

  // bool _isChangeDetail = false;
  String _selectedMode = '';
  bool _isNext = false;
  bool _setAmount = false;
  int _interest = 0;
  DueDateInterestRate? _selectedDueDate;
  List<DueDateInterestRate> _dueDateInterestRate = [];
  bool _loadingState = false;

  ApprovedLoanModel? approvedLoanData;
  List<PaymentMethod> paymentMethodString = [
    PaymentMethod(img: "assets/img/phonpe.png", name: 'PhonePe'),
    PaymentMethod(img: "assets/img/gpay.png", name: 'Google Pay'),
    PaymentMethod(img: "assets/img/Paytm.png", name: 'Paytm'),
    PaymentMethod(img: "assets/img/BHIM.png", name: 'BHIM'),
  ];

  double get loanAmountSliderValue => _loanAmountSliderValue;

  double get dueMonthSliderValue => _dueMonthSliderValue;

  DueDateInterestRate? get selectedDueDate => _selectedDueDate;

  // bool get isChangeDetail => _isChangeDetail;

  String get selectedMode => _selectedMode;

  bool get loadingState => _loadingState;

  bool get setAmount => _setAmount;

  int get interest => _interest;

  List<DueDateInterestRate> get dueDateInterestRate => _dueDateInterestRate;

  bool get isNext => _isNext;

  void onChangeLoanAmountSlider(double value) {
    _loanAmountSliderValue = value;
    _setAmount = true;
    update();
  }

  void onChangeDueMonthSlider(double value) {
    _dueMonthSliderValue = value;
    update();
  }

  void dueProceed() {
    if (selectedDueDate == null) {
      showCustomSnackBar("Select Due Duration");
      return;
    }
    Get.toNamed(RouteHelper.loanAgreementScreen);
    // if (_isChangeDetail == false) {
    //   _isChangeDetail = true;
    // } else {
    //   Get.toNamed(RouteHelper.loanAgreementScreen);
    // }
    update();
  }

  void onChangeMode(String? value) {
    _selectedMode = value!;
    update();
  }

  Future<void> getApprovedLoanData() async {
    _loadingState = true;
    update();

    approvedLoanData = await loanRepository.getApprovedLoanData();
    print('loanData ============ > ${approvedLoanData}');
    if (approvedLoanData!.status != false) {
      _dueDateInterestRate = approvedLoanData!.loan!.dueDateInterestRate ?? [];
    }
    _loadingState = false;
    update();
  }

  void onPressedBack() {
    _isNext = !_isNext;
    update();
  }

  void loanAmountProceed() {
    _setAmount = true;
    update();
  }

  void onChangeDueDate(DueDateInterestRate? value) {
    _selectedDueDate = value;
    // _interest = int.parse(value!.interestRate ?? '');
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
