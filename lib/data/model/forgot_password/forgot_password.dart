import 'dart:convert';

import 'after_execution.dart';

class ForgotPassword {
  int? statusCode;
  String? message;
  AfterExecution? afterExecution;

  ForgotPassword({this.statusCode, this.message, this.afterExecution});

  factory ForgotPassword.fromMap(Map<String, dynamic> data) {
    return ForgotPassword(
      statusCode: data['status_code'] as int?,
      message: data['message'] as String?,
      afterExecution: data['after execution'] == null
          ? null
          : AfterExecution.fromMap(
              data['after execution'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status_code': statusCode,
        'message': message,
        'after execution': afterExecution?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ForgotPassword].
  factory ForgotPassword.fromJson(String data) {
    return ForgotPassword.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ForgotPassword] to a JSON string.
  String toJson() => json.encode(toMap());
}
