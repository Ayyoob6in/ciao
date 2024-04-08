import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:socialmedia_app/core/api/constant_api.dart'; // Import the constant file with the API key
import 'package:socialmedia_app/core/url/constant_url.dart';
import 'package:socialmedia_app/data/model/login/login_model.dart';

class LoginService {
  static const String baseUrl = ConstantUrl.baseUrl;
  static const String loginUrl = ConstantUrl.loginUrl;
  static const String apiKey = ConstantApi.apiKey; // Add the API key constant

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

  static Future<LoginResponse> login(String email, String password) async {
    const String url = '$baseUrl$loginUrl';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': apiKey, // Add the API key to the headers
        },
        body:
            jsonEncode(LoginRequest(email: email, password: password).toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Parse the JSON response into a LoginResponse object
        LoginResponse loginResponse = LoginResponse.fromJson(jsonResponse);

        // Store the access token and refresh token
        await storeTokens(loginResponse.afterExecution.accessToken,
            loginResponse.afterExecution.refreshToken);

        return loginResponse;
      } else {
        print(response.statusCode);
        throw Exception('Failed to login');
      }
    } catch (e) {
      if (e is http.ClientException) {
        throw Exception('Network error: $e');
      } else {
        print(e.toString());

        throw Exception('Unexpected error: $e');
      }
    }
  }
}
