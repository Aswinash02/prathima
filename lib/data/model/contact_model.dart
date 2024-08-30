import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/services.dart';

class ContactData {
  String? displayName;
  String? givenName;
  String? middleName;
  String? prefix;
  String? suffix;
  String? familyName;
  String? company;
  String? jobTitle;
  List<Emails>? emails;
  List<Phones>? phones;
  List<PostalAddresses>? postalAddresses;
  Uint8List? avatar;
  String? birthday;
  String? androidAccountType;
  String? androidAccountTypeRaw;
  String? androidAccountName;

  ContactData(
      {this.displayName,
      this.givenName,
      this.middleName,
      this.prefix,
      this.suffix,
      this.familyName,
      this.company,
      this.jobTitle,
      this.emails,
      this.phones,
      this.postalAddresses,
      this.avatar,
      this.birthday,
      this.androidAccountType,
      this.androidAccountTypeRaw,
      this.androidAccountName});

  ContactData.fromJson(Contact json) {
    displayName = json.displayName;
    givenName = json.givenName;
    middleName = json.middleName;
    prefix = json.prefix;
    suffix = json.suffix;
    familyName = json.familyName;
    company = json.company;
    jobTitle = json.jobTitle;
    if (json.emails != null) {
      emails = <Emails>[];
      json.emails!.forEach((v) {
        emails!.add(Emails.fromJson(v));
      });
    }
    if (json.phones != null) {
      phones = <Phones>[];
      json.phones!.forEach((v) {
        phones!.add(Phones.fromJson(v));
      });
    }
    if (json.postalAddresses != null) {
      postalAddresses = <PostalAddresses>[];
      json.postalAddresses!.forEach((v) {
        postalAddresses!.add(PostalAddresses.fromJson(v));
      });
    }
    avatar = json.avatar;
    birthday = json.birthday.toString();
    androidAccountType = json.androidAccountType.toString();
    androidAccountTypeRaw = json.androidAccountTypeRaw;
    androidAccountName = json.androidAccountName;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['display_name'] = displayName;
    data['given_name'] = givenName;
    data['middle_name'] = middleName;
    data['prefix'] = prefix;
    data['suffix'] = suffix;
    data['family_name'] = familyName;
    data['company'] = company;
    data['job_title'] = jobTitle;
    if (emails != null) {
      data['emails'] = emails!.map((v) => v.toJson()).toList();
    }
    if (phones != null) {
      data['phones'] = phones!.map((v) => v.toJson()).toList();
    }
    if (postalAddresses != null) {
      data['postal_addresses'] =
          postalAddresses!.map((v) => v.toJson()).toList();
    }
    data['birthday'] = birthday;
    data['android_account_type'] = androidAccountType;
    data['android_account_type_raw'] = androidAccountTypeRaw;
    data['android_account_name'] = androidAccountName;
    return data;
  }
}

class Phones {
  String? label;
  String? value;

  Phones({this.label, this.value});

  Phones.fromJson(Item json) {
    label = json.label;
    value = json.value;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    return data;
  }
}

class Emails {
  String? label;
  String? value;

  Emails({this.label, this.value});

  Emails.fromJson(Item json) {
    print('email fromjson ------------');
    print('label ---------- > ${json.label}');
    print('label ---------- > ${json.value}');
    label = json.label;
    value = json.value;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    return data;
  }
}

class PostalAddresses {
  String? label;
  String? street;
  String? city;
  String? postcode;
  String? region;
  String? country;

  PostalAddresses(
      {this.label,
      this.street,
      this.city,
      this.postcode,
      this.region,
      this.country});

  PostalAddresses.fromJson(PostalAddress json) {
    label = json.label;
    street = json.street;
    city = json.city;
    postcode = json.postcode;
    region = json.region;
    country = json.country;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['street'] = street;
    data['city'] = city;
    data['postcode'] = postcode;
    data['region'] = region;
    data['country'] = country;
    return data;
  }
}
