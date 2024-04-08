import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:socialmedia_app/core/api/constant_api.dart';
import 'package:socialmedia_app/core/url/constant_url.dart';
import 'package:http/http.dart' as http;
import 'package:socialmedia_app/data/model/follow/follow.dart';

class FollowService {
  static const String baseUrl = ConstantUrl.baseUrl;
  static const String endPoint = ConstantUrl.followUrl;
  static const String apiKey = ConstantApi.apiKey;

  Future<Follow?> followUser(String id) async {
    const storage = FlutterSecureStorage();

    String profileUrl = '$baseUrl$endPoint$id';

    try {
      final accessToken = await storage.read(key: 'access_token');
      final refreshToken = await storage.read(key: 'refresh_token');

      final response = await http.post(
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
        log(response.body);
        return Follow.fromMap(jsonResponse);
      } else {
        log('Failed to fetch user profile. Status code: ${response.statusCode}');
        log(response.body.toString());
        return null;
      }
    } catch (e) {
      log('Error fetching user profile: ${e.toString()}');
      return null;
    }
  }
}
