import 'dart:convert';

class UserLike {
  int? statusCode;
  String? message;

  UserLike({this.statusCode, this.message});

  factory UserLike.fromMap(Map<String, dynamic> data) => UserLike(
        statusCode: data['status_code'] as int?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'status_code': statusCode,
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserLike].
  factory UserLike.fromJson(String data) {
    return UserLike.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserLike] to a JSON string.
  String toJson() => json.encode(toMap());
}
