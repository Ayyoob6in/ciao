import 'dart:convert';

import 'after_execution.dart';

class ExploreProfile {
  int? statusCode;
  String? message;
  AfterExecutionB? afterExecutionB;

  ExploreProfile({this.statusCode, this.message, this.afterExecutionB});

  factory ExploreProfile.fromMap(Map<String, dynamic> data) {
    return ExploreProfile(
      statusCode: data['status_code'] as int?,
      message: data['message'] as String?,
      afterExecutionB: data['after execution'] == null
          ? null
          : AfterExecutionB.fromMap(
              data['after execution'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status_code': statusCode,
        'message': message,
        'after execution': afterExecutionB?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExploreProfile].
  factory ExploreProfile.fromJson(String data) {
    return ExploreProfile.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExploreProfile] to a JSON string.
  String toJson() => json.encode(toMap());
}
