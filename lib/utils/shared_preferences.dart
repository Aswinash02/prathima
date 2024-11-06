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

  Future<void> setUserData(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_data", value);
  }

  Future<String> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_data") ?? "";
  }

  Future<void> setKYCAmountPayData(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("kyc_amount_pay_data", value);
  }

  Future<String> getKYCAmountPayData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("kyc_amount_pay_data") ?? "";
  }
}
