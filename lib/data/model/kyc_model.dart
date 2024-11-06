class KycResponseModel {
  String? message;
  String? kycId;
  bool? result;
  List? errors;

  KycResponseModel({this.message, this.result, this.errors,this.kycId});

  KycResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result = json['result'];
    errors = json['errors'];
  }
}
