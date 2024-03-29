import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshop/app/post/create/data/create_post.dart';
import 'package:workshop/app/post/list/model/post.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc(this.createPostService) : super(CreatePostInitial()) {
    on<CreatePost>(_createPost);
  }

  final CreatePostService createPostService;

  Future<void> _createPost(
      CreatePost event, Emitter<CreatePostState> emit) async {
    emit(CreatePostLoading());
    try {
      final result =
          await createPostService.createPost(event.title, event.body);
      emit(CreatePostLoaded(newPost: result));
    } catch (_) {
      rethrow;
    }
  }
}
