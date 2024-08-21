//
// import 'package:prathima_loan_app/data/model/aadhaar_otp_model.dart';
// import 'package:prathima_loan_app/data/model/pan_verify_model.dart';
//
// class UserDataModel {
//   User? user;
//   Kyc? userKyc;
//   bool? status;
//
//   UserDataModel({this.user, this.userKyc, this.status});
//
//   UserDataModel.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//
//     // Check if 'user_kyc' is a map before parsing
//     if (json['user_kyc'] is Map<String, dynamic>) {
//       userKyc = Kyc.fromJson(json['user_kyc']);
//     } else {
//       userKyc = null;
//     }
//
//     status = json['status'];
//   }
// }
//
// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? phoneNumber;
//   String? emailVerifiedAt;
//   String? userType;
//   String? createdAt;
//   String? updatedAt;
//   String? pincode;
//   String? city;
//   String? district;
//   String? state;
//   String? country;
//   String? otp;
//   String? gender;
//   String? dob;
//   String? otpExpiresAt;
//   PanData? panData;
//   int? panVerified;
//   int? bankVerified;
//   int? aadhaarVerified;
//   AadhaarOTPModel? aadhaarData;
//   String? mailotp;
//   int? numberVerified;
//   int? mailVerified;
//   Kyc? kyc;
//
//   User(
//       {this.id,
//       this.name,
//       this.email,
//       this.phoneNumber,
//       this.emailVerifiedAt,
//       this.userType,
//       this.createdAt,
//       this.updatedAt,
//       this.pincode,
//       this.city,
//       this.district,
//       this.state,
//       this.country,
//       this.otp,
//       this.gender,
//       this.dob,
//       this.otpExpiresAt,
//       this.panData,
//       this.panVerified,
//       this.bankVerified,
//       this.aadhaarVerified,
//       this.aadhaarData,
//       this.mailotp,
//       this.numberVerified,
//       this.mailVerified,
//       this.kyc});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phoneNumber = json['phone_number'];
//     emailVerifiedAt = json['email_verified_at'];
//     userType = json['user_type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pincode = json['pincode'];
//     city = json['city'];
//     district = json['district'];
//     state = json['state'];
//     country = json['country'];
//     otp = json['otp'];
//     gender = json['gender'];
//     dob = json['dob'];
//     otpExpiresAt = json['otp_expires_at'];
//
//     // Check if 'pan_data' is a map before parsing
//     if (json['pan_data'] is Map<String, dynamic>) {
//       panData = PanData.fromJson(json['pan_data']);
//     } else {
//       panData = null;
//     }
//
//     panVerified = json['pan_verified'];
//     bankVerified = json['bank_verified'];
//     aadhaarVerified = json['aadhaar_verified'];
//     if (json['aadhaar_data'] is Map<String, dynamic>) {
//       aadhaarData = AadhaarOTPModel.fromJson(json['aadhaar_data']);
//     } else {
//       aadhaarData = null;
//     }
//     // aadhaarData = json['aadhaar_data'];
//     mailotp = json['mailotp'];
//     numberVerified = json['number_verified'];
//     mailVerified = json['mail_verified'];
//
//     // Check if 'kyc' is a map before parsing
//     if (json['kyc'] is Map<String, dynamic>) {
//       kyc = Kyc.fromJson(json['kyc']);
//     } else {
//       kyc = null;
//     }
//   }
// }
//
// class Kyc {
//   int? id;
//   int? userId;
//   String? status;
//   String? aadharNumber;
//   String? panNumber;
//   String? panFile;
//   String? aadharFile;
//   String? accountNumber;
//   String? ifscCode;
//   String? bankName;
//   String? propertyTaxRecipt;
//   String? rentalAgreement;
//   String? smartCardFile;
//   String? drivingLicenseFile;
//   String? recentGasBill;
//   String? recentBroadbandBill;
//   String? paySlip;
//   String? idCard;
//   String? pfMemberPassbook;
//   String? accountHolderName;
//   int? isVerified;
//   String? createdAt;
//   String? updatedAt;
//   int? relationshipManagerVerified;
//   int? fieldManagerVerified;
//   String? loanAmount;
//   String? reason;
//   String? houseType;
//   String? companyName;
//   String? companyEmail;
//   String? companyLocation;
//   String? address;
//   String? employmentType;
//
//   Kyc(
//       {this.id,
//       this.userId,
//       this.status,
//       this.aadharNumber,
//       this.panNumber,
//       this.panFile,
//       this.aadharFile,
//       this.accountNumber,
//       this.ifscCode,
//       this.bankName,
//       this.propertyTaxRecipt,
//       this.rentalAgreement,
//       this.smartCardFile,
//       this.drivingLicenseFile,
//       this.recentGasBill,
//       this.recentBroadbandBill,
//       this.paySlip,
//       this.idCard,
//       this.pfMemberPassbook,
//       this.accountHolderName,
//       this.isVerified,
//       this.createdAt,
//       this.updatedAt,
//       this.relationshipManagerVerified,
//       this.fieldManagerVerified,
//       this.loanAmount,
//       this.reason,
//       this.houseType,
//       this.companyName,
//       this.companyEmail,
//       this.companyLocation,
//       this.address,
//       this.employmentType});
//
//   Kyc.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     status = json['status'];
//     aadharNumber = json['aadhar_number'];
//     panNumber = json['pan_number'];
//     panFile = json['pan_file'];
//     aadharFile = json['aadhar_file'];
//     accountNumber = json['account_number'];
//     ifscCode = json['ifsc_code'];
//     bankName = json['bank_name'];
//     propertyTaxRecipt = json['property_tax_recipt'];
//     rentalAgreement = json['rental_agreement'];
//     smartCardFile = json['smart_card_file'];
//     drivingLicenseFile = json['driving_license_file'];
//     recentGasBill = json['recent_gas_bill'];
//     recentBroadbandBill = json['recent_broadband_bill'];
//     paySlip = json['pay_slip'];
//     idCard = json['id_card'];
//     pfMemberPassbook = json['pf_member_passbook'];
//     accountHolderName = json['account_holder_name'];
//     isVerified = json['is_verified'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     relationshipManagerVerified = json['relationship_manager_verified'];
//     fieldManagerVerified = json['field_manager_verified'];
//     loanAmount = json['loan_amount'];
//     reason = json['reason'];
//     houseType = json['house_type'];
//     companyName = json['company_name'];
//     companyEmail = json['company_email'];
//     companyLocation = json['company_location'];
//     address = json['address'];
//     employmentType = json['employment_type'];
//   }
// }
//
// // class PanData {
// //   int? responseStatusId;
// //   PanDetails? data;
// //   int? responseTypeId;
// //   String? message;
// //   int? status;
// //
// //   PanData({
// //     this.responseStatusId,
// //     this.data,
// //     this.responseTypeId,
// //     this.message,
// //     this.status,
// //   });
// //
// //   PanData.fromJson(Map<String, dynamic> json) {
// //     responseStatusId = json['response_status_id'];
// //
// //     // Check if 'data' is a map before parsing
// //     if (json['data'] is Map<String, dynamic>) {
// //       data = PanDetails.fromJson(json['data']);
// //     } else {
// //       data = null;
// //     }
// //
// //     responseTypeId = json['response_type_id'];
// //     message = json['message'];
// //     status = json['status'];
// //   }
// // }
// //
// // class PanDetails {
// //   String? panNumber;
// //   String? aadhaarSeedingStatus;
// //   String? gender;
// //   String? panReturnedName;
// //   String? lastName;
// //   String? aadhaarSeedingStatusCode;
// //   String? middleName;
// //   String? title;
// //   String? firstName;
// //
// //   PanDetails({
// //     this.panNumber,
// //     this.aadhaarSeedingStatus,
// //     this.gender,
// //     this.panReturnedName,
// //     this.lastName,
// //     this.aadhaarSeedingStatusCode,
// //     this.middleName,
// //     this.title,
// //     this.firstName,
// //   });
// //
// //   PanDetails.fromJson(Map<String, dynamic> json) {
// //     panNumber = json['pan_number'];
// //     aadhaarSeedingStatus = json['aadhaar_seeding_status'];
// //     gender = json['gender'];
// //     panReturnedName = json['pan_returned_name'];
// //     lastName = json['last_name'];
// //     aadhaarSeedingStatusCode = json['aadhaar_seeding_status_code'];
// //     middleName = json['middle_name'];
// //     title = json['title'];
// //     firstName = json['first_name'];
// //   }
// // }
import 'dart:convert';

class UserDataModel {
  User? user;
  Kyc? userKyc;
  bool? status;

  UserDataModel({this.user, this.userKyc, this.status});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    print('json ========== ${json['user']}');
    print('json ========== ${json['user_kyc']}');
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    userKyc = json['user_kyc'] != 'KYC details not available'
        ? Kyc.fromJson(json['user_kyc'])
        : null;
    status = json['status'];
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
  String? otpExpiresAt;
  Pan? pan;
  int? panVerified;
  int? bankVerified;
  int? aadhaarVerified;
  Aadhaar? aadhaar;
  String? mailotp;
  String? numberVerified;
  String? mailVerified;
  double? latitude;
  double? longitude;
  Kyc? kyc;

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
      this.otpExpiresAt,
      this.pan,
      this.panVerified,
      this.bankVerified,
      this.aadhaarVerified,
      this.aadhaar,
      this.mailotp,
      this.numberVerified,
      this.mailVerified,
      this.latitude,
      this.longitude,
      this.kyc});

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
    otpExpiresAt = json['otp_expires_at'];
    pan = json['pan_data'] != null ? Pan.fromJson(json['pan_data']) : null;
    panVerified = json['pan_verified'];
    bankVerified = json['bank_verified'];
    aadhaarVerified = json['aadhaar_verified'];
    aadhaar = json['aadhaar_data'] != null
        ? Aadhaar.fromJson(json['aadhaar_data'])
        : null;
    mailotp = json['mailotp'];
    numberVerified = json['number_verified'];
    mailVerified = json['mail_verified'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    kyc = json['kyc'] != null ? Kyc.fromJson(json['kyc']) : null;
  }
}

class Pan {
  int? responseStatusId;
  PanData? panData;
  int? responseTypeId;
  String? message;
  int? status;

  Pan(
      {this.responseStatusId,
      this.panData,
      this.responseTypeId,
      this.message,
      this.status});

  Pan.fromJson(Map<String, dynamic> json) {
    responseStatusId = json['response_status_id'];
    panData = json['data'] != null ? PanData.fromJson(json['data']) : null;
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

class Aadhaar {
  int? timestamp;
  String? transactionId;
  AadhaarData? aadhaarData;
  int? code;

  Aadhaar({this.timestamp, this.transactionId, this.aadhaarData, this.code});

  Aadhaar.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    transactionId = json['transaction_id'];
    aadhaarData =
        json['data'] != null ? AadhaarData.fromJson(json['data']) : null;
    code = json['code'];
  }
}

class AadhaarData {
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

  AadhaarData(
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

  AadhaarData.fromJson(Map<String, dynamic> json) {
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
        json['address'] != null ? new Address.fromJson(json['address']) : null;
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
  int? pincode;
  String? postOffice;
  String? state;
  String? street;
  String? subdistrict;
  String? vtc;

  Address(
      {this.entity,
      this.country,
      this.district,
      this.house,
      this.landmark,
      this.pincode,
      this.postOffice,
      this.state,
      this.street,
      this.subdistrict,
      this.vtc});

  Address.fromJson(Map<String, dynamic> json) {
    entity = json['@entity'];
    country = json['country'];
    district = json['district'];
    house = json['house'];
    landmark = json['landmark'];
    pincode = json['pincode'];
    postOffice = json['post_office'];
    state = json['state'];
    street = json['street'];
    subdistrict = json['subdistrict'];
    vtc = json['vtc'];
  }
}

class Kyc {
  int? id;
  int? userId;
  String? status;
  String? aadharNumber;
  String? panNumber;
  String? panFile;
  String? aadharFile;
  String? accountNumber;
  String? ifscCode;
  String? bankName;
  String? propertyTaxRecipt;
  String? rentalAgreement;
  String? smartCardFile;
  String? drivingLicenseFile;
  String? recentGasBill;
  String? recentBroadbandBill;
  String? paySlip1;
  String? paySlip2;
  String? paySlip3;
  String? idCard;
  String? pfMemberPassbook;
  String? accountHolderName;
  int? isVerified;
  String? createdAt;
  String? updatedAt;
  int? relationshipManagerVerified;
  int? fieldManagerVerified;
  String? loanAmount;
  String? reason;
  String? houseType;
  String? companyName;
  String? companyEmail;
  String? companyLocation;
  String? address;
  String? employmentType;
  int? assignedRelationManagerId;
  int? verifiedRelationManagerId;
  int? assignedFieldManagerId;
  int? verifiedFieldManagerId;

  Kyc(
      {this.id,
      this.userId,
      this.status,
      this.aadharNumber,
      this.panNumber,
      this.panFile,
      this.aadharFile,
      this.accountNumber,
      this.ifscCode,
      this.bankName,
      this.propertyTaxRecipt,
      this.rentalAgreement,
      this.smartCardFile,
      this.drivingLicenseFile,
      this.recentGasBill,
      this.recentBroadbandBill,
      this.paySlip1,
      this.paySlip2,
      this.paySlip3,
      this.idCard,
      this.pfMemberPassbook,
      this.accountHolderName,
      this.isVerified,
      this.createdAt,
      this.updatedAt,
      this.relationshipManagerVerified,
      this.fieldManagerVerified,
      this.loanAmount,
      this.reason,
      this.houseType,
      this.companyName,
      this.companyEmail,
      this.companyLocation,
      this.address,
      this.employmentType,
      this.assignedRelationManagerId,
      this.verifiedRelationManagerId,
      this.assignedFieldManagerId,
      this.verifiedFieldManagerId});

  Kyc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    aadharNumber = json['aadhar_number'];
    panNumber = json['pan_number'];
    panFile = json['pan_file'];
    aadharFile = json['aadhar_file'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    bankName = json['bank_name'];
    propertyTaxRecipt = json['property_tax_recipt'];
    rentalAgreement = json['rental_agreement'];
    smartCardFile = json['smart_card_file'];
    drivingLicenseFile = json['driving_license_file'];
    recentGasBill = json['recent_gas_bill'];
    recentBroadbandBill = json['recent_broadband_bill'];
    paySlip1 = json['pay_slip1'];
    paySlip2 = json['pay_slip2'];
    paySlip3 = json['pay_slip3'];
    idCard = json['id_card'];
    pfMemberPassbook = json['pf_member_passbook'];
    accountHolderName = json['account_holder_name'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    relationshipManagerVerified = json['relationship_manager_verified'];
    fieldManagerVerified = json['field_manager_verified'];
    loanAmount = json['loan_amount'];
    reason = json['reason'];
    houseType = json['house_type'];
    companyName = json['company_name'];
    companyEmail = json['company_email'];
    companyLocation = json['company_location'];
    address = json['address'];
    employmentType = json['employment_type'];
    assignedRelationManagerId = json['assigned_relation_manager_id'];
    verifiedRelationManagerId = json['verified_relation_manager_id'];
    assignedFieldManagerId = json['assigned_field_manager_id'];
    verifiedFieldManagerId = json['verified_field_manager_id'];
  }
}
