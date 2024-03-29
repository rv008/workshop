part of 'create_post_bloc.dart';

sealed class CreatePostEvent extends Equatable {
  const CreatePostEvent();
}

class CreatePost extends CreatePostEvent{
  const CreatePost(this.title, this.body);

  final String title;
  final String body;

  @override
  List<Object?> get props => [title, body];
}
