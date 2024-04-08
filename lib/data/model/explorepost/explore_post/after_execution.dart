import 'dart:convert';

class AfterExecution {
  int? userid;
  String? username;
  String? userprofileimageurl;
  int? postid;
  bool? likeStatus;
  String? caption;
  String? likesCount;
  String? commentsCount;
  String? postAge;
  List<String>? mediaUrls;

  AfterExecution({
    this.userid,
    this.username,
    this.userprofileimageurl,
    this.postid,
    this.likeStatus,
    this.caption,
    this.likesCount,
    this.commentsCount,
    this.postAge,
    this.mediaUrls,
  });

  factory AfterExecution.fromMap(Map<String, dynamic> data) {
    // Cast mediaUrls to List<dynamic> first, then map each item to String
    final List<dynamic>? mediaUrls = data['media-urls'];
    final List<String>? mediaUrlsStringList =
        mediaUrls?.map((url) => url as String).toList();

    return AfterExecution(
      userid: data['userid'] as int?,
      username: data['username'] as String?,
      userprofileimageurl: data['userprofileimageurl'] as String?,
      postid: data['postid'] as int?,
      likeStatus: data['like_status'] as bool?,
      caption: data['caption'] as String?,
      likesCount: data['likes_count'] as String?,
      commentsCount: data['comments_count'] as String?,
      postAge: data['post-age'] as String?,
      mediaUrls: mediaUrlsStringList,
    );
  }

  Map<String, dynamic> toMap() => {
        'userid': userid,
        'username': username,
        'userprofileimageurl': userprofileimageurl,
        'postid': postid,
        'like_status': likeStatus,
        'caption': caption,
        'likes_count': likesCount,
        'comments_count': commentsCount,
        'post-age': postAge,
        'media-urls': mediaUrls,
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
