part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadedState extends HomeState {
  final ExplorePost explorePost;
  HomeLoadedState(this.explorePost);
}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}
