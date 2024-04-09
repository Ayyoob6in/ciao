import 'dart:convert';

class AfterExecution {
  String? token;

  AfterExecution({this.token});

  factory AfterExecution.fromMap(Map<String, dynamic> data) {
    return AfterExecution(
      token: data['token'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AfterExecution].
  factory AfterExecution.fromJson(String data) {
    return AfterExecution.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AfterExecution] to a JSON string.
  String toJson() => json.encode(toMap());
}
