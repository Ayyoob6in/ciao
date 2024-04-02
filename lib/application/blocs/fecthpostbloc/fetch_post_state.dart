part of 'fetch_post_bloc.dart';

class FetchPostState {
  final List<dynamic> post;

  FetchPostState({required this.post});
}

final class FetchPostInitial extends FetchPostState {
  FetchPostInitial() : super(post: []);
}
