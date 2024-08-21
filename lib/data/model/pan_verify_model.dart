class PanVerifyModel {
  Success? success;

  PanVerifyModel({this.success});

  PanVerifyModel.fromJson(Map<String, dynamic> json) {
    success =
        json['success'] != null ? Success.fromJson(json['success']) : null;
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
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }
}

class Response {
  int? responseStatusId;
  PanData? data;
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
    data = json['data'] != null ? PanData.fromJson(json['data']) : null;
    responseTypeId = json['response_type_id'];
    message = json['message'];
    status = json['status'];
  }
}

class PanData {
  String? panNumber;
  String? aadhaarSeedingStatus;
  String? gender;
  String? panReturnedName;
  String? lastName;
  String? aadhaarSeedingStatusCode;
  String? middleName;
  String? title;
  String? firstName;

  PanData(
      {this.panNumber,
      this.aadhaarSeedingStatus,
      this.gender,
      this.panReturnedName,
      this.lastName,
      this.aadhaarSeedingStatusCode,
      this.middleName,
      this.title,
      this.firstName});

  PanData.fromJson(Map<String, dynamic> json) {
    panNumber = json['pan_number'];
    aadhaarSeedingStatus = json['aadhaar_seeding_status'];
    gender = json['gender'];
    panReturnedName = json['pan_returned_name'];
    lastName = json['last_name'];
    aadhaarSeedingStatusCode = json['aadhaar_seeding_status_code'];
    middleName = json['middle_name'];
    title = json['title'];
    firstName = json['first_name'];
  }
}
