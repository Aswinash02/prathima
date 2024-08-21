class KycResponseModel {
  String? message;
  bool? result;
  List? errors;

  KycResponseModel({this.message, this.result});

  KycResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result = json['result'];
    errors = json['errors'];
  }
}

