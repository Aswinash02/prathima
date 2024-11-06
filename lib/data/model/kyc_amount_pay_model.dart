class KYCAmountPayResponse {
  bool? result;
  String? message;
  Details? details;

  KYCAmountPayResponse({this.result, this.message, this.details});

  KYCAmountPayResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    details =
    json['details'] != null ? Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}

class Details {
  String? userId;
  String? userLoanId;
  String? isPaymentCollected;
  String? paymentDetails;
  String? kycVerificationAmount;
  String? updatedAt;
  String? createdAt;
  int? id;

  Details(
      {this.userId,
        this.userLoanId,
        this.isPaymentCollected,
        this.paymentDetails,
        this.kycVerificationAmount,
        this.updatedAt,
        this.createdAt,
        this.id});

  Details.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userLoanId = json['user_loan_id'];
    isPaymentCollected = json['is_payment_collected'];
    paymentDetails = json['payment_details'];
    kycVerificationAmount = json['kyc_verification_amount'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_loan_id'] = userLoanId;
    data['is_payment_collected'] = isPaymentCollected;
    data['payment_details'] = paymentDetails;
    data['kyc_verification_amount'] = kycVerificationAmount;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
