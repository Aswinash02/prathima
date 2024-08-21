class KycStatusModel {
  String? message;
  String? reason;
  int? status;

  KycStatusModel({this.message, this.reason, this.status});

  KycStatusModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    reason = json['reason'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['reason'] = reason;
    data['status'] = status;
    return data;
  }
}
