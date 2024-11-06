class LoanTypeModel {
  List<LoanTypeData>? data;
  bool? success;
  int? status;

  LoanTypeModel({this.data, this.success, this.status});

  LoanTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LoanTypeData>[];
      json['data'].forEach((v) {
        data!.add(LoanTypeData.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }
}

class LoanTypeData {
  int? id;
  String? name;

  LoanTypeData({this.id, this.name});

  LoanTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
