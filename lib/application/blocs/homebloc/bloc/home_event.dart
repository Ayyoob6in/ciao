part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchExplorePostEvent extends HomeEvent {}

class ExplorePostLoadedEvent extends HomeEvent {
  final ExplorePost explorePost;
  ExplorePostLoadedEvent(this.explorePost);
}

class ExplorePostErrorEvent extends HomeEvent {
  final String errorMessage;
  ExplorePostErrorEvent(this.errorMessage);
}
