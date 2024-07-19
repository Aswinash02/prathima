import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future<void> setLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", value);
  }

  Future<bool> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn") ?? false;
  }

  Future<void> setUserPhoneNo(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_phone", value);
  }

  Future<String> getUserPhoneNo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_phone") ?? "";
  }

  Future<void> setUserToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_token", value);
  }

  Future<String> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_token") ?? "";
  }
}