class EditProfileModel {
  List? errors;

  EditProfileModel({this.errors});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
  }
}
