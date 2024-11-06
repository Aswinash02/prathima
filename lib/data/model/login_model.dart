class LoginResponse {
  String? message;
  User? user;
  bool? result;
  String? token;
  String? tokenType;

  LoginResponse({this.message, this.user, this.result, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    result = json['result'];
    token = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['result'] = result;
    data['access_token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}

class User {
  int? id;
  String? deviceToken;
  String? type;
  String? name;
  String? email;
  String? phoneNumber;
  String? emailVerifiedAt;
  int? aadhaarVerified;
  int? panVerified;
  int? bankVerified;
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
      this.deviceToken,
      this.type,
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
    deviceToken = json['device_token'];
    type = json['type'];
    name = json['name'];
    panVerified = json['pan_verified'];
    bankVerified = json['bank_verified'];
    aadhaarVerified = json['aadhaar_verified'];
    email = json['email'];
    phoneNumber = json['phone'];
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
    data['device_token'] = deviceToken;
    data['type'] = type;
    data['pan_verified'] = panVerified;
    data['bank_verified'] = bankVerified;
    data['aadhaar_verified'] = aadhaarVerified;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phoneNumber;
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
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    responseTypeId = json['response_type_id'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_status_id'] =responseStatusId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['response_type_id'] = responseTypeId;
    data['message'] = message;
    data['status'] = status;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pan_number'] = panNumber;
    data['aadhaar_seeding_status'] = aadhaarSeedingStatus;
    data['gender'] = gender;
    data['pan_returned_name'] = panReturnedName;
    data['last_name'] = lastName;
    data['aadhaar_seeding_status_code'] = aadhaarSeedingStatusCode;
    data['middle_name'] = middleName;
    data['title'] = title;
    data['first_name'] = firstName;
    return data;
  }
}
