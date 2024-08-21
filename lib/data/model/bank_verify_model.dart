class BankVerifyModel {
  Success? success;

  BankVerifyModel({this.success});

  BankVerifyModel.fromJson(Map<String, dynamic> json) {
    success =
        json['success'] != null ? new Success.fromJson(json['success']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success!.toJson();
    }
    return data;
  }
}

class Success {
  String? status;
  String? message;
  Response? response;

  Success({this.status, this.message, this.response});

  Success.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  int? responseStatusId;
  Data? data;
  int? responseTypeId;
  String? message;
  int? status;

  Response(
      {this.responseStatusId,
      this.data,
      this.responseTypeId,
      this.message,
      this.status});

  Response.fromJson(Map<String, dynamic> json) {
    responseStatusId = json['response_status_id'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    responseTypeId = json['response_type_id'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_status_id'] = this.responseStatusId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['response_type_id'] = this.responseTypeId;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? clientRefId;
  String? bank;
  String? amount;
  String? isNameEditable;
  String? userCode;
  String? fee;
  String? verificationFailureRefund;
  String? aadhar;
  String? recipientName;
  String? isIfscRequired;
  String? account;
  String? tid;

  Data(
      {this.clientRefId,
      this.bank,
      this.amount,
      this.isNameEditable,
      this.userCode,
      this.fee,
      this.verificationFailureRefund,
      this.aadhar,
      this.recipientName,
      this.isIfscRequired,
      this.account,
      this.tid});

  Data.fromJson(Map<String, dynamic> json) {
    clientRefId = json['client_ref_id'];
    bank = json['bank'];
    amount = json['amount'];
    isNameEditable = json['is_name_editable'];
    userCode = json['user_code'];
    fee = json['fee'];
    verificationFailureRefund = json['verification_failure_refund'];
    aadhar = json['aadhar'];
    recipientName = json['recipient_name'];
    isIfscRequired = json['is_Ifsc_required'];
    account = json['account'];
    tid = json['tid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_ref_id'] = this.clientRefId;
    data['bank'] = this.bank;
    data['amount'] = this.amount;
    data['is_name_editable'] = this.isNameEditable;
    data['user_code'] = this.userCode;
    data['fee'] = this.fee;
    data['verification_failure_refund'] = this.verificationFailureRefund;
    data['aadhar'] = this.aadhar;
    data['recipient_name'] = this.recipientName;
    data['is_Ifsc_required'] = this.isIfscRequired;
    data['account'] = this.account;
    data['tid'] = this.tid;
    return data;
  }
}
