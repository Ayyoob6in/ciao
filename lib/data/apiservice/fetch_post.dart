import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:socialmedia_app/core/api/constant_api.dart';
import 'package:socialmedia_app/core/url/constant_url.dart';
import 'dart:convert';

import 'package:socialmedia_app/data/model/fetch_post/fetch_post.dart'; // Import your Post and PostResponse models

class FetchPostService {
  Future<List<Post>> fetchPosts() async {
    // Replace this with your API endpoint
    const baseUrl = ConstantUrl.baseUrl;

    const apiKey = ConstantApi.apiKey;
    const endPoint = ConstantUrl.postUrl;
    const url = '$baseUrl$endPoint';

    // Create an instance of Flutter Secure Storage
    const storage = FlutterSecureStorage();

    try {
      // Retrieve tokens from Flutter Secure Storage
      final accessToken = await storage.read(key: 'access_token');
      final refreshToken = await storage.read(key: 'refresh_token');

      // Define headers
      final headers = {
        "x-api-key": apiKey,
        "x-access-token": accessToken ?? '',
        "x-refresh-token": refreshToken ?? ''
      };

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final jsonResponse = json.decode(response.body);

        // Access the value of the "after execution" field
        final List<dynamic> afterExecutionList =
            jsonResponse['after execution'];

        // Convert the afterExecutionList to a list of Post objects
        final List<Post> posts =
            afterExecutionList.map((json) => Post.fromJson(json)).toList();

        // Print the posts
        for (var post in posts) {
          print('Post ID: ${post.postId}');
          print('Caption: ${post.caption}');
          print('Post Age: ${post.postAge}');
          print('Media URLs: ${post.mediaUrls}');
          print('');
        }

        // Return the list of posts
        return posts;
      } else {
        // Handle errors
        print('Request failed with status: ${response.statusCode}');
        // Return an empty list in case of failure
        return [];
      }
    } catch (e) {
      // Handle exceptions
      print('Exception occurred: $e');
      // Return an empty list in case of exceptions
      return [];
    }
  }
}
