class AgreementModel {
  List<AgreementData>? data;
  bool? success;
  int? status;

  AgreementModel({this.data, this.success, this.status});

  AgreementModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AgreementData>[];
      json['data'].forEach((v) {
        data!.add(AgreementData.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }
}

class AgreementData {
  int? id;
  String? type;
  String? value;

  AgreementData({this.id, this.type, this.value});

  AgreementData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    value = json['value'];
  }
}
