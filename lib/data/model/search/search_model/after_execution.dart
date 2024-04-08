import 'dart:convert';

class AfterExecution {
  int? userid;
  String? name;
  String? username;

  AfterExecution({this.userid, this.name, this.username});

  factory AfterExecution.fromMap(Map<String, dynamic> data) {
    return AfterExecution(
      userid: data['userid'] as int?,
      name: data['name'] as String?,
      username: data['username'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'userid': userid,
        'name': name,
        'username': username,
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
