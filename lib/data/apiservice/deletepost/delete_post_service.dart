import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:socialmedia_app/core/api/constant_api.dart';
import 'package:socialmedia_app/core/url/constant_url.dart';

class DeletePostService {
  Future<void> deletePost(String postId) async {
    // Constants for API key, base URL, endpoint, and tokens
    const baseUrl = ConstantUrl.baseUrl;

    const apiKey = ConstantApi.apiKey;
    const endPoint = ConstantUrl.postUrl;
    const url = '$baseUrl$endPoint';
    const storage = FlutterSecureStorage();

    try {
      // Retrieve tokens from Flutter Secure Storage
      final accessToken = await storage.read(key: 'access_token');
      final refreshToken = await storage.read(key: 'refresh_token');

      // Construct endpoint URL

      // Define headers
      final headers = {
        "Content-Type": 'application/json',
        "x-api-key": apiKey,
        "x-access-token": accessToken ?? '',
        "x-refresh-token": refreshToken ?? ''
      };

      // Make DELETE request to delete post
      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({'postId': postId}), // Pass post ID in the body
      );

      // Check response status code
      if (response.statusCode == 200) {
        print("Post deleted successfully");
      } else {
        print("Failed to delete post. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        // Handle error response
      }
    } catch (e) {
      print("Exception occurred: $e");
      // Handle exception
    }
  }
}
