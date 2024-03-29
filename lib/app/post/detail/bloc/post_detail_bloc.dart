import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshop/app/post/detail/data/post_detail.dart';
import 'package:workshop/app/post/list/model/post.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  PostDetailBloc(this.postDetailService) : super(PostDetailLoading()) {
    on<GetPostDetail>(_onGetPostDetail);
  }

  final PostDetailService postDetailService;

  Future<void> _onGetPostDetail(GetPostDetail event, Emitter<PostDetailState> emit) async {
    emit(PostDetailLoading());
    try {
      final result = await postDetailService.getPostDetail(event.id);
      emit(PostDetailLoaded(post: result));
    } catch (_) {
      emit(PostDetailError());
    }
  }
}
