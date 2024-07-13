import 'dart:convert';

import 'package:toast/toast.dart';

import '../customs/custom_toest.dart';
import '../helpers/api_helpers.dart';

class AuthRepositories{
  //
  //
  // Future getLoginResponse(
  //     String? email,
  //     String password,
  //     ) async {
  //   var post_body = jsonEncode({"email": "$email", "password": "$password"});
  //
  //   String url = ("${AppConfig.BASE_URL}/auth/login");
  //   final response = await ApiHelper.post(
  //       url: url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: post_body);
  //   print("login post response=======>${post_body}");
  //   print("login response=======>${response.body}");
  //   if (response.statusCode == 200) {
  //     print("status 200");
  //     SharedPreference().setLogin(true);
  //     Get.offAll(() => MainPage());
  //     return loginResponseFromJson(response.body);
  //   } else if (response.statusCode == 401) {
  //     print("status 401");
  //     ToastComponent.showDialog('Unauthorized',
  //         gravity: Toast.center, duration: Toast.lengthLong);
  //   }
  // }
}