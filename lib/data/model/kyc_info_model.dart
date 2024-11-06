class KYCInfoModel {
  List<KYCInfoData>? data;
  bool? success;
  int? status;

  KYCInfoModel({this.data, this.success, this.status});

  KYCInfoModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <KYCInfoData>[];
      json['data'].forEach((v) {
        data!.add(KYCInfoData.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['status'] = status;
    return data;
  }
}

class KYCInfoData {
  int? id;
  int? loanDetailsId;
  int? loanStatus;
  int? userId;
  int? status;
  String? aadharNumber;
  String? panNumber;
  String? accountNumber;
  String? ifscCode;
  String? bankName;
  int? isVerified;
  int? relationshipManagerVerified;
  int? fieldManagerVerified;
  String? loanAmount;
  String? reason;
  String? loanRemarks;
  String? panFile;
  String? aadharFile;
  String? propertyTaxRecipt;
  String? rentalAgreement;
  String? smartCard;
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
  int? isPaymentCollected;
  String? paymentDetails;
  int? kycVerificationAmount;
  LoanInformation? loanInformation;
  UserApprovalLoanInformation? userApprovalLoanInformation;

  KYCInfoData(
      {this.id,
      this.loanDetailsId,
      this.loanStatus,
      this.userId,
      this.status,
      this.aadharNumber,
      this.panNumber,
      this.accountNumber,
      this.ifscCode,
      this.bankName,
      this.isVerified,
      this.relationshipManagerVerified,
      this.fieldManagerVerified,
      this.loanAmount,
      this.reason,
      this.loanRemarks,
      this.panFile,
      this.aadharFile,
      this.propertyTaxRecipt,
      this.rentalAgreement,
      this.smartCard,
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
      this.houseType,
      this.companyName,
      this.companyEmail,
      this.companyLocation,
      this.address,
      this.employmentType,
      this.assignedRelationManagerId,
      this.verifiedRelationManagerId,
      this.assignedFieldManagerId,
      this.verifiedFieldManagerId,
      this.isPaymentCollected,
      this.paymentDetails,
      this.kycVerificationAmount,
      this.loanInformation,
      this.userApprovalLoanInformation});

  KYCInfoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loanDetailsId = json['loan_details_id'];
    loanStatus = json['loan_status'];
    userId = json['user_id'];
    status = json['status'];
    aadharNumber = json['aadhar_number'];
    panNumber = json['pan_number'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    bankName = json['bank_name'];
    isVerified = json['is_verified'];
    relationshipManagerVerified = json['relationship_manager_verified'];
    fieldManagerVerified = json['field_manager_verified'];
    loanAmount = json['loan_amount'];
    reason = json['reason'];
    loanRemarks = json['loan_remarks'];
    panFile = json['pan_file'];
    aadharFile = json['aadhar_file'];
    propertyTaxRecipt = json['property_tax_recipt'];
    rentalAgreement = json['rental_agreement'];
    smartCard = json['smart_card'];
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
    isPaymentCollected = json['is_payment_collected'];
    paymentDetails = json['payment_details'];
    kycVerificationAmount = json['kyc_verification_amount'];
    loanInformation = json['loan_information'] != null
        ? LoanInformation.fromJson(json['loan_information'])
        : null;
    userApprovalLoanInformation = json['user_approval_loan_information'] != null
        ? UserApprovalLoanInformation.fromJson(
            json['user_approval_loan_information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['loan_details_id'] = loanDetailsId;
    data['loan_status'] = loanStatus;
    data['user_id'] = userId;
    data['status'] = status;
    data['aadhar_number'] = aadharNumber;
    data['pan_number'] = panNumber;
    data['account_number'] = accountNumber;
    data['ifsc_code'] = ifscCode;
    data['bank_name'] = bankName;
    data['is_verified'] = isVerified;
    data['relationship_manager_verified'] = relationshipManagerVerified;
    data['field_manager_verified'] = fieldManagerVerified;
    data['loan_amount'] = loanAmount;
    data['reason'] = reason;
    data['loan_remarks'] = loanRemarks;
    data['pan_file'] = panFile;
    data['aadhar_file'] = aadharFile;
    data['property_tax_recipt'] = propertyTaxRecipt;
    data['rental_agreement'] = rentalAgreement;
    data['smart_card'] = smartCard;
    data['smart_card_file'] = smartCardFile;
    data['driving_license_file'] = drivingLicenseFile;
    data['recent_gas_bill'] = recentGasBill;
    data['recent_broadband_bill'] = recentBroadbandBill;
    data['pay_slip1'] = paySlip1;
    data['pay_slip2'] = paySlip2;
    data['pay_slip3'] = paySlip3;
    data['id_card'] = idCard;
    data['pf_member_passbook'] = pfMemberPassbook;
    data['account_holder_name'] = accountHolderName;
    data['house_type'] = houseType;
    data['company_name'] = companyName;
    data['company_email'] = companyEmail;
    data['company_location'] = companyLocation;
    data['address'] = address;
    data['employment_type'] = employmentType;
    data['assigned_relation_manager_id'] = assignedRelationManagerId;
    data['verified_relation_manager_id'] = verifiedRelationManagerId;
    data['assigned_field_manager_id'] = assignedFieldManagerId;
    data['verified_field_manager_id'] = verifiedFieldManagerId;
    data['is_payment_collected'] = isPaymentCollected;
    data['payment_details'] = paymentDetails;
    data['kyc_verification_amount'] = kycVerificationAmount;
    if (loanInformation != null) {
      data['loan_information'] = loanInformation!.toJson();
    }
    if (userApprovalLoanInformation != null) {
      data['user_approval_loan_information'] =
          userApprovalLoanInformation!.toJson();
    }
    return data;
  }
}

class LoanInformation {
  int? id;
  String? name;
  String? typeId;
  String? loanType;
  List<LoanTenure>? loanTenure;
  String? interestRate;
  int? minimumAmount;
  int? maximumAmount;
  int? processingFee;
  int? otherFee;
  String? createdBy;
  String? createdAt;

  LoanInformation(
      {this.id,
      this.name,
      this.typeId,
      this.loanType,
      this.loanTenure,
      this.interestRate,
      this.minimumAmount,
      this.maximumAmount,
      this.processingFee,
      this.otherFee,
      this.createdBy,
      this.createdAt});

  LoanInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    typeId = json['type_id'];
    loanType = json['loan_type'];
    if (json['loan_tenure'] != null) {
      loanTenure = <LoanTenure>[];
      json['loan_tenure'].forEach((v) {
        loanTenure!.add(LoanTenure.fromJson(v));
      });
    }
    interestRate = json['interest_rate'];
    minimumAmount = json['minimum_amount'];
    maximumAmount = json['maximum_amount'];
    processingFee = json['processing_fee'];
    otherFee = json['other_fee'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type_id'] = typeId;
    data['loan_type'] = loanType;
    if (loanTenure != null) {
      data['loan_tenure'] = loanTenure!.map((v) => v.toJson()).toList();
    }
    data['interest_rate'] = interestRate;
    data['minimum_amount'] = minimumAmount;
    data['maximum_amount'] = maximumAmount;
    data['processing_fee'] = processingFee;
    data['other_fee'] = otherFee;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    return data;
  }
}

class LoanTenure {
  String? type;
  String? value;

  LoanTenure({this.type, this.value});

  LoanTenure.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    return data;
  }
}

class UserApprovalLoanInformation {
  int? id;
  int? userKycId;
  int? loanDetailsId;
  int? userId;
  int? loanId;
  int? agreed;
  String? agreedDate;
  String? paymentTransaction;
  String? payoutTime;
  String? reference;
  String? promissoryNote;
  String? agreement;
  String? loanDisbursement;
  String? noc;
  int? loanApprovalAmount;
  int? loanTakenAmount;
  String? interestRate;
  int? tenure;
  int? processingFees;
  int? otherFees;
  String? dueDateEveryMonth;
  int? loanStatus;

  UserApprovalLoanInformation(
      {this.id,
      this.userKycId,
      this.loanDetailsId,
      this.userId,
      this.loanId,
      this.agreed,
      this.agreedDate,
      this.paymentTransaction,
      this.payoutTime,
      this.reference,
      this.promissoryNote,
      this.agreement,
      this.loanDisbursement,
      this.noc,
      this.loanApprovalAmount,
      this.loanTakenAmount,
      this.interestRate,
      this.tenure,
      this.processingFees,
      this.otherFees,
      this.dueDateEveryMonth,
      this.loanStatus});

  UserApprovalLoanInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userKycId = json['user_kyc_id'];
    loanDetailsId = json['loan_details_id'];
    userId = json['user_id'];
    loanId = json['loan_id'];
    agreed = json['agreed'];
    agreedDate = json['agreed_date'];
    paymentTransaction = json['payment_transaction'];
    payoutTime = json['payout_time'];
    reference = json['reference'];
    promissoryNote = json['promissory_note'];
    agreement = json['agreement'];
    loanDisbursement = json['loan_disbursement'];
    noc = json['noc'];
    loanApprovalAmount = json['loan_approval_amount'];
    loanTakenAmount = json['loan_taken_amount'];
    interestRate = json['interest_rate'];
    tenure = json['tenure'];
    processingFees = json['processing_fees'];
    otherFees = json['other_fees'];
    dueDateEveryMonth = json['due_date_every_month'];
    loanStatus = json['loan_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_kyc_id'] = userKycId;
    data['loan_details_id'] = loanDetailsId;
    data['user_id'] = userId;
    data['loan_id'] = loanId;
    data['agreed'] = agreed;
    data['agreed_date'] = agreedDate;
    data['payment_transaction'] = paymentTransaction;
    data['payout_time'] = payoutTime;
    data['reference'] = reference;
    data['promissory_note'] = promissoryNote;
    data['agreement'] = agreement;
    data['loan_disbursement'] = loanDisbursement;
    data['noc'] = noc;
    data['loan_approval_amount'] = loanApprovalAmount;
    data['loan_taken_amount'] = loanTakenAmount;
    data['interest_rate'] = interestRate;
    data['tenure'] = tenure;
    data['processing_fees'] = processingFees;
    data['other_fees'] = otherFees;
    data['due_date_every_month'] = dueDateEveryMonth;
    data['loan_status'] = loanStatus;
    return data;
  }
}
