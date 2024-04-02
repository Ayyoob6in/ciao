import 'package:bloc/bloc.dart';
import 'package:socialmedia_app/data/apiservice/fetch_post.dart';

part 'fetch_post_event.dart';
part 'fetch_post_state.dart';

class FetchPostBloc extends Bloc<FetchPostEvent, FetchPostState> {
  FetchPostBloc() : super(FetchPostInitial()) {
    on<GetallPostEvent>((event, emit) async {
      final posts = await FetchPostService().fetchPosts();
      emit(FetchPostState(post: posts));
    });
  }
}
