class PhoneNumberModel {
  List<PhoneNumberData>? data;

  PhoneNumberModel.fromJson(List<dynamic> json) {
    data =
        json.map((phoneData) => PhoneNumberData.fromJson(phoneData)).toList();
  }
}

class PhoneNumberData {
  String? phoneNumber;
  String? subscriptionId;
  String? networkName;

  PhoneNumberData.fromJson(Map<dynamic, dynamic> json) {
    phoneNumber = json["phoneNumber"];
    networkName = json["networkName"];
    subscriptionId = json["subscriptionId"];
  }
}
