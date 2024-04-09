import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:socialmedia_app/core/api/constant_api.dart';
import 'package:socialmedia_app/core/url/constant_url.dart';
import 'package:socialmedia_app/data/model/forgot_password/forgot_password.dart'; // Import the ForgotPassword model

class ForgotPasswordService {
  static const String baseUrl = ConstantUrl.baseUrl;
  static const String forgotPasswordUrl = ConstantUrl.forgotpasswordUrl;
  static const String apiKey = ConstantApi.apiKey;

  static Future<void> storeTokens(
      String accessToken, String refreshToken) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'access_token', value: accessToken);
    await storage.write(key: 'refresh_token', value: refreshToken);
  }

  static Future<String?> getAccessToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'access_token');
  }

  static Future<String?> getRefreshToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'refresh_token');
  }

  Future<ForgotPassword> forgotPassword(String email) async {
    final url = Uri.parse('$baseUrl$forgotPasswordUrl');
    final body = {'email': email};
    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'x-api-key': apiKey,
          },
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        log(response.body.toString());
        return ForgotPassword.fromMap(jsonResponse);
      } else {
        throw Exception('Failed to send forgot password request');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to send forgot password request');
    }
  }
}
