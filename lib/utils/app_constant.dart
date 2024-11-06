class AppConstants {
  static const String baseUrl = "https://prathima.v4inspire.com";

  //end point
  static const String signInUrl = "/api/auth/login";
  static const String otpVerifyUrl = "/api/auth/verify-otp";
  static const String aadhaarVerifyUrl = "/api/loan/aadhaar-verify";
  static const String aadhaarOTPVerifyUrl = "/api/loan/aadhaar-otp-verify";
  static const String panVerifyUrl = "/api/loan/pan-verify";
  static const String kycStatusUrl = "/api/loan/kyc-status";
  static const String userKycDataUrl = "/api/loan/edit-kyc";
  static const String bankVerifyUrl = "/api/loan/bank-verify";
  static const String initialLoanAmountUrl = "/api/loan/initial-loan-amount";
  static const String updateKycUrl = "/api/loan/update-kyc";
  static const String userDataUrl = "/api/user/get";
  static const String editProfileUrl = "/api/loan/user-update";
  static const String approvedLoanUrl = "/api/loan/approved-loan";
  static const String userKycUrl = "/api/loan/user-kyc";
  static const String userContactUrl = "/api/user/contact-details";
  static const String userCallLogUrl = "/api/user/call-logs";
  static const String userSMSLogUrl = "/api/user/sms-details";
  static const String userInstalledAppUrl = "/api/user/app-details";
  static const String userLocationUrl = "/api/user/user-location";
  static const String pageUrl = "/api/pages";
  static const String supportsUrl = "/api/supports";
  static const String createTicketUrl = "/api/supports/store";
  static const String viewTicketUrl = "/api/supports/view";
  static const String messageUrl = "/api/supports/reply/store";
  static const String agreementUrl = "/api/business-settings";
  static const String loanTypeUrl = "/api/loans/type";
  static const String loansUrl = "/api/loans";
  static const String loanDetailUrl = "/api/loans/details";
  static const String checkLoanUrl = "/api/loans/check-loan-exists";
  static const String kycAmountPayUrl = "/api/kyc/amount-pay";
  static const String kycAmountPaidStatusUrl = "/api/kyc/amount-paid-status";
  static const String kycInfoUrl = "/api/kyc/get-informations";
}
