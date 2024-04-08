import 'dart:convert';

class Follow {
  int? statusCode;
  String? message;

  Follow({this.statusCode, this.message});

  factory Follow.fromMap(Map<String, dynamic> data) => Follow(
        statusCode: data['status_code'] as int?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'status_code': statusCode,
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Follow].
  factory Follow.fromJson(String data) {
    return Follow.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Follow] to a JSON string.
  String toJson() => json.encode(toMap());
}
