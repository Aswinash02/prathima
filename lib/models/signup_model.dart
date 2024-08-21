class SignupResponse {
  String? message;
  User? user;
  String? token;
  bool? result;
  List? errors;

  SignupResponse({this.message, this.user, this.token, this.errors});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    result = json['result'];
    errors = json['errors'];
  }
}

class User {
  String? name;
  String? email;
  String? phoneNumber;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.name,
      this.email,
      this.phoneNumber,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
