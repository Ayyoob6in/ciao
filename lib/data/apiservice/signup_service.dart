import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:socialmedia_app/core/api/constant_api.dart';
import 'package:socialmedia_app/core/url/constant_url.dart';
import 'package:socialmedia_app/data/model/register/register_model.dart';

class RegisterApiService {
  static const String baseUrl = ConstantUrl.baseUrl;
  static const String apiKey =
      ConstantApi.apiKey; // Replace 'your_api_key' with your actual API key
  static const String accessTokenKey = 'x-temp-token';
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static Future<String?> getRegisterAccessToken() async {
    return await secureStorage.read(key: accessTokenKey);
  }

  static Future<void> setRegisterAccessToken(String token) async {
    await secureStorage.write(key: accessTokenKey, value: token);
  }

  static Future<void> removeRegisterAccessToken() async {
    await secureStorage.delete(key: accessTokenKey);
  }

  static Future<Map<String, String>> getHeaders() async {
    String? token = await getRegisterAccessToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'x-api-key': apiKey,
    };
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    var response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: await getHeaders(),
      body: jsonEncode(body),
    );
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> registerUser(
      RegisterModel registerData) async {
    final response = await post(
      '/signup',
      registerData.toJson(),
    );

    if (response.containsKey('token')) {
      await setRegisterAccessToken(response['token']);
    }

    return response;
  }
}
