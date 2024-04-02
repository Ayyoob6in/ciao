part of 'post_bloc_bloc.dart';

@immutable
abstract class PostBlocEvent {}

class OnSelectedImageEvent extends PostBlocEvent {
  final List<XFile> images;

  OnSelectedImageEvent(this.images);
}

class OnUnselectImageEvent extends PostBlocEvent {}
