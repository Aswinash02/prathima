class GetUserKYCDataModel {
  Success? success;

  GetUserKYCDataModel({this.success});

  GetUserKYCDataModel.fromJson(Map<String, dynamic> json) {
    success =
        json['success'] != null ? Success.fromJson(json['success']) : null;
  }
}

class Success {
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

  Success(
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
      this.employmentType});

  Success.fromJson(Map<String, dynamic> json) {
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
  }
}
