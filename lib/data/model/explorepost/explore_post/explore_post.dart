import 'dart:convert';

import 'after_execution.dart';

class ExplorePost {
  int? statusCode;
  String? message;
  List<AfterExecution>? afterExecution;

  ExplorePost({this.statusCode, this.message, this.afterExecution});

  factory ExplorePost.fromMap(Map<String, dynamic> data) => ExplorePost(
        statusCode: data['status_code'] as int?,
        message: data['message'] as String?,
        afterExecution: (data['after execution'] as List<dynamic>?)
            ?.map((e) => AfterExecution.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status_code': statusCode,
        'message': message,
        'after execution': afterExecution?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExplorePost].
  factory ExplorePost.fromJson(String data) {
    return ExplorePost.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExplorePost] to a JSON string.
  String toJson() => json.encode(toMap());
}
