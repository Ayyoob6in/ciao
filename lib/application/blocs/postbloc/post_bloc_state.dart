part of 'post_bloc_bloc.dart';

@immutable
class PostBlocState {
  final List<XFile>? images;

  PostBlocState({this.images});

  PostBlocState copywith({List<XFile>? images}) =>
      PostBlocState(images: images ?? this.images);
}
