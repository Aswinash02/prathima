import 'dart:convert';

class ApprovedLoanModel {
  Loan? loan;
  String? principal;
  List<Details>? details;
  bool? isPaid;
  bool? status;
  String? message;
  String? payoutTime;

  ApprovedLoanModel({
    this.loan,
    this.principal,
    this.details,
    this.isPaid,
    this.status,
    this.message,
    this.payoutTime,
  });

  ApprovedLoanModel.fromJson(Map<String, dynamic> json) {
    loan = json['loan'] != null ? Loan.fromJson(json['loan']) : null;
    message = json['message'];
    status = json['status'];
    principal = json['principal'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
    isPaid = json['isPaid'];
    payoutTime = json['payout_time'];
  }
}

class Loan {
  int? id;
  int? loanId;
  String? approvedLoanAmount;
  String? startDate;
  List<DueDateInterestRate>? dueDateInterestRate;
  List<DueDateInterestRate>? userDueDateInterestRate;
  String? agreement;
  String? createdAt;
  String? updatedAt;
  String? user;

  Loan({
    this.id,
    this.loanId,
    this.approvedLoanAmount,
    this.startDate,
    this.dueDateInterestRate,
    this.userDueDateInterestRate,
    this.agreement,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  Loan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loanId = json['loan_id'];
    approvedLoanAmount = json['approved_loan_amount'];
    startDate = json['start_date'];
    if (json['due_date_interest_rate'] != null) {
      List<dynamic> decodedJson = jsonDecode(json['due_date_interest_rate']);
      dueDateInterestRate =
          decodedJson.map((e) => DueDateInterestRate.fromJson(e)).toList();
    }
    if (json['user_due_date_interest_rate'] != null) {
      List<dynamic> decodedJson =
          jsonDecode(json['user_due_date_interest_rate']);
      userDueDateInterestRate =
          decodedJson.map((e) => DueDateInterestRate.fromJson(e)).toList();
    }
    agreement = json['agreement'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'];
  }
}

class Details {
  int? interestRate;
  int? dueDays;
  int? totalInterest;
  int? totalRepayment;
  int? loanDuration;
  double? emi;
  List<EmiDetails>? emiDetails;
  int? profit;

  Details({
    this.interestRate,
    this.dueDays,
    this.totalInterest,
    this.totalRepayment,
    this.loanDuration,
    this.emi,
    this.emiDetails,
    this.profit,
  });

  Details.fromJson(Map<String, dynamic> json) {
    interestRate = _parseInt(json['interest_rate']);
    dueDays = _parseInt(json['due_days']);
    totalInterest = _parseInt(json['total_interest']);
    totalRepayment = _parseInt(json['total_repayment']);
    loanDuration = _parseInt(json['loan_duration']);
    emi = json['emi']?.toDouble();
    if (json['emi_details'] != null) {
      emiDetails = <EmiDetails>[];
      json['emi_details'].forEach((v) {
        emiDetails!.add(EmiDetails.fromJson(v));
      });
    }
    profit = _parseInt(json['profit']);
  }

  int? _parseInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt();
    } else {
      return null;
    }
  }
}

class EmiDetails {
  String? dueDate;
  double? emi;
  double? principal;
  int? interest;
  double? outstandingPrincipal;
  bool? isCurrent;
  String? notificationDate;

  EmiDetails({
    this.dueDate,
    this.emi,
    this.principal,
    this.interest,
    this.outstandingPrincipal,
    this.isCurrent,
    this.notificationDate,
  });

  EmiDetails.fromJson(Map<String, dynamic> json) {
    dueDate = json['due_date'];
    emi = json['emi']?.toDouble();
    principal = json['principal']?.toDouble();
    interest = json['interest']?.toInt();
    outstandingPrincipal = json['outstanding_principal']?.toDouble();
    isCurrent = json['is_current'];
    notificationDate = json['notification_date'];
  }
}

class DueDateInterestRate {
  String? interestRate;
  String? dueDate;

  DueDateInterestRate({this.interestRate, this.dueDate});

  DueDateInterestRate.fromJson(Map<String, dynamic> json) {
    interestRate = json['interest_rate'];
    dueDate = json['due_date'];
  }
}
