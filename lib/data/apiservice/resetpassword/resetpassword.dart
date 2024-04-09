import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:socialmedia_app/core/api/constant_api.dart';
import 'package:socialmedia_app/core/url/constant_url.dart';
import 'package:socialmedia_app/data/model/newpassword/newpassword.dart';

class ResetPassword {
  static const String baseUrl = ConstantUrl.baseUrl;
  static const String resetPasswordUrl = ConstantUrl.reseypasswordUrl;

  static Future<ResetPasswordResponse?> resetPassword(String otp,
      String newPassword, String confirmNewPassword, String token) async {
    final url = Uri.parse('$baseUrl$resetPasswordUrl');

    // Encode the body parameter to JSON format
    final body = jsonEncode({
      'otp': otp,
      'password': newPassword,
      'confirmpassword': confirmNewPassword
    });

    try {
      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': ConstantApi.apiKey,
          'x-temp-token': token
        },
        body: body, // Pass the encoded body to the request
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final resetPasswordResponse =
            ResetPasswordResponse.fromJson(jsonResponse);
        return resetPasswordResponse;
      } else {
        log('Failed to reset password. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error while resetting password: $e');
    }
    return null;
  }
}
