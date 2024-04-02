import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:socialmedia_app/core/api/constant_api.dart';
import 'package:socialmedia_app/core/url/constant_url.dart';
import 'package:socialmedia_app/data/model/profile/profile.dart';

class ProfileApiService {
  static const String baseUrl = ConstantUrl.baseUrl;
  static const String endPoint = ConstantUrl.profileUrl;
  static const String apiKey = ConstantApi.apiKey;

  Future<UserData?> fetchUserProfile() async {
    final storage = FlutterSecureStorage();

    final String profileUrl = '$baseUrl$endPoint';

    try {
      final accessToken = await storage.read(key: 'access_token');
      final refreshToken = await storage.read(key: 'refresh_token');

      final response = await http.get(
        Uri.parse(profileUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'x-api-key': apiKey,
          'x-access-token': accessToken ?? '',
          'x-refresh-token': refreshToken ?? '',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return UserData.fromJson(jsonResponse);
      } else {
        print(
            'Failed to fetch user profile. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      return null;
    }
  }
}
