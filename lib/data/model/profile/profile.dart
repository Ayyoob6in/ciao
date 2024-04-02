class UserData {
  int? statusCode;
  String? message;
  AfterExecution? afterExecution;

  UserData({this.statusCode, this.message, this.afterExecution});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      statusCode: json['status_code'],
      message: json['message'],
      afterExecution: json['after execution'] != null
          ? AfterExecution.fromJson(json['after execution'])
          : null,
    );
  }
}

class AfterExecution {
  String? name;
  String? username;
  int? postsCount;
  int? followersCount;
  int? followingCount;

  AfterExecution({
    this.name,
    this.username,
    this.postsCount,
    this.followersCount,
    this.followingCount,
  });

  factory AfterExecution.fromJson(Map<String, dynamic> json) {
    return AfterExecution(
      name: json['name'],
      username: json['username'],
      postsCount: json['posts_count'],
      followersCount: json['followers_count'],
      followingCount: json['following_count'],
    );
  }
}
