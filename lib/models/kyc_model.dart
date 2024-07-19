import 'dart:convert';

KycResponseModel kycResponseModelFromJson(String str) =>
    KycResponseModel.fromJson(json.decode(str));

String kycResponseModelToJson(KycResponseModel data) => json.encode(data.toJson());
class KycResponseModel {
  String? message;
  bool? result;

  KycResponseModel({this.message, this.result});

  KycResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['result'] = this.result;
    return data;
  }
}
