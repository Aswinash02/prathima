class AadhaarVerifyModel {
  int? timestamp;
  String? transactionId;
  String? message;
  AadhaarData? data;
  int? code;
  String? error;

  AadhaarVerifyModel(
      {this.timestamp, this.transactionId, this.data, this.code, this.error});

  AadhaarVerifyModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    transactionId = json['transaction_id'];
    data = json['data'] != null ? AadhaarData.fromJson(json['data']) : null;
    code = json['code'];
    error = json['error'];
    message = json['message'];
  }
}

class AadhaarData {
  String? entity;
  int? referenceId;
  String? message;

  AadhaarData({this.entity, this.referenceId, this.message});

  AadhaarData.fromJson(Map<String, dynamic> json) {
    entity = json['@entity'];
    referenceId = json['reference_id'];
    message = json['message'];
  }
}
