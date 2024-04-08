import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static Future<String?> getAccessToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'access_token');
  }

  static Future<String?> getRefreshToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'refresh_token');
  }

  static Future<void> storeTokens(
      String accessToken, String refreshToken) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'access_token', value: accessToken);
    await storage.write(key: 'refresh_token', value: refreshToken);
  }
}
