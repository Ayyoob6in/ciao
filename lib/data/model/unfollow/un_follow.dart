import 'dart:convert';

class UnFollow {
  int? statusCode;
  String? message;

  UnFollow({this.statusCode, this.message});

  factory UnFollow.fromMap(Map<String, dynamic> data) => UnFollow(
        statusCode: data['status_code'] as int?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'status_code': statusCode,
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UnFollow].
  factory UnFollow.fromJson(String data) {
    return UnFollow.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UnFollow] to a JSON string.
  String toJson() => json.encode(toMap());
}
