import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:socialmedia_app/core/api/constant_api.dart';
import 'package:socialmedia_app/core/url/constant_url.dart';

import 'dart:convert';

import 'package:socialmedia_app/data/model/signup_verify_model.dart';

class SignUpOtpVerifyService {
  static const String baseUrl = ConstantUrl.baseUrl;
  static const String apiKey = ConstantApi.apiKey;
  static const String verifyUrl = ConstantUrl.signupVerifyUrl;

  static Future<OtpVerificationResponse> verifyOtp(
      String token, String otp) async {
    const String url = '$baseUrl$verifyUrl';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-temp-token': token,
      'x-api-key': apiKey,
    };
    final Map<String, dynamic> body = {
      'otp': otp,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Extract access token and refresh token from the response

        String accessToken = jsonResponse['after execution']['accesstoken'];
        String refreshToken = jsonResponse['after execution']['refreshtoken'];

        // Store the access token and refresh token
        await storeTokens(accessToken, refreshToken);

        return OtpVerificationResponse.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to verify OTP');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<void> storeTokens(
      String accessToken, String refreshToken) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'access_token', value: accessToken);
    await storage.write(key: 'refresh_token', value: refreshToken);
  }
}
