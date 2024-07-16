import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetxService{
  final String baseUrl;
  ApiClient({required this.baseUrl});

  static Future<http.Response> get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    Uri uri = Uri.parse(url);
    if (queryParams != null && queryParams.isNotEmpty) {
      uri = uri.replace(
        queryParameters:
            queryParams.map((key, value) => MapEntry(key, value.toString())),
      );
    }

    Map<String, String> headerMap = commonHeader;
    if (headers != null) {
      headerMap.addAll(headers);
    }

    var response = await http.get(uri, headers: headerMap);
    return AIZApiResponse.check(response);
  }

  static Future<http.Response> post(
      {required String url,
      Map<String, String>? headers,
      required String body}) async {
    Uri uri = Uri.parse(url);
    Map<String, String>? headerMap = commonHeader;
    if (headers != null) {
      headerMap.addAll(headers);
    }
    var response = await http.post(uri, headers: headerMap, body: body);
    return AIZApiResponse.check(response);
  }

  static Future<http.Response> delete(
      {required String url, Map<String, String>? headers}) async {
    Uri uri = Uri.parse(url);
    Map<String, String>? headerMap = commonHeader;
    if (headers != null) {
      headerMap.addAll(headers);
    }
    var response = await http.delete(uri, headers: headerMap);
    return AIZApiResponse.check(response);
  }
}

Map<String, String> get commonHeader => {
      "Content-Type": "application/json",
      // "App-Language": app_language.$!,
      "Accept": "application/json",
      // "System-Key":AppConfig.system_key
    };

class AIZApiResponse {
  static http.Response check(http.Response response) {
    return response;
  }
}
