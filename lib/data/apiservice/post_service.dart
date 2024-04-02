import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:socialmedia_app/core/api/constant_api.dart';
import 'package:socialmedia_app/core/url/constant_url.dart';
import '../model/post/post_model.dart';

class PostService {
  static const String baseUrl = ConstantUrl.baseUrl;
  static const String postUrl = ConstantUrl.postUrl;
  static const String apiKey = ConstantApi.apiKey;

  static Future<String?> getAccessToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'access_token');
  }

  static Future<String?> getRefreshToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'refresh_token');
  }

  static Future<PostModel?> createPost(
      String caption, List<String> mediaUrls) async {
    const String url = '$baseUrl$postUrl';
    final String? accessToken = await getAccessToken();
    final String? refreshToken = await getRefreshToken();
    print('Access Token: $accessToken');
    print('Refresh Token: $refreshToken');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Set headers
      request.headers['x-api-key'] = apiKey;
      request.headers['x-access-token'] = '$accessToken';
      request.headers['x-refresh-token'] = '$refreshToken';

      // Add caption
      request.fields['caption'] = caption;

      // Add media files
      for (int i = 0; i < mediaUrls.length; i++) {
        var url = mediaUrls[i];
        var multipartFile = await http.MultipartFile.fromPath(
          'media',
          url,
          contentType: MediaType('image', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      var response = await request.send();
      var responseString = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(responseString);
        var post = PostModel.fromJson(decodedJson);
        print(post);
        return post;
      } else {
        throw Exception(
            'Failed to create post. Status code: ${response.statusCode}${response.reasonPhrase}');
      }
    } on FormatException catch (e) {
      throw Exception('Error parsing response: $e');
    } catch (e) {
      throw Exception('Error creating post: $e');
    }
  }
}
