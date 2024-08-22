class LoginResponse {
  String? message;
  User? user;
  bool? result;
  String? token;

  LoginResponse({this.message, this.user, this.result, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    result = json['result'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['result'] = result;
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? emailVerifiedAt;
  String? userType;
  String? createdAt;
  String? updatedAt;
  String? pincode;
  String? city;
  String? district;
  String? state;
  String? country;
  String? otp;
  String? gender;
  String? dob;
  String? address;
  String? houseType;
  String? companyName;
  String? companyEmail;
  String? companyLocation;
  String? otpExpiresAt;
  PanData? panData;

  User(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.emailVerifiedAt,
      this.userType,
      this.createdAt,
      this.updatedAt,
      this.pincode,
      this.city,
      this.district,
      this.state,
      this.country,
      this.otp,
      this.gender,
      this.dob,
      this.address,
      this.houseType,
      this.companyName,
      this.companyEmail,
      this.companyLocation,
      this.otpExpiresAt,
      this.panData});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    emailVerifiedAt = json['email_verified_at'];
    userType = json['user_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pincode = json['pincode'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    country = json['country'];
    otp = json['otp'];
    gender = json['gender'];
    dob = json['dob'];
    address = json['address'];
    houseType = json['house_type'];
    companyName = json['company_name'];
    companyEmail = json['company_email'];
    companyLocation = json['company_location'];
    otpExpiresAt = json['otp_expires_at'];
    panData =
        json['pan_data'] != null ? PanData.fromJson(json['pan_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['email_verified_at'] = emailVerifiedAt;
    data['user_type'] = userType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['pincode'] = pincode;
    data['city'] = city;
    data['district'] = district;
    data['state'] = state;
    data['country'] = country;
    data['otp'] = otp;
    data['gender'] = gender;
    data['dob'] = dob;
    data['address'] = address;
    data['house_type'] = houseType;
    data['company_name'] = companyName;
    data['company_email'] = companyEmail;
    data['company_location'] = companyLocation;
    data['otp_expires_at'] = otpExpiresAt;
    if (panData != null) {
      data['pan_data'] = panData!.toJson();
    }
    return data;
  }
}

class PanData {
  int? responseStatusId;
  Data? data;
  int? responseTypeId;
  String? message;
  int? status;

  PanData(
      {this.responseStatusId,
      this.data,
      this.responseTypeId,
      this.message,
      this.status});

  PanData.fromJson(Map<String, dynamic> json) {
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
  String? panNumber;
  String? aadhaarSeedingStatus;
  String? gender;
  String? panReturnedName;
  String? lastName;
  String? aadhaarSeedingStatusCode;
  String? middleName;
  String? title;
  String? firstName;

  Data(
      {this.panNumber,
      this.aadhaarSeedingStatus,
      this.gender,
      this.panReturnedName,
      this.lastName,
      this.aadhaarSeedingStatusCode,
      this.middleName,
      this.title,
      this.firstName});

  Data.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pan_number'] = this.panNumber;
    data['aadhaar_seeding_status'] = this.aadhaarSeedingStatus;
    data['gender'] = this.gender;
    data['pan_returned_name'] = this.panReturnedName;
    data['last_name'] = this.lastName;
    data['aadhaar_seeding_status_code'] = this.aadhaarSeedingStatusCode;
    data['middle_name'] = this.middleName;
    data['title'] = this.title;
    data['first_name'] = this.firstName;
    return data;
  }
}
