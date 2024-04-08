part of 'like_bloc.dart';

class LikeEvent {}

class LikePostEvent extends LikeEvent {
  final String postId;

  LikePostEvent({required this.postId});
}

class UnLikedEvent extends LikeEvent {}
