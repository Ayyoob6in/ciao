import 'dart:convert';

class AfterExecutionB {
  int? userid;
  String? name;
  String? username;
  int? postsCount;
  int? followersCount;
  int? followingCount;
  bool? followingStatus;

  AfterExecutionB({
    this.userid,
    this.name,
    this.username,
    this.postsCount,
    this.followersCount,
    this.followingCount,
    this.followingStatus,
  });

  factory AfterExecutionB.fromMap(Map<String, dynamic> data) {
    return AfterExecutionB(
      userid: data['userid'] as int?,
      name: data['name'] as String?,
      username: data['username'] as String?,
      postsCount: data['posts_count'] as int?,
      followersCount: data['followers_count'] as int?,
      followingCount: data['following_count'] as int?,
      followingStatus: data['following_status'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'userid': userid,
        'name': name,
        'username': username,
        'posts_count': postsCount,
        'followers_count': followersCount,
        'following_count': followingCount,
        'following_status': followingStatus,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AfterExecutionB].
  factory AfterExecutionB.fromJson(String data) {
    return AfterExecutionB.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AfterExecutionB] to a JSON string.
  String toJson() => json.encode(toMap());
}
