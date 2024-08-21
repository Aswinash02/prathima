class AadhaarOTPModel {
  int? timestamp;
  String? transactionId;
  AadhaarOTPData? data;
  int? code;

  AadhaarOTPModel({this.timestamp, this.transactionId, this.data, this.code});

  AadhaarOTPModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    transactionId = json['transaction_id'];
    data = json['data'] != null ? AadhaarOTPData.fromJson(json['data']) : null;
    code = json['code'];
  }
}

class AadhaarOTPData {
  String? entity;
  int? referenceId;
  String? status;
  String? message;
  String? careOf;
  String? fullAddress;
  String? dateOfBirth;
  String? emailHash;
  String? gender;
  String? name;
  Address? address;
  int? yearOfBirth;
  String? mobileHash;
  String? photo;
  String? shareCode;

  AadhaarOTPData(
      {this.entity,
      this.referenceId,
      this.status,
      this.message,
      this.careOf,
      this.fullAddress,
      this.dateOfBirth,
      this.emailHash,
      this.gender,
      this.name,
      this.address,
      this.yearOfBirth,
      this.mobileHash,
      this.photo,
      this.shareCode});

  AadhaarOTPData.fromJson(Map<String, dynamic> json) {
    entity = json['@entity'];
    referenceId = json['reference_id'];
    status = json['status'];
    message = json['message'];
    careOf = json['care_of'];
    fullAddress = json['full_address'];
    dateOfBirth = json['date_of_birth'];
    emailHash = json['email_hash'];
    gender = json['gender'];
    name = json['name'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    yearOfBirth = json['year_of_birth'];
    mobileHash = json['mobile_hash'];
    photo = json['photo'];
    shareCode = json['share_code'];
  }
}

class Address {
  String? entity;
  String? country;
  String? district;
  String? house;
  String? landmark;
  int? pinCode;
  String? postOffice;
  String? state;
  String? street;
  String? subDistrict;
  String? vtc;

  Address(
      {this.entity,
      this.country,
      this.district,
      this.house,
      this.landmark,
      this.pinCode,
      this.postOffice,
      this.state,
      this.street,
      this.subDistrict,
      this.vtc});

  Address.fromJson(Map<String, dynamic> json) {
    entity = json['@entity'];
    country = json['country'];
    district = json['district'];
    house = json['house'];
    landmark = json['landmark'];
    pinCode = json['pincode'];
    postOffice = json['post_office'];
    state = json['state'];
    street = json['street'];
    subDistrict = json['subdistrict'];
    vtc = json['vtc'];
  }
}
