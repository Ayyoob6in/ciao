import 'dart:convert';

class UserUnlike {
  int? statusCode;
  String? message;

  UserUnlike({this.statusCode, this.message});

  factory UserUnlike.fromMap(Map<String, dynamic> data) => UserUnlike(
        statusCode: data['status_code'] as int?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'status_code': statusCode,
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserUnlike].
  factory UserUnlike.fromJson(String data) {
    return UserUnlike.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserUnlike] to a JSON string.
  String toJson() => json.encode(toMap());
}
