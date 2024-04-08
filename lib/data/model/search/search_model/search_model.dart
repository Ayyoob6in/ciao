import 'dart:convert';

import 'after_execution.dart';

class SearchModel {
  int? statusCode;
  String? message;
  List<AfterExecution>? afterExecution;

  SearchModel({this.statusCode, this.message, this.afterExecution});

  factory SearchModel.fromMap(Map<String, dynamic> data) => SearchModel(
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
  /// Parses the string and returns the resulting Json object as [SearchModel].
  factory SearchModel.fromJson(String data) {
    return SearchModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
