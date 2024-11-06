class AllLoanModel {
  List<LoanData>? data;
  bool? success;
  int? status;

  AllLoanModel({this.data, this.success, this.status});

  AllLoanModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LoanData>[];
      json['data'].forEach((v) {
        data!.add(LoanData.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }
}

class LoanData {
  int? id;
  String? name;
  String? typeId;
  String? loanType;
  List<LoanTenure>? loanTenure;
  String? interestRate;
  int? minimumAmount;
  int? maximumAmount;
  int? processingFee;
  int? otherFee;
  String? createdBy;
  String? createdAt;

  LoanData(
      {this.id,
      this.name,
      this.typeId,
      this.loanType,
      this.loanTenure,
      this.interestRate,
      this.minimumAmount,
      this.maximumAmount,
      this.processingFee,
      this.otherFee,
      this.createdBy,
      this.createdAt});

  LoanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    typeId = json['type_id'];
    loanType = json['loan_type'];
    if (json['loan_tenure'] != null) {
      loanTenure = <LoanTenure>[];
      json['loan_tenure'].forEach((v) {
        loanTenure!.add(LoanTenure.fromJson(v));
      });
    }
    interestRate = json['interest_rate'];
    minimumAmount = json['minimum_amount'];
    maximumAmount = json['maximum_amount'];
    processingFee = json['processing_fee'];
    otherFee = json['other_fee'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }
}

class LoanTenure {
  String? type;
  String? value;

  LoanTenure({this.type, this.value});

  LoanTenure.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }
}
