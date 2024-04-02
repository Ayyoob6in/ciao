import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {
  PostBlocBloc() : super(PostBlocState()) {
    on<OnSelectedImageEvent>((_onselectImages));
    on<OnUnselectImageEvent>((_onUnselectedImages));
  }
  Future<void> _onselectImages(
      OnSelectedImageEvent event, Emitter<PostBlocState> emit) async {
    emit(state.copywith(images: event.images));
  }

  Future<void> _onUnselectedImages(
      OnUnselectImageEvent event, Emitter<PostBlocState> emit) async {
    emit(state.copywith(images: []));
  }
}
