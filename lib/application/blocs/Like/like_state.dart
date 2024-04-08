part of 'like_bloc.dart';

sealed class LikeState {}

class LikeInitial extends LikeState {}

class LikeSuccessState extends LikeState {
  final UserLike userLike;

  LikeSuccessState({required this.userLike});
}

class LikeFailureState extends LikeState {
  final String message;

  LikeFailureState({required this.message});
}
