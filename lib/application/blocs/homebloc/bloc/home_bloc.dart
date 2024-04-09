import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:socialmedia_app/data/apiservice/profileexplore/profile_explore_service.dart';
import 'package:socialmedia_app/data/model/explorepost/explore_post/explore_post.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserExploreService userExploreService;

  HomeBloc(this.userExploreService) : super(HomeInitial()) {
    on<FetchExplorePostEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final explorePost = await userExploreService.explorePosts();
        if (explorePost != null) {
          emit(HomeLoadedState(explorePost));
        } else {
          emit(HomeErrorState("Failed to fetch explore posts."));
        }
      } catch (e) {
        emit(HomeErrorState("Error fetching explore posts: $e"));
      }
    });
  }
}
