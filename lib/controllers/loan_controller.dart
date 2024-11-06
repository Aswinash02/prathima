import 'package:get/get.dart';
import 'package:prathima_loan_app/customs/custom_snackbar.dart';
import 'package:prathima_loan_app/data/api/api_checker.dart';
import 'package:prathima_loan_app/data/model/all_loan_model.dart';
import 'package:prathima_loan_app/data/model/approved_loan_model.dart';
import 'package:prathima_loan_app/data/model/loan_detail_model.dart';
import 'package:prathima_loan_app/data/model/loan_type_model.dart';
import 'package:prathima_loan_app/data/repository/loan_repository.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';

class LoanController extends GetxController implements GetxService {
  final LoanRepository loanRepository;

  LoanController({required this.loanRepository});

  double _dueMonthSliderValue = 2;

  // bool _isChangeDetail = false;
  String _selectedMode = '';
  bool _getLoanLoadingState = false;
  bool _checkLoanLoadingState = false;
  double? _loanAmountSliderValue;
  int? _loanId;

  DueDateInterestRate? _selectedDueDate;
  List<DueDateInterestRate> _dueDateInterestRate = [];
  final List<LoanTypeData> _loanTypesList = [];
  final List<LoanDetailData> _loanDetailDataList = [];
  final List<LoanData> _loanList = [];
  bool _loadingState = false;
  bool _loanDetailLoadingState = false;
  bool _homeLoadingState = false;
  int _selectedLoanIndex = 0;

  ApprovedLoanModel? approvedLoanData;
  List<PaymentMethod> paymentMethodString = [
    PaymentMethod(img: "assets/img/phonpe.png", name: 'PhonePe'),
    PaymentMethod(img: "assets/img/gpay.png", name: 'Google Pay'),
    PaymentMethod(img: "assets/img/Paytm.png", name: 'Paytm'),
    PaymentMethod(img: "assets/img/BHIM.png", name: 'BHIM'),
  ];

  double get dueMonthSliderValue => _dueMonthSliderValue;

  DueDateInterestRate? get selectedDueDate => _selectedDueDate;

  // bool get isChangeDetail => _isChangeDetail;

  String get selectedMode => _selectedMode;

  bool get loadingState => _loadingState;

  bool get homeLoadingState => _homeLoadingState;

  double? get loanAmountSliderValue => _loanAmountSliderValue;

  int? get loanId => _loanId;

  bool get getLoanLoadingState => _getLoanLoadingState;

  bool get checkLoanLoadingState => _checkLoanLoadingState;

  bool get loanDetailLoadingState => _loanDetailLoadingState;

  List<DueDateInterestRate> get dueDateInterestRate => _dueDateInterestRate;

  List<LoanTypeData> get loanTypesList => _loanTypesList;

  List<LoanDetailData> get loanDetailDataList => _loanDetailDataList;

  List<LoanData> get loanList => _loanList;

  int get selectedLoanIndex => _selectedLoanIndex;

  void onChangeDueMonthSlider(double value) {
    _dueMonthSliderValue = value;
    update();
  }

  void dueProceed() {
    if (selectedDueDate == null) {
      showCustomSnackBar("Select Due Duration");
      return;
    }
    Get.toNamed(
      RouteHelper.loanAgreementScreen,
    );
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
    if (approvedLoanData!.status != false) {
      _dueDateInterestRate = approvedLoanData!.loan!.dueDateInterestRate ?? [];
    }
    _loadingState = false;
    update();
  }

  void calledDispose() {
    _selectedDueDate = null;
  }

  void onChangeDueDate(DueDateInterestRate? value) {
    _selectedDueDate = value;
    // _interest = int.parse(value!.interestRate ?? '');
    update();
  }

  void onChangeLoanAmountSlider(double value) {
    _loanAmountSliderValue = value;
    update();
  }

  Future<void> getLoanType() async {
    _homeLoadingState = true;
    update();
    var response = await loanRepository.getLoanType();
    if (response.statusCode == 200) {
      LoanTypeModel loanTypes = LoanTypeModel.fromJson(response.body);
      if (loanTypes.data != null) {
        _loanTypesList.clear();
        _loanTypesList.add(LoanTypeData(id: 0, name: "Credit Score"));
        _loanTypesList.addAll(loanTypes.data!);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    _homeLoadingState = false;
    update();
  }

  Future<void> getLoanDetail(int id) async {
    _loanDetailLoadingState = true;

    var response = await loanRepository.getLoanDetail(id);
    if (response.statusCode == 200) {
      LoanDetailModel loanDetail = LoanDetailModel.fromJson(response.body);
      if (loanDetail.data != null) {
        _loanDetailDataList.clear();
        _loanId = loanDetail.data!.id;
        _loanAmountSliderValue = loanDetail.data!.minimumAmount!.toDouble();
        _loanDetailDataList.add(loanDetail.data!);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    _loanDetailLoadingState = false;
    update();
  }

  onTapLoanContainer(int index) {
    _selectedLoanIndex = index;
    if (index == 0) {
      Get.toNamed(RouteHelper.creditScoreScreen);
    } else {
      Get.toNamed(RouteHelper.getLoanScreenRoute(loanTypesList[index].id!));
    }
  }

  Future<void> onChangeLoanIndex(int index) async {
    _selectedLoanIndex = index;
    update();
    await getAllLoan(loanTypesList[index].id!);
  }

  void onChangeIndex(index) {
    _selectedLoanIndex = index + 1;
  }

  Future<void> getAllLoan(int type) async {
    _loanList.clear();
    _getLoanLoadingState = true;
    var response = await loanRepository.getAllLoan(type.toString());
    if (response.statusCode == 200) {
      AllLoanModel loans = AllLoanModel.fromJson(response.body);
      if (loans.data != null) {
        _loanList.addAll(loans.data!);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    _getLoanLoadingState = false;
    update();
  }

  Future<void> checkLoanExistOrNot() async {
    _checkLoanLoadingState = true;
    update();
    var response = await loanRepository.checkLoanExistOrNot();
    if (response.statusCode == 200) {
      if (response.body['result'] == true) {
        Get.toNamed(RouteHelper.kycVerificationScreen);
      } else {
        Get.toNamed(RouteHelper.loanExistsScreen);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    _checkLoanLoadingState = false;
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
