import 'package:bloc/bloc.dart';
import 'package:socialmedia_app/data/apiservice/like/like_service.dart';
import 'package:socialmedia_app/data/model/like/user_like.dart';

// Import your event and state classes
part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  final UserLikeService userLikeService;

  LikeBloc({required this.userLikeService}) : super(LikeInitial()) {
    on<LikePostEvent>((event, emit) async {
      try {
        final userLike = await userLikeService.like(event.postId);
        if (userLike != null) {
          emit(LikeSuccessState(userLike: userLike));
        } else {
          emit(LikeFailureState(message: 'Failed to like post.'));
        }
      } catch (e) {
        emit(LikeFailureState(message: 'Error: $e'));
      }
    });

    on<UnLikedEvent>((event, emit) {
      // Handle the UnLikedEvent
      // Add logic to handle unliking here if needed
    });
  }
}
