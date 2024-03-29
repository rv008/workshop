import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshop/app/post/list/data/get_post.dart';
import 'package:workshop/app/post/list/model/post.dart';

part 'get_post_event.dart';
part 'get_post_state.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  GetPostBloc(this.getPostService) : super(GetPostLoading()) {
    on<GetPost>(_onGetPost);
  }

  final GetPostService getPostService;

  Future<void> _onGetPost(GetPost event, Emitter<GetPostState> emit) async {
    emit(GetPostLoading());
    try {
      final result = await getPostService.getPosts();
      emit(GetPostLoaded(posts: result));
    } catch (_) {
      emit(GetPostError());
    }
  }
}
