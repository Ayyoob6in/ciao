class PostResponse {
  int statusCode;
  String message;
  List<Post> posts;
  String afterExecution;

  PostResponse({
    required this.statusCode,
    required this.message,
    required this.posts,
    required this.afterExecution,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      statusCode: json['status_code'],
      message: json['message'],
      posts:
          List<Post>.from(json['after execution'].map((x) => Post.fromJson(x))),
      afterExecution: json['after execution'],
    );
  }
}

class Post {
  int postId;
  String caption;
  String postAge;
  List<String> mediaUrls;

  Post({
    required this.postId,
    required this.caption,
    required this.postAge,
    required this.mediaUrls,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postid'],
      caption: json['caption'],
      postAge: json['post-age'],
      mediaUrls: List<String>.from(json['media-urls'].map((x) => x)),
    );
  }
}
