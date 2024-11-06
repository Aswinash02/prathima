class LoanDetailModel {
  LoanDetailData? data;
  bool? success;
  int? status;

  LoanDetailModel({this.data, this.success, this.status});

  LoanDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? LoanDetailData.fromJson(json['data']) : null;
    success = json['success'];
    status = json['status'];
  }
}

class LoanDetailData {
  int? id;
  String? name;
  String? typeId;
  String? loanType;
  List<LoanDetailTenure>? loanTenure;
  String? interestRate;
  int? minimumAmount;
  int? maximumAmount;
  int? processingFee;
  int? otherFee;
  String? createdBy;
  String? createdAt;

  LoanDetailData(
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

  LoanDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    typeId = json['type_id'];
    loanType = json['loan_type'];
    if (json['loan_tenure'] != null) {
      loanTenure = <LoanDetailTenure>[];
      json['loan_tenure'].forEach((v) {
        loanTenure!.add(LoanDetailTenure.fromJson(v));
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

class LoanDetailTenure {
  String? type;
  String? value;

  LoanDetailTenure({this.type, this.value});

  LoanDetailTenure.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }
}
